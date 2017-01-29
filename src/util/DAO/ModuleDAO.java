package util.DAO;


import util.GestionFactory;
import util.entities.Module;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

public class ModuleDAO {

	public static Module create(String libelle) {
		EntityManager em = GestionFactory.factory.createEntityManager();

		em.getTransaction().begin();
		Module module = new Module();
		module.setLibelle(libelle);
		em.persist(module);
		em.getTransaction().commit();
		em.close();
		
		return module;
	}
	
	
	public static int removeAll() {
		EntityManager em = GestionFactory.factory.createEntityManager();

		em.getTransaction().begin();
		int deletedCount = em.createQuery("DELETE FROM Module").executeUpdate();
		em.getTransaction().commit();
		em.close();
		
		return deletedCount;
	}
	
	
	
	public static List<Module> getAll() {
		EntityManager em = GestionFactory.factory.createEntityManager();

		Query q = em.createQuery("SELECT m FROM Module m");
		@SuppressWarnings("unchecked")
		List<Module> modules = q.getResultList();
		
		return modules;
	}

	public static Module update(Module module) {
		EntityManager em = GestionFactory.factory.createEntityManager();
		em.getTransaction().begin();
		em.merge(module);
		em.getTransaction().commit();
		em.close();

		return module;
	}

	public static Module getModuleById(int id) {
		EntityManager em = GestionFactory.factory.createEntityManager();
		Module module = em.find(Module.class, id);

		em.close();

		return module;
	}
}
