package projet.controleur;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projet.data.*;


@SuppressWarnings("serial")
public class Controleur extends HttpServlet {

    private String urlListe;
    private String urlDetails;
    private String urlListeGroupe;
    private String urlFormAddEtudiant;
    private String urlFormAddGroupe;

    // INIT
    public void init() throws ServletException {
        GestionFactory.open();
        urlListe = getServletConfig().getInitParameter("urlListe");
        urlDetails = getServletConfig().getInitParameter("urlDetails");
        urlListeGroupe = getServletConfig().getInitParameter("urlListeGroupe");
        urlFormAddEtudiant = getServletConfig().getInitParameter("urlFormAddEtudiant");
        urlFormAddGroupe = getServletConfig().getInitParameter("urlFormAddGroupe");
    }

    // POST
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        // on passe la main au GET
        doGet(request, response);
    }

    // GET
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        // On récupère la méthode d'envoi de la requête
        String methode = request.getMethod().toLowerCase();

        // On récupère l'action à exécuter
        String action = request.getPathInfo();
        if (action == null) {
            action = "/liste";
            System.out.println("action == null");
        }
        System.out.println(action);

        // Exécution action
        if (methode.equals("get") && action.equals("/liste")) {
            doListe(request, response);

        } else if (methode.equals("get") && action.equals("/details")) {
            doDetails(request, response);
        } else if (methode.equals("get") && action.equals("/listGroupe")) {
            doListGroupe(request, response);
        } else if (methode.equals("get") && action.equals("/addEtudiant")) {
            doAddEtudiant(request, response);
        } else if (methode.equals("get") && action.equals("/addGroupe")) {
            doAddGroupe(request, response);
        } else {
            // Autres cas
            doListe(request, response);
        }
    }

    private void doAddGroupe(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        loadJSP(urlFormAddGroupe, request, response);
    }

    private void doAddEtudiant(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url;

        if ( isValidRequestForAddEtudiant(request) ) {
            Groupe groupe = GroupeDAO.getGroupeByLibelle((String)request.getAttribute("groupe"));
            Etudiant etudiant = EtudiantDAO.create(
                    (String) request.getAttribute("prenom"),
                    (String)request.getAttribute("nom"),
                    groupe
            );

            groupe.addEtudiant(etudiant);
            GroupeDAO.update(groupe);

            url = urlListe;
        } else {
            Collection<Groupe> groupes = GroupeDAO.getAll();
            request.setAttribute("groupes", groupes);
            url = urlFormAddEtudiant;
        }

        loadJSP(url, request, response);
    }

    //
    private void doListe(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Collection<Groupe> groupes = GroupeDAO.getAll();
        Collection<Etudiant> etudiants = EtudiantDAO.getAll();
        request.setAttribute("etudiants", etudiants);
        request.setAttribute("groupes", groupes);

        loadJSP(urlListe, request, response);
    }

    //
    private void doDetails(HttpServletRequest request,
                           HttpServletResponse response) throws ServletException, IOException {
        // Récupérer l'attribut etudiant de la session

        int id = (Integer.parseInt(request.getParameter("id")));

        Etudiant etudiant = EtudiantDAO.getEtudiantById(id);
        Collection<Groupe> groupes = GroupeDAO.getAll();

        if (etudiant == null) {
            etudiant = new Etudiant();
        }

        request.setAttribute("etudiant", etudiant);
        request.setAttribute("groupe", etudiant.getGroupe());
        request.setAttribute("groupes", groupes);
        request.setAttribute("nbAbsences", etudiant.getNbAbsences());

        // Méthode qui transfère le contrôle à une autre servlet
        loadJSP(urlDetails, request, response);
    }

    private void doListGroupe(HttpServletRequest request,
                              HttpServletResponse response) throws ServletException, IOException {
        String libelle = request.getParameter("libelle");
        Collection<Groupe> groupes = GroupeDAO.getAll();
        Groupe groupe = GroupeDAO.getGroupeByLibelle(libelle);
        Collection<Etudiant> etudiants;
        try {
            etudiants = groupe.getEtudiants();
        } catch (Exception exception) {
            etudiants = null;
        }

        request.setAttribute("etudiants", etudiants);
        request.setAttribute("groupes", groupes);
        request.setAttribute("groupe", groupe);

        loadJSP(urlListeGroupe, request, response);
    }

    /**
     * Charge la JSP indiquée en paramètre
     *
     * @param url
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void loadJSP(String url, HttpServletRequest request,
                        HttpServletResponse response) throws ServletException, IOException {

//		L'interface RequestDispatcher permet de transférer le contrôle à une autre servlet
//		Deux méthodes possibles :
//		- forward() : donne le contrôle à une autre servlet. Annule le flux de sortie de la servlet courante
//		- include() : inclus dynamiquement une autre servlet
//			+ le contrôle est donné à une autre servlet puis revient à la servlet courante (sorte d'appel de fonction). 
//			+ Le flux de sortie n'est pas supprimé et les deux se cumulent

        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    public void destroy() {
        GestionFactory.close();
    }

    private boolean isValidRequestForAddEtudiant(HttpServletRequest request) {
        return request.getAttribute("prenom") != null &&
                request.getAttribute("nom") != null &&
                request.getAttribute("groupe") != null;

    }
}
