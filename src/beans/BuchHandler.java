package beans;

import java.io.Serializable;
import java.util.ArrayList;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;

import datenbank.Buch;

@ManagedBean(name = "bHandler")
@SessionScoped

public class BuchHandler extends Handler implements Serializable {
	private static final long serialVersionUID = -3728967773495326294L;

	private DataModel<Buch> buch;
	private String buch_titel;

	public BuchHandler() {
		
	}

	public void setBuch_titel(String titel) {
		
		if(this.buecher == null) {
			init();
		}
		
		this.buch_titel = titel;
		setBuch();
	}

	public String getBuch_titel() {
		return this.buch_titel;
	}

	private void setBuch() {

		this.buch = new ListDataModel<Buch>();
		ArrayList<Buch> attr_buch = new ArrayList<Buch>();

		for (Buch b : this.buecher) {
			if (b.getTitel().equals(this.buch_titel)) {
				
				attr_buch.add(b);
				this.buch.setWrappedData(attr_buch);
				
				break;
			}
		}
		
		

	}

	public DataModel<Buch> getBuch() {
		return this.buch;
	}

}
