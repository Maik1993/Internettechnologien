package bestellvorgang;

import java.io.Serializable;
import java.util.HashMap;


public class Bestellung implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Kunde kunde;
	
	private double gesammtsumme = 0;
	
	public String getGesammtsumme() {
		return String.valueOf(this.gesammtsumme);
	}

	public void setGesammtsumme(String gesammtsumme) {
		this.gesammtsumme = this.gesammtsumme +=  Double.valueOf(gesammtsumme);
		
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
	/*
	public Bestellung(Buch[] bücher) {
		this.setBücher(bücher);
	}
	*/
	
	/*
	 * Getter und Setter 
	 * Kontaktdaten
	 */
	
	public Kunde getKunde() {
		return kunde;
	}

	public void setKunde(Kunde kunde) {
		this.kunde = kunde;
	}

	
	
	/*
	 * Bezahlungsart
	 */

/*
	public Buch[] getBücher() {
		return bücher;
	}

	public void setBücher(Buch[] bücher) {
		this.bücher = bücher;
	}

*/
	
}
