package bestellvorgang;

import java.io.Serializable;

public class Kunde implements Serializable{

	private static final long serialVersionUID = 2938766612729113061L;

	private String vorname;

	private String nachname;
	private String email;
	private String strasse;
	private String hausnummer;
	private String stadt;
	private String plz;
	
	private String kontoinhaber;
	private String bank;
	private String iban;
	
	private String sessionId;
	
	public Kunde() {
		
	}
	
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
	
	public String getStrasse() {
		return strasse;
	}

	public void setStrasse(String strasse) {
		this.strasse = strasse;
	}

	public String getHausnummer() {
		return hausnummer;
	}

	public void setHausnummer(String hausnummer) {
		this.hausnummer = hausnummer;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void clear() {
		this.bank ="";
		this.email ="";
		this.hausnummer ="";
		this.iban = "";
		this.kontoinhaber ="";
		this.nachname="";
		this.plz ="";
		this.sessionId ="";
		this.stadt = "";
		this.strasse ="";
		this.vorname="";
		// TODO Auto-generated method stub
		
	}	
}
