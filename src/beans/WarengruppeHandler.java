package beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import datenbank.Buch;

@ManagedBean(name="wgHandler")
@SessionScoped

public class WarengruppeHandler extends Handler implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5028227231140477013L;
	private List<String> fachbereiche = new ArrayList<String>();
	private List<Buch> fachbereich_buecher;
	private String fachbereich;
	
	
	public WarengruppeHandler() {
		init();
		for(Buch b: this.buecher) {
			if(!fachbereiche.contains(b.getFachbereich())) {
				fachbereiche.add(b.getFachbereich());
			}
		}
		
	}

	public void setFachbereich(String fachbereich) {
		
		this.fachbereich = fachbereich;
		createFbBuecher();
	}
	
	private void createFbBuecher() {
		
		this.fachbereich_buecher = new ArrayList<Buch>();
		
		for(Buch b : this.buecher) {
			if(b.getFachbereich().equals(this.fachbereich)) {
				this.fachbereich_buecher.add(b);
			}
		}
		
	}
	
	public String getFachbereich() {
		return this.fachbereich;
	}
	
	public List<Buch> getFachbereich_buecher(){
		return this.fachbereich_buecher;
	}
	
	public List<String> getFachbereiche(){
		return fachbereiche;		
	}
	
}
