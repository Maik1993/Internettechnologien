package beans;

import java.util.HashMap;
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
	
	//@ManagedProperty(value="#{kontakthandler.aktuelleKontaktdaten}")
	public Bestellung aktuelleBestellung;
	
	private String current_session;
	
	public BestellungHandler() {
		
	}
	
	public Bestellung getAktuelleBestellung() {
		return aktuelleBestellung;
	}

	public void setAktuelleBestellung() {
		
		
			//Setzte Bestellung falls vorhanden
			for(Bestellung b: this.bestellungen) {
				
				if(b.getKunde().getSessionId().equals(this.current_session)) {
					this.aktuelleBestellung = b;
					this.bestellungen.remove(b);
					break;
				}
			}
			//keine Bestellung vorhanden, neue Bestellung erstellen
			if(this.aktuelleBestellung==null) {
				this.aktuelleBestellung = new Bestellung();
				//Setzte neue Map für Bestellung
				this.aktuelleBestellung.setBestellung((new HashMap<String, Integer>()));
			}
			//Setze Kunde in Bestellung, falls nicht vorhanden
			if(this.aktuelleBestellung.getKunde()==null) {
				
				//prüfe ob Kunde vorhanden
				for(Kunde k : this.kunden) {
					
					if(k.getSessionId().equals(this.current_session)) {
						this.aktuelleBestellung.setKunde(k);
						break;
					}
					
				}
				//Wenn Kunde nicht vorhanden neuen anlegen
				if(this.aktuelleBestellung.getKunde()==null) {
					this.aktuelleBestellung.setKunde(new Kunde());
					this.aktuelleBestellung.getKunde().setSessionId(current_session);
				}
			}
		
		
	}
	
	public String hinzufuegen() {
		
		//Vererbe Liste initialisieren
		this.init();
		
		//Session-Id besorgen
		HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(true);
		this.current_session = session.getId();
		///?????
		Map<String,String> param_map = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
		String titel = param_map.get("titel");
		
		//Bestellung setzten
		if(this.aktuelleBestellung == null) {
			setAktuelleBestellung();
		}
		
		HashMap<String, Integer> bestellung = this.aktuelleBestellung.getBestellung();
		
		
		//Bestellung enthält Buchtitel		
		if(bestellung.containsKey(titel)) {
				bestellung.put(titel, bestellung.get(titel)+1);
		}//Nicht vorhandern, ersten Eintrag setzten
		else {
				bestellung.put(titel, 1);
		}	
		
		this.bestellungen.add(aktuelleBestellung);
			
		this.kvs.put(this.key_bestellung, this.json.toJson(this.bestellungen));
		
		return "warenkorb.xhtml";
	}
	
	
	public String speichern() {
		Logger.getAnonymousLogger().log(Level.INFO, "speichern() [1] mit " + aktuelleBestellung +  "' aufgerufen");
		
		BestellungDatenbank.getInstance().addBestellung(aktuelleBestellung);
		
		return "/ausgabe.xhtml";
	}
	
}
