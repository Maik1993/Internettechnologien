package warengruppen;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.jasper.tagplugins.jstl.core.Out;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import datenbank.Buch;
import de.imut.ec.keyvaluestore.KeyValueStore;

/**
 * Servlet implementation class Warengruppe
 */
@WebServlet("/Warengruppe")
public class Warengruppe extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private boolean wechsel = true;
     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Warengruppe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		warengruppeAusgabe(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void warengruppeAusgabe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		KeyValueStore kvs = new KeyValueStore();
		boolean start = false;
		String ISBN = "";
		String titel ="";
		String isbn = "";
		String button = "";
		String fachbereich = "";
		String buecher_gson = "";
		String key = "lBenYS9JqrKN2ld8dlkmICXiEVmYQPaIWDKid762";
		ArrayList<datenbank.Buch> array_buecher = new ArrayList<datenbank.Buch>();
		ArrayList<String> isbns = new ArrayList();
		Gson json = new Gson();
		TypeToken<List<datenbank.Buch>> list_type = new TypeToken<List<datenbank.Buch>>() {};
		Set<String> genres = new TreeSet<String>();
		HttpSession session = request.getSession(true);
		
		
		try {
			buecher_gson = kvs.get(key);
			array_buecher = json.fromJson(buecher_gson, list_type.getType());

			for (int i = 0; i < array_buecher.size(); i++) {
				Buch a = array_buecher.get(i);
				String genre = a.getFachbereich();
				String isbn_tmp = a.getISBN();
				genres.add(genre);		
				isbns.add(isbn_tmp);
			}
			if(start == false){
				button ="start";
				start = true;
			}

			Iterator<String>  it_genres = genres.iterator();
			while(it_genres.hasNext()) {
				fachbereich = it_genres.next();
				
				if(request.getParameter(fachbereich) != null ) {
					button = request.getParameter(fachbereich);	
				}
			}
			if(request.getParameter("buttonStart") != null) {
				button = "start";
			}
			Iterator<String>  it_isbn = isbns.iterator();
			while(it_isbn.hasNext()) {
				isbn = it_isbn.next();
				if(request.getParameter(isbn) != null ) {
					button = "details";
					titel = request.getParameter(isbn);
					
					for (int i = 0; i < array_buecher.size(); i++) {
						Buch a = array_buecher.get(i);
						if(a.getTitel().equals(titel) && a.getISBN().equals(isbn) ) {
							ISBN = a.getISBN();
						}
					}
				}	
			}
			 
			RequestDispatcher req = request.getRequestDispatcher("index.jsp");			
			session.setAttribute("button" , button);
			session.setAttribute("isbn" , ISBN);
			req.forward(request, response);
			} catch (NullPointerException e) {

			}
	}

}
