package projet.data;


import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.Collection;
import java.util.List;

public class EtudiantDAO {

	
	public static Etudiant retrieveById(int id) {
		EntityManager em = GestionFactory.factory.createEntityManager();
		Etudiant etu = em.find(Etudiant.class, id);
	    em.close();
				
		return etu;
	}
	
	
	public static Etudiant create(String prenom, String nom, Groupe groupe) {
		EntityManager em = GestionFactory.factory.createEntityManager();
		em.getTransaction().begin();

		Etudiant etudiant = new Etudiant();
		etudiant.setPrenom(prenom);
		etudiant.setNom(nom);
		etudiant.setGroupe(groupe);
		em.persist(etudiant);

		em.getTransaction().commit();
		em.close();
		
		return etudiant;
	}
	
	public static Etudiant update(Etudiant etudiant) {
		EntityManager em = GestionFactory.factory.createEntityManager();
		em.getTransaction().begin();
		em.merge(etudiant);
		em.getTransaction().commit();
		em.close();
		
		return etudiant;
	}
	
	public static Etudiant addAbsences(int id, int absencesAAjouter) {
		EntityManager em = GestionFactory.factory.createEntityManager();
		Etudiant etudiant = em.find(Etudiant.class, id);
		em.getTransaction().begin();

		etudiant.setNbAbsences(etudiant.getNbAbsences() + absencesAAjouter);

		em.getTransaction().commit();
		em.close();
		
		return etudiant;
	}
	

	public static void remove(Etudiant etudiant) {
		EntityManager em = GestionFactory.factory.createEntityManager();
		em.getTransaction().begin();

		etudiant = em.find(Etudiant.class, etudiant.getId());
		em.remove(etudiant);

		em.getTransaction().commit();
		em.close();
	}

	public static void remove(int id) {
		EntityManager em = GestionFactory.factory.createEntityManager();
		em.getTransaction().begin();

		em.createQuery("DELETE FROM Etudiant AS e WHERE e.id = :id")
        .setParameter("id", id)
        .executeUpdate();

		em.getTransaction().commit();
		em.close();
	}
	
	public static int removeAll() {

		// Creation de l'entity manager
		EntityManager em = GestionFactory.factory.createEntityManager();

		//
		em.getTransaction().begin();
		
		// RemoveAll
		int deletedCount = em.createQuery("DELETE FROM Etudiant").executeUpdate();

		// Commit
		em.getTransaction().commit();
				
		// Close the entity manager
		em.close();

		return deletedCount;
	}

	// Retourne l'ensemble des etudiants
	public static List<Etudiant> getAll() {

		// Creation de l'entity manager
		EntityManager em = GestionFactory.factory.createEntityManager();
				
		// Recherche 
		Query q = em.createQuery("SELECT e FROM Etudiant e");

		@SuppressWarnings("unchecked")
		List<Etudiant> listEtudiant = q.getResultList();
		
		return listEtudiant;
	}

	// Retourne l'ensemble des etudiants d'un groupe donné
	public static List<Etudiant> getAllByAbsences() {
		
		// Creation de l'entity manager
		EntityManager em = GestionFactory.factory.createEntityManager();

		// Recherche 
		Query q = em.createQuery("SELECT e FROM Etudiant e WHERE e.nbAbsences > 0");

		@SuppressWarnings("unchecked")
		List<Etudiant> listEtudiant = q.getResultList();

		return listEtudiant;
	}

	public static Etudiant getEtudiantById(int id) {
		EntityManager em = GestionFactory.factory.createEntityManager();

		Etudiant etudiant = em.find(Etudiant.class, id);

		em.close();

		return etudiant;
	}
}
