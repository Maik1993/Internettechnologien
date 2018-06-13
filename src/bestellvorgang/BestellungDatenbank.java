package bestellvorgang;

import java.util.LinkedList;
import java.util.List;

public class BestellungDatenbank {
	
	private static LinkedList<Bestellung> bestellungen;
	private static BestellungDatenbank database;
	
	private BestellungDatenbank() {
		bestellungen = new LinkedList<Bestellung>();
	}
	
	public static synchronized BestellungDatenbank getInstance()
	  {
	    if ( database == null )
	      database = new BestellungDatenbank();
	    return database;
	  }
	public List<Bestellung> getBestellunge() {
		return bestellungen;
	}
	
	public void addBestellung(Bestellung bestellung) {
		bestellungen.add(bestellung);
		System.out.println("bestellung ist gespeichert " + bestellungen.size());
	}
}
