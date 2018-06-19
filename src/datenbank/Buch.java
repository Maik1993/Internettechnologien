package datenbank;


public class Buch {
	
	private String Fachbereich;
	
	private String Titel;
	private String Autor;
	private String Preis;
	private String ISBN;
	private String Jahr;
	private String Auflage;
	private String Inhalt;
	private String Bild;
	
	public Buch(String fachbereich, String titel, String autor, String preis, String isbn, String jahr, String auflage, String inhalt, String bild) {
		this.Fachbereich = fachbereich;
		this.Titel = titel;
		this.Autor = autor;
		this.Preis = preis;
		this.ISBN = isbn;
		this.Jahr = jahr;
		this.Auflage = auflage;
		this.Inhalt = inhalt;	
		this.Bild = bild;
	}
	
	public String getBild() {
		return Bild;
	}

	public void setBild(String bild) {
		Bild = bild;
	}
	
	
	public String getFachbereich() {
		return Fachbereich;
	}

	public void setFachbereich(String fachbereich) {
		Fachbereich = fachbereich;
	}

	public String getTitel() {
		return Titel;
	}

	public void setTitel(String titel) {
		Titel = titel;
	}

	public String getAutor() {
		return Autor;
	}

	public void setAutor(String autor) {
		Autor = autor;
	}

	public String getPreis() {
		return Preis;
	}

	public void setPreis(String preis) {
		Preis = preis;
	}

	public String getISBN() {
		return ISBN;
	}

	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}

	public String getJahr() {
		return Jahr;
	}

	public void setJahr(String jahr) {
		Jahr = jahr;
	}

	public String getAuflage() {
		return Auflage;
	}

	public void setAuflage(String auflage) {
		Auflage = auflage;
	}

	public String getInhalt() {
		return Inhalt;
	}

	public void setInhalt(String inhalt) {
		Inhalt = inhalt;
	}

	public String toString() {
		return "{"+"Fachbereich"+":"+this.Fachbereich+","+"Titel"+":"+this.Titel+","+"Autor"+":"+this.Autor+","+"Preis"+":"+this.Preis+","+
				"ISBN"+":"+this.ISBN+","+"Jahr"+":"+this.Jahr+","+"Auflage"+":"+this.Auflage+","+"Inhalt"+":"+this.Inhalt+","+"Bild"+":"+this.Bild+"}";
	}

}
