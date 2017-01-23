package util.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

/**
 * Entity implementation class for Entity: Groupe
 *
 */
@Entity
public class Etudiant implements Serializable {

	@Id
	@GeneratedValue
	private Integer id;

	@Column(nullable=false)
	private String prenom;

	@Column(nullable=false)
	private String nom;

	@ManyToOne
	private Groupe groupe;

	@Column
	private int nbAbsences;
	
	@OneToMany(mappedBy="etudiant", fetch=FetchType.LAZY)
	private List<Note> notes;

	private static final long serialVersionUID = 1L;

	public Etudiant() {
		super();
	}
	
	public Etudiant(Integer id, String prenom, String nom, int nbAbsences) {
		super();
		this.id = id;
		this.prenom = prenom;
		this.nom = nom;
		this.nbAbsences = nbAbsences;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public Groupe getGroupe() {
		return groupe;
	}

	public void setGroupe(Groupe groupe) {
		this.groupe = groupe;
	}

	public int getNbAbsences() {
		return nbAbsences;
	}

	public void setNbAbsences(int nbAbsences) {
		this.nbAbsences = nbAbsences;
	}
}
