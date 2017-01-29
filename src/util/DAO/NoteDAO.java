package util.DAO;


import util.GestionFactory;
import util.entities.Etudiant;
import util.entities.Module;
import util.entities.Note;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.Collection;
import java.util.List;

public class NoteDAO {

	public static Note create(Integer value, Integer coefficient, Etudiant etudiant, Module module) {
		EntityManager em = GestionFactory.factory.createEntityManager();

		em.getTransaction().begin();
		Note note = new Note();
		note.setValue(value);
		note.setCoefficient(coefficient);
		note.setEtudiant(etudiant);
		note.setModule(module);
		em.persist(note);
		em.getTransaction().commit();
		em.close();
		
		return note;
	}
	
	
	public static int removeAll() {
		EntityManager em = GestionFactory.factory.createEntityManager();

		em.getTransaction().begin();
		int deletedCount = em.createQuery("DELETE FROM Note").executeUpdate();
		em.getTransaction().commit();
		em.close();
		
		return deletedCount;
	}
	
	
	
	public static List<Note> getAll() {
		EntityManager em = GestionFactory.factory.createEntityManager();

		Query q = em.createQuery("SELECT n FROM Note n");
		@SuppressWarnings("unchecked")
		List<Note> notes = q.getResultList();
		
		return notes;
	}

	public static Note update(Note note) {
		EntityManager em = GestionFactory.factory.createEntityManager();
		em.getTransaction().begin();
		em.merge(note);
		em.getTransaction().commit();
		em.close();

		return note;
	}

	public static Note getNoteById(int id) {
		EntityManager em = GestionFactory.factory.createEntityManager();
		Note note = em.find(Note.class, id);

		em.close();

		return note;
	}
}
