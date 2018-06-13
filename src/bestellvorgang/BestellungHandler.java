package bestellvorgang;

import java.util.logging.Level;
import java.util.logging.Logger;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;

@ManagedBean
@RequestScoped
public class BestellungHandler {
	
	//@ManagedProperty(value="#{kontakthandler.aktuelleKontaktdaten}")
	public Bestellung aktuelleBestellung = new Bestellung();
	
	public Bestellung getAktuelleBestellung() {
		return aktuelleBestellung;
	}

	public void setAktuelleBestellung(Bestellung aktuelleBestellung) {
		this.aktuelleBestellung = aktuelleBestellung;
	}
	
	public String speichern() {
		Logger.getAnonymousLogger().log(Level.INFO, "speichern() [1] mit " + aktuelleBestellung +  "' aufgerufen");
		
		BestellungDatenbank.getInstance().addBestellung(aktuelleBestellung);
		
		return "/ausgabe.xhtml";
	}
	
}
