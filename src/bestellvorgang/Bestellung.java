package bestellvorgang;

import java.io.Serializable;
import java.util.Map;

import datenbank.Buch;


public class Bestellung implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Kunde kunde;
	
	private Map<String, Integer> bestellung;
	
	public Map<String, Integer> getBestellung() {
		return bestellung;
	}

	public void setBestellung(Map<String, Integer> bestellung) {
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
