package bestellvorgang;

import java.io.Serializable;
import java.util.HashMap;


public class Bestellung implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Kunde kunde;
	
	private double gesammtsumme = 0;
	
	public String getGesammtsumme() {
		
		this.gesammtsumme = (double) Math.round((this.gesammtsumme*100))/100;
			
		return String.valueOf(this.gesammtsumme);
	}

	public void setGesammtsumme(String gesammtsumme, String op) {
		if(op.equals("add")) {
			this.gesammtsumme = this.gesammtsumme +=  Double.valueOf(gesammtsumme);
		}
		else if(op.equals("sub")) {
			this.gesammtsumme = this.gesammtsumme -=  Double.valueOf(gesammtsumme);
		}
		
	}

	private HashMap<String, Integer> bestellung;
	
	public HashMap<String, Integer> getBestellung() {
		return bestellung;
	}

	public void setBestellung(HashMap<String, Integer> bestellung) {
		this.bestellung = bestellung;
	}

	public Bestellung() {		
	}

	
	public Kunde getKunde() {
		return kunde;
	}

	public void setKunde(Kunde kunde) {
		this.kunde = kunde;
	}

	public void clear() {
		this.kunde.clear();
		this.bestellung.clear();
		
		// TODO Auto-generated method stub
		
	}

	
	

	
}
