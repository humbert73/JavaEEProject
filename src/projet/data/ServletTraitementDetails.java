package projet.data;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/servlettraitementdetails")
public class ServletTraitementDetails extends HttpServlet {

	// POST
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// on passe la main au GET
		doGet(request, response);
	}

	// GET
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		// Récupérer l'attribut etudiant de la session
		int id = (Integer.parseInt(request.getParameter("id")));
		Integer nbAbsences = GestionFactory.getAbsencesByEtudiantId(id);
		Etudiant etudiant = GestionFactory.getEtudiantById(id);

		if (etudiant == null) {
			etudiant = new Etudiant();
		}

		request.setAttribute("etudiant", etudiant);
		request.setAttribute("nbAbsences", nbAbsences);

		// Méthode qui transfère le contrôle à une autre servlet
		loadJSP("/detail.jsp", request, response);
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
	public void loadJSP(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// L'interface RequestDispatcher permet de transférer le contrôle à une
		// autre servlet
		// Deux méthodes possibles :
		// - forward() : donne le contrôle à une autre servlet. Annule le flux
		// de sortie de la servlet courante
		// - include() : inclus dynamiquement une autre servlet
		// + le contrôle est donné à une autre servlet puis revient à la servlet
		// courante (sorte d'appel de fonction).
		// + Le flux de sortie n'est pas supprimé et les deux se cumulent

		ServletContext sc = getServletContext();
		RequestDispatcher rd = sc.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
