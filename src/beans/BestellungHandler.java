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
	private List<String> titel;
	private String current_session;
	private String anz;

	public BestellungHandler() {

	}

	public String inc(String isbn) {
		System.out.println("Funktionsaufruf:increment");
		if (aktuelleBestellung != null) {
			
			HashMap<String, Integer> s = aktuelleBestellung.getBestellung();
			int i = s.get(isbn);
			i++;
			s.put(isbn, i);
			aktuelleBestellung.setBestellung(s);
		}
		return "warenkorb.xhtml";
	}

	public String dec(String isbn) {
		System.out.println("Funktionsaufruf:Decrement");

		if (aktuelleBestellung != null) {
			HashMap<String, Integer> s = aktuelleBestellung.getBestellung();
			int i = s.get(isbn);
			i--;
			s.put(isbn, i);
			aktuelleBestellung.setBestellung(s);
		}
		return "warenkorb.xhtml";
	}
	
	public String del(String isbn) {
		//toDo
		
		return "warenkorb.xhtml";
	}

	public List<String> getTitel() {

		if (this.aktuelleBestellung == null) {
			setAktuelleBestellung();
		}

		this.titel = new ArrayList<String>(this.aktuelleBestellung.getBestellung().keySet());
		return this.titel;
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
			// Setzte neue Map für Bestellung
			this.aktuelleBestellung.setBestellung((new HashMap<String, Integer>()));
		}
		// Setze Kunde in Bestellung, falls nicht vorhanden
		if (this.aktuelleBestellung.getKunde() == null) {

			// prüfe ob Kunde vorhanden
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
		String titel = param_map.get("titel");

		Buch akt_buch = null;

		for (Buch b : this.buecher) {
			if (b.getTitel().equals(titel)) {
				akt_buch = b;
			}
		}

		// Bestellung setzten
		if (this.aktuelleBestellung == null) {
			setAktuelleBestellung();
		}

		HashMap<String, Integer> bestellung = this.aktuelleBestellung.getBestellung();

		// Bestellung enthält Buchtitel
		if (bestellung.containsKey(titel)) {
			bestellung.put(titel, bestellung.get(titel) + 1);
		} // Nicht vorhandern, ersten Eintrag setzten
		else {
			bestellung.put(titel, 1);
		}

		this.aktuelleBestellung.setGesammtsumme(akt_buch.getPreis());

		this.bestellungen.add(aktuelleBestellung);

		this.kvs.put(this.key_bestellung, this.json.toJson(this.bestellungen));

		return "warenkorb.xhtml";
	}

	public String speichern() {
		Logger.getAnonymousLogger().log(Level.INFO, "speichern() [1] mit " + aktuelleBestellung + "' aufgerufen");

		BestellungDatenbank.getInstance().addBestellung(aktuelleBestellung);

		return "/ausgabe.xhtml";
	}

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
