package projet.data;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Random;

public class GestionFactory {

	/////// SIMULATION DE LA PERSISTANCE DES ETUDIANTS ET DES ABSENCES
	
	// CHARGER en premier à l'execution du projet (car constante : static final)
	private static final HashMap<Integer, Etudiant> LISTE_ID_ETUDIANTS = intializeListEtudiants();
	private static final HashMap<Integer, Integer> LISTE_ID_ABSENCES = intializelistEtudiantAbsence();
	private static final ArrayList<Groupe> LISTE_GROUPES = intializeListGroups();

	// Initialisation des étudiants
	private static HashMap<Integer, Etudiant> intializeListEtudiants() {

		// Création des étudiants
		Etudiant etu1 = new Etudiant(0, "Brunet-Manquat", "Francis");
		Etudiant etu2 = new Etudiant(1, "Martin", "Philippe");

		// Création du hasmap (association clé/valeur)
		// Association id -> etudiant
		HashMap<Integer, Etudiant> listEtudiantsTemp = new HashMap<>();
		listEtudiantsTemp.put(etu1.getId(), etu1);
		listEtudiantsTemp.put(etu2.getId(), etu2);

		//
		return listEtudiantsTemp;
	}

	// Initialisation des absences
	private static final HashMap<Integer, Integer> intializelistEtudiantAbsence() {

		// Création du hasmap (association clé/valeur)
		// Association etudiant id -> absences
		HashMap<Integer, Integer> listEtudiantAbsenceTemp = new HashMap<>();
		
		// Le nombre d'absences est généré aléatoirement
		Random rand = new Random();
		for (Etudiant etudiant : LISTE_ID_ETUDIANTS.values()) {
			listEtudiantAbsenceTemp.put(etudiant.getId(), rand.nextInt(10));
		}

		//
		return listEtudiantAbsenceTemp;
	}

	// Initialisation des étudiants
	private static ArrayList<Groupe> intializeListGroups() {

		// Création des étudiants
		Groupe groupe1 = new Groupe();
		Groupe groupe2 = new Groupe();
		groupe1.setLibelle("A");
		groupe2.setLibelle("B");
		Collection<Etudiant> etudiants = getEtudiants();
		for (Etudiant etudiant : etudiants) {
			if (etudiant.getId()%2 == 1) {
				groupe1.addEtudiant(etudiant);
			} else {
				groupe2.addEtudiant(etudiant);
			}
		}

		ArrayList<Groupe> listGroupsTemp = new ArrayList<>();
		listGroupsTemp.add(groupe1);
		listGroupsTemp.add(groupe2);

		return listGroupsTemp;
	}

	
	/////// METHODES A UTILISER
	// Retourne l'ensemble des etudiants
	public static Collection<Etudiant> getEtudiants() {
		return LISTE_ID_ETUDIANTS.values();
	}

	// Retourne l'ensemble des groupes
	public static ArrayList<Groupe> getGroupes() {
		return LISTE_GROUPES;
	}

	// Retourne un étudiant en fonction de son id 
	public static Etudiant getEtudiantById(int id) {
		return LISTE_ID_ETUDIANTS.get(id);
	}

	// Retourne le nombre d'absences d'un etudiant en fonction de son id 
	public static Integer getAbsencesByEtudiantId(int id) {
		return LISTE_ID_ABSENCES.get(id);
	}

	public static Groupe getGroupeByLibelle(String libelle) {
		ArrayList<Groupe> groupes = getGroupes();
		for (Groupe groupe : getGroupes()) {
			if (groupe.getLibelle().compareTo(libelle) == 1) {
				return groupe;
			}
		}

		return null;
	}
}