package projet.data;


import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

public class GroupeDAO {

	public static Groupe create(String nom) {
		EntityManager em = GestionFactory.factory.createEntityManager();

		em.getTransaction().begin();
		Groupe groupe = new Groupe();
		groupe.setLibelle(nom);
		em.persist(groupe);
		em.getTransaction().commit();
		em.close();
		
		return groupe;
	}
	
	
	public static int removeAll() {
		EntityManager em = GestionFactory.factory.createEntityManager();

		em.getTransaction().begin();
		int deletedCount = em.createQuery("DELETE FROM Groupe").executeUpdate();
		em.getTransaction().commit();
		em.close();
		
		return deletedCount;
	}
	
	
	
	public static List<Groupe> getAll() {
		EntityManager em = GestionFactory.factory.createEntityManager();

		Query q = em.createQuery("SELECT g FROM Groupe g");
		@SuppressWarnings("unchecked")
		List<Groupe> listGroupe = q.getResultList();
		
		return listGroupe;
	}

	public static Groupe getGroupeByLibelle(String libelle) {
		EntityManager em = GestionFactory.factory.createEntityManager();
		Query q = em.createQuery("SELECT g FROM Groupe g WHERE libelle='"+libelle+"'");
		Groupe groupe = (Groupe)q.getSingleResult();

		return groupe;
	}

	public static Groupe update(Groupe groupe) {
		EntityManager em = GestionFactory.factory.createEntityManager();
		em.getTransaction().begin();
		em.merge(groupe);
		em.getTransaction().commit();
		em.close();

		return groupe;
	}
}
