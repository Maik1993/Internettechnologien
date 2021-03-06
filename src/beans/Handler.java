package beans;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import bestellvorgang.Bestellung;
import bestellvorgang.Kunde;
import datenbank.Buch;
import de.imut.ec.keyvaluestore.KeyValueStore;

abstract class Handler {
	
	protected String key_buecher = "lBenYS9JqrKN2ld8dlkmICXiEVmYQPaIWDKid762";
	protected String key_kunde = "8mVgu735LzJqtNG9FQMuDKASu0VowPoX5c6SfjQk";

	protected String key_bestellung = "2JKcEbQjgqkFs6vAcD20JfVNbUVdLfIi1xYd3hPG";

	protected KeyValueStore kvs = new KeyValueStore();
	
	protected Gson json = new Gson();
	private TypeToken<ArrayList<Buch>> token_buecher = new TypeToken<ArrayList<Buch>>() {};
	private TypeToken<ArrayList<Kunde>> token_kunde = new TypeToken<ArrayList<Kunde>>() {};
	private TypeToken<ArrayList<Bestellung>> token_bestellung = new TypeToken<ArrayList<Bestellung>>() {};
	
	protected List<Buch> buecher;
	protected List<Kunde> kunden;
	protected List<Bestellung> bestellungen;
	
	protected void init() {
		
		try {
			this.buecher = new ArrayList<Buch>(json.fromJson(kvs.get(key_buecher), token_buecher.getType()));
			this.kunden = new ArrayList<Kunde>(json.fromJson(kvs.get(key_kunde), token_kunde.getType()));
			this.bestellungen = new ArrayList<Bestellung>(json.fromJson(kvs.get(key_bestellung), token_bestellung.getType()));
		}catch(NullPointerException e) {
			if(this.kunden == null) {
				this.kunden = new ArrayList<Kunde>();
			}
			else if(this.buecher == null) {
				this.buecher = new ArrayList<Buch>();
			}
			else if(this.bestellungen == null) {
				this.bestellungen = new ArrayList<Bestellung>();
			}
		}
		
	}
}
