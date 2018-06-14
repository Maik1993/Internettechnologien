package beans;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import datenbank.Buch;
import de.imut.ec.keyvaluestore.KeyValueStore;

abstract class Handler {
	
	private String key = "lBenYS9JqrKN2ld8dlkmICXiEVmYQPaIWDKid762";
	private KeyValueStore kvs = new KeyValueStore();
	
	private Gson json = new Gson();
	private TypeToken<ArrayList<Buch>> token_buecher = new TypeToken<ArrayList<Buch>>() {};
	
	protected List<Buch> buecher = new ArrayList<Buch>(json.fromJson(kvs.get(key), token_buecher.getType()));

}
