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
	
	private String isbn;

	public BuchHandler() {
		
	}
	
	
	
	public String getPreis() {
		return this.buch.getRowData().getPreis();
	}
		
	public void setIsbn(String ISBN) {
		
		if(this.buecher == null) {
			init();
		}
		
		this.isbn = ISBN;
		setBuch();
	}
	
	public String getIsbn() {
		return this.buch.getRowData().getISBN();
	}

	public String getTitel() {
		return this.buch.getRowData().getTitel();
	}

	
	private void setBuch() {

		this.buch = new ListDataModel<Buch>();
		ArrayList<Buch> attr_buch = new ArrayList<Buch>();

		for (Buch b : this.buecher) {
			if (b.getISBN().equals(this.isbn)) {
				
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
