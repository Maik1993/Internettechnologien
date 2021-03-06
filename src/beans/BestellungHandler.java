package beans;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

import bestellvorgang.Bestellung;
import bestellvorgang.BestellungDatenbank;
import bestellvorgang.Kunde;
import datenbank.Buch;

@ManagedBean
@RequestScoped
public class BestellungHandler extends Handler {

	public Bestellung aktuelleBestellung;
	private List<String> isbn;
	private String current_session;
	private String anz;
	private Map<String, String> requestParameterMap;
	private Buch buch ;
	
	
	
	
	private void setBuch(String isbn) {
		
		for(Buch b: this.buecher) {
			if(b.getISBN().equals(isbn)) {
				this.buch = b;
			}
		}
	}
	
	
	
	public BestellungHandler() {

	}

	
	
	
	
	public String inc() {

		this.requestParameterMap = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();

		String isbn = this.requestParameterMap.get("isbn");
		setBuch(isbn);

		if (aktuelleBestellung == null) {
			setAktuelleBestellung();
		}

		Map<String, Integer> bestellung = this.aktuelleBestellung.getBestellung();
		int anzahl = bestellung.get(isbn) + 1;
		bestellung.put(isbn, anzahl);
		this.aktuelleBestellung.setGesammtsumme(this.buch.getPreis(), "add");
		this.bestellungen.add(aktuelleBestellung);
		this.kvs.put(this.key_bestellung, this.json.toJson(this.bestellungen));
		return "warenkorb.xhtml";
	}

	
	
	
	
	public String dec() {

		this.requestParameterMap = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();

		String isbn = this.requestParameterMap.get("isbn");
		setBuch(isbn);
		
		if (aktuelleBestellung == null) {
			setAktuelleBestellung();
		}
		Map<String, Integer> bestellung = this.aktuelleBestellung.getBestellung();
		
		int anzahl = bestellung.get(isbn);
		
		if (anzahl >  1) {
			bestellung.put(isbn, aktuelleBestellung.getBestellung().get(isbn) - 1);
			this.aktuelleBestellung.setGesammtsumme(this.buch.getPreis(), "sub");
			this.bestellungen.add(aktuelleBestellung);
			this.kvs.put(this.key_bestellung, this.json.toJson(this.bestellungen));
		}
		else if(bestellung.get(isbn) == 1) {
			del();
		}

		return "warenkorb.xhtml";
	}

	
	
	public String del() {
		
		this.requestParameterMap = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
		
		String isbn = this.requestParameterMap.get("isbn");	
		setBuch(isbn);
		
		if(this.aktuelleBestellung==null) {
			setAktuelleBestellung();
		}
		Map<String, Integer> bestellung = this.aktuelleBestellung.getBestellung();
		
		int anzahl = bestellung.get(isbn);
		
		this.aktuelleBestellung.setGesammtsumme(String.valueOf(Double.parseDouble(this.buch.getPreis())*anzahl), "sub");
		bestellung.remove(isbn);
		
		this.bestellungen.add(aktuelleBestellung);
		kvs.put(this.key_bestellung, this.json.toJson(this.bestellungen));
		return "warenkorb.xhtml";
	}

	
	
	
	
	public List<String> getIsbn() {

		if (this.aktuelleBestellung == null) {
			setAktuelleBestellung();
		}

		this.isbn = new ArrayList<String>(this.aktuelleBestellung.getBestellung().keySet());
		return this.isbn;
	}

	
	
	
	
	private void setSessionId() {
		// Session-Id besorgen
		HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(true);
		this.current_session = session.getId();
	}
	
	
	
	
	

	public Bestellung getAktuelleBestellung() {
		return aktuelleBestellung;
	}
	
	
	
	
	
	

	public String setAktuelleBestellung() {

		if (this.bestellungen == null) {
			init();
		}

		setSessionId();

		// Setzte Bestellung falls vorhanden
		for (Bestellung b : this.bestellungen) {

			if (b.getKunde().getSessionId().equals(this.current_session)) {
				this.aktuelleBestellung = b;
				this.bestellungen.remove(b);
				break;
			}
		}
		// keine Bestellung vorhanden, neue Bestellung erstellen
		if (this.aktuelleBestellung == null) {
			this.aktuelleBestellung = new Bestellung();
			// Setzte neue Map f�r Bestellung
			this.aktuelleBestellung.setBestellung((new HashMap<String, Integer>()));
		}
		// Setze Kunde in Bestellung, falls nicht vorhanden
		if (this.aktuelleBestellung.getKunde() == null) {

			// pr�fe ob Kunde vorhanden
			for (Kunde k : this.kunden) {

				if (k.getSessionId().equals(this.current_session)) {
					this.aktuelleBestellung.setKunde(k);
					break;
				}

			}
			// Wenn Kunde nicht vorhanden neuen anlegen
			if (this.aktuelleBestellung.getKunde() == null) {
				this.aktuelleBestellung.setKunde(new Kunde());
				this.aktuelleBestellung.getKunde().setSessionId(current_session);
			}
		}

		return "warenkorb.xhtml";
	}
	
	
	
	
	
	

	public String hinzufuegen() {

		if (this.buecher == null) {
			init();
		}

		setSessionId();

		Map<String, String> param_map = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
		String isbn = param_map.get("isbn");

		setBuch(isbn);

		// Bestellung setzten
		if (this.aktuelleBestellung == null) {
			setAktuelleBestellung();
		}

		HashMap<String, Integer> bestellung = this.aktuelleBestellung.getBestellung();

		// Bestellung enth�lt Buchtitel
		if (bestellung.containsKey(isbn)) {
			bestellung.put(isbn, bestellung.get(isbn) + 1);
		} // Nicht vorhandern, ersten Eintrag setzten
		else {
			bestellung.put(isbn, 1);
		}

		this.aktuelleBestellung.setGesammtsumme(this.buch.getPreis(), "add");

		this.bestellungen.add(aktuelleBestellung);

		this.kvs.put(this.key_bestellung, this.json.toJson(this.bestellungen));

		return "warenkorb.xhtml";
	}
	
	
	
	
	
	/*
	public String speichern() {
		Logger.getAnonymousLogger().log(Level.INFO, "speichern() [1] mit " + aktuelleBestellung + "' aufgerufen");

		BestellungDatenbank.getInstance().addBestellung(aktuelleBestellung);

		return "/ausgabe.xhtml";
	}
	 */
	
	
	
	
	public String getAnz() {
		return anz;
	}
	
	
	

	public void setAnz(String anz) {
		System.out.println("Set anz: " + anz);
		this.anz = anz;
	}

	
	
	
	
	public String bestellungEnde() {
		String kb = this.key_bestellung;
		this.aktuelleBestellung.getBestellung().clear();
		this.kvs.put(kb, this.json.toJson(this.bestellungen));

		return "ende.xhtml";
	}
}
