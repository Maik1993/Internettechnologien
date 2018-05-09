package datenbank;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import de.imut.ec.keyvaluestore.KeyValueStore;

/**
 * Servlet implementation class Datenbank
 */
@WebServlet("/Datenbank")
public class Datenbank extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private List<Buch> buecher;
	private String key = "lBenYS9JqrKN2ld8dlkmICXiEVmYQPaIWDKid762";
	private KeyValueStore kvs = new KeyValueStore();
	private TypeToken<ArrayList<Buch>> list_type = new TypeToken<ArrayList<Buch>>() {
	};
	private Gson json = new Gson();
	private boolean error ;
	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Datenbank() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Enumeration<String> param = request.getParameterNames();
		//erster Parameter zur Methodenwahl
		String name = param.nextElement();

		initialize();
		checkRequest(request);
		
		if (!(this.error)) {

			if (name.equals("put")) {
				addBook(request, response);
			} else if (name.equals("delete")) {
				deleteBook(request, response);
			}
		} else {
			createOutput(request, response);
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	protected void addBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		String Fachbereich = request.getParameter("Fachbereich");
		String Titel = request.getParameter("Titel");
		String Autor = request.getParameter("Autor");
		String Preis = request.getParameter("Preis");
		String ISBN = request.getParameter("ISBN");
		String Jahr = request.getParameter("Jahr");
		String Auflage = request.getParameter("Auflage");
		String Inhalt = request.getParameter("Inahlt");
		
		
		boolean contains = false;
		//Prüft ob Buch schon vorhanden
		for(int i =0; i < this.buecher.size();i++) {
			Buch current_b = this.buecher.get(i);
			
			if(current_b.getISBN().equals(ISBN)) {
				contains = true;
			}
			
		}

		if(!contains) {
			this.buecher.add(new Buch(Fachbereich, Titel, Autor, Preis, ISBN, Jahr, Auflage, Inhalt));
			String json_buecher = this.json.toJson(this.buecher);

			kvs.put(this.key, json_buecher);
		}
				
		createOutput(request, response);
	}
	
	//Sucht Eingabefehler in Anfrage
	protected void checkRequest(HttpServletRequest request) {
		boolean hasError = false;

		Enumeration<String> param = request.getParameterNames();

		while (param.hasMoreElements()) {
			
			String current_param = param.nextElement();
			String current_val = request.getParameter(current_param);

			if ((current_param.equals("Fachbereich") || current_param.equals("Titel") || current_param.equals("Autor")
					|| current_param.equals("Inhalt")) && !hasError) {
				hasError = current_val.length() == 0;
			} else if ((current_param.equals("Preis")) && !hasError) {
				// https://docs.oracle.com/javase/8/docs/api/java/lang/NullPointerException.html
				// https://docs.oracle.com/javase/8/docs/api/java/lang/NumberFormatException.html
				try {
					Double.parseDouble(current_val);
				} catch (NumberFormatException | NullPointerException e) {
					hasError = true;
				}
			} else if (current_param.equals("Auflage") && !hasError) {
				// https://docs.oracle.com/javase/8/docs/api/java/lang/NumberFormatException.html
				try {
					Integer.parseInt(current_val);
				} catch (NumberFormatException e) {
					hasError = true;
				}
			} else if (current_param.equals("Jahr") && !hasError) {
				// IllegalArgumentException
				try {
					SimpleDateFormat format = new SimpleDateFormat("yyyy");
					format.parse(current_val);
				} catch (ParseException e) {
					hasError = true;
				}
			} else if (current_param.equals("ISBN") && !hasError) {
				// https://docs.oracle.com/javase/8/docs/api/java/lang/NumberFormatException.html
				try {
					Long.parseLong(current_val);
				} catch (NumberFormatException e) {
					hasError = true;
				}
			}
		}
		this.error = hasError;
	}

	protected void deleteBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Enumeration<String> param = request.getParameterNames();
		//Buchindex
		int index_r = -1;
		//Prüft ob Buch vorhanden
		while (param.hasMoreElements()) {
			String cur_param = param.nextElement();
			String cur_val = request.getParameter(cur_param);
			if (cur_param.equals("isbn")) {
				for (int i = 0; i < this.buecher.size(); i++) {
					Buch b = this.buecher.get(i);
					//Sichert den Index 
					if (b.getISBN().equals(cur_val)) {
						index_r = i;
					}
				}
			}
		}
		//entfernt Buch aus Liste
		if (index_r != -1) {
			this.buecher.remove(index_r);
			kvs.put(this.key, this.json.toJson(this.buecher));
		}
		createOutput(request, response);
	}

	
	//Bücher werden aus Gson geladen und in Liste eingetragen(wenn Bücher vorhanden)
	private void initialize() {
		String buecher = kvs.get(this.key);

		if (buecher != null) {
			this.buecher = new ArrayList<Buch>(json.fromJson(buecher, this.list_type.getType()));
		} else {
			this.buecher = new ArrayList<Buch>();
		}
	}

	private void createOutput(HttpServletRequest request, HttpServletResponse response) {
		//Output immer auf Bookedit 
		String address = "Bookedit.jsp";
		RequestDispatcher req = request.getRequestDispatcher(address);
		HttpSession session = request.getSession(true);
		//Bei Fehler alte Werte mitgeben 
		if (this.error) {
			session.setAttribute("error", this.error);
			session.setAttribute("Fachbereich", request.getParameter("Fachbereich"));
			session.setAttribute("Titel", request.getParameter("Titel"));
			session.setAttribute("Autor", request.getParameter("Autor"));
			session.setAttribute("Preis", request.getParameter("Preis"));
			session.setAttribute("ISBN", request.getParameter("ISBN"));
			session.setAttribute("Jahr", request.getParameter("Jahr"));
			session.setAttribute("Auflage", request.getParameter("Auflage"));
			session.setAttribute("Inhalt", request.getParameter("Inhalt"));

		} else {
			session.setAttribute("error", this.error);
			session.setAttribute("Fachbereich", "");
			session.setAttribute("Titel", "");
			session.setAttribute("Autor", "");
			session.setAttribute("Preis", "");
			session.setAttribute("ISBN", "");
			session.setAttribute("Jahr", "");
			session.setAttribute("Auflage", "");
			session.setAttribute("Inhalt", "");
		}
		try {
			req.forward(request, response);

		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}
}
