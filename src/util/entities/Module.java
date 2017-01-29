package util.entities;


import javax.persistence.*;
import java.io.Serializable;

/**
 * Entity implementation class for Entity: Groupe
 *
 */
@Entity
public class Module implements Serializable {

	@Id
	@GeneratedValue
	private Integer id;

	@Column()
	private String libelle;

	private static final long serialVersionUID = 1L;

	public Module() {
		super();
	}

	public Module(Integer id, String libelle) {
		super();
		this.id = id;
		this.libelle = libelle;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}
}
