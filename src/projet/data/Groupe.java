package projet.data;

import java.util.ArrayList;
import java.util.Collection;

public class Groupe {
	
	private String libelle;
	private Collection<Etudiant> etudiants;
	
	public Groupe() {
		this.etudiants = new ArrayList<>();
	}
	
	public Groupe(String libelle, Collection<Etudiant> etudiants) {
		this.libelle = libelle;
		this.etudiants = etudiants;
	}

	public String getLibelle() {
		return libelle;
	}

	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	public Collection<Etudiant> getEtudiants() {
		return etudiants;
	}

	public void setEtudiants(Collection<Etudiant> etudiants) {
		this.etudiants = etudiants;
	}

	public void addEtudiant(Etudiant etudiant) {
		Collection<Etudiant> etudiants = this.getEtudiants();
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
