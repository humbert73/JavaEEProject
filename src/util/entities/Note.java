package util.entities;


import java.io.Serializable;
import java.lang.Integer;


import javax.persistence.*;

/**
 * Entity implementation class for Entity: Groupe
 *
 */
@Entity
public class Note implements Serializable {

	@Id
	@GeneratedValue
	private Integer id;

	@Column()
	private Integer value;

	@ManyToOne
	private Etudiant etudiant;

	@Column()
	private Integer coefficient;

	private static final long serialVersionUID = 1L;

	public Note() {
		super();
	}
	
	public Note(Integer id, Integer value, Etudiant etudiant) {
		super();
		this.id = id;
		this.value = value;
		this.etudiant = etudiant;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}

	public Etudiant getEtudiant() {
		return etudiant;
	}

	public void setEtudiant(Etudiant etudiant) {
		this.etudiant = etudiant;
	}

	public Integer getCoefficient() {
		return coefficient;
	}

	public void setCoefficient(Integer coefficient) {
		this.coefficient = coefficient;
	}

	
}
