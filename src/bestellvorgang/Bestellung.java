package bestellvorgang;

import java.io.Serializable;
import java.util.Date;



import datenbank.Buch;


public class Bestellung implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String vorname;
	private String nachname;
	private String email;
	private String adresse;
	private String stadt;
	private String plz;
	
	private String kontoinhaber;
	private String bank;
	private String iban;
	
	private Buch[] bücher;
	
	public Bestellung() {		
	}
	
	public Bestellung(Buch[] bücher) {
		this.setBücher(bücher);
	}
	
	
	/*
	 * Getter und Setter 
	 * Kontaktdaten
	 */
	
	public String getVorname() {
		return vorname;
	}

	public void setVorname(String vorname) {
		this.vorname = vorname;
	}
	
	public String getNachname() {
		return nachname;
	}

	public void setNachname(String nachname) {
		this.nachname = nachname;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getStadt() {
		return stadt;
	}

	public void setStadt(String stadt) {
		this.stadt = stadt;
	}

	public String getPlz() {
		return plz;
	}

	public void setPlz(String plz) {
		this.plz = plz;
	}
	
	/*
	 * Bezahlungsart
	 */


	public Buch[] getBücher() {
		return bücher;
	}

	public void setBücher(Buch[] bücher) {
		this.bücher = bücher;
	}

	public String getKontoinhaber() {
		return kontoinhaber;
	}

	public void setKontoinhaber(String kontoinhaber) {
		this.kontoinhaber = kontoinhaber;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getIban() {
		return iban;
	}

	public void setIban(String iban) {
		this.iban = iban;
	}
	
}
