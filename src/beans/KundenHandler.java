package beans;

import java.util.ArrayList;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

import bestellvorgang.Kunde;

@ManagedBean(name="kHandler")
@SessionScoped
public class KundenHandler extends Handler{
	private Kunde kunde;
	
	public KundenHandler() {
		this.kunde = new Kunde();
	}
	
	public Kunde getKunde() {
		return this.kunde;
	}
	
	public String save() {
		
		if(this.kunden == null) {
			this.kunden = new ArrayList<Kunde>();
		}
		
		HttpSession fc = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(true);
		
		this.kunde.setSessionId(fc.getId());
		
		this.kunden.add(this.kunde);
		this.kvs.put(this.key_kunde, this.json.toJson(this.kunden));
		
		return "ausgabeBestellung.xhtml";
	}
	
}
