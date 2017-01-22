package projet.data;


import java.io.Serializable;
import java.lang.Integer;
import java.lang.String;
import java.util.List;
import java.util.Collection;


import javax.persistence.*;

/**
 * Entity implementation class for Entity: Groupe
 *
 */
@Entity
public class Groupe implements Serializable {

	@Id
	@GeneratedValue
	private Integer id;

	@Column(unique=true, nullable=false)
	private String libelle;

	@OneToMany(mappedBy="groupe", fetch=FetchType.LAZY)	// LAZY = fetch when needed, EAGER = fetch immediately
	private List<Etudiant> etudiants;

	private static final long serialVersionUID = 1L;

	public Groupe() {
		super();
	}
	
	public Groupe(Integer id, String libelle, List<Etudiant> etudiants) {
		this.id = id;
		this.libelle = libelle;
		this.etudiants = etudiants;
	}

	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	public List<Etudiant> getEtudiants() {
		return etudiants;
	}

	public void setEtudiants(List<Etudiant> etudiants) {
		this.etudiants = etudiants;
	}

	public void addEtudiant(Etudiant etudiant) {
		List<Etudiant> etudiants = this.getEtudiants();
		if (! etudiants.contains(etudiant)) {
			this.getEtudiants().add(etudiant);
			etudiant.setGroupe(this);
		}
	}

	public void removeEtudiant(Etudiant etudiant) {
		Collection<Etudiant> etudiants = this.getEtudiants();
		if (etudiants.contains(etudiant)) {
			this.getEtudiants().remove(etudiant);
			etudiant.setGroupe(null);
		}
	}
}
