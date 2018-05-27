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
		String key = "lBenYS9JqrKN2ld8dlkmICXiEVmYQPaIWDKid762";
		String buecher_gson = "";
		ArrayList<datenbank.Buch> array_buecher = new ArrayList<datenbank.Buch>();
		Gson json = new Gson();
		TypeToken<List<datenbank.Buch>> list_type = new TypeToken<List<datenbank.Buch>>() {};
		
		
		Set<String> genres = new TreeSet<String>();
		String fachbereich = "";
		
		HttpSession session = request.getSession(true);
		String button = "";
		try {
			buecher_gson = kvs.get(key);
			array_buecher = json.fromJson(buecher_gson, list_type.getType());

			for (int i = 0; i < array_buecher.size(); i++) {
				Buch a = array_buecher.get(i);
				String genre = a.getFachbereich();
				genres.add(genre);
			}
			

			Iterator<String>  it_genres = genres.iterator();
			String string_buecher = "";
			while(it_genres.hasNext()) {
				fachbereich = it_genres.next();
				
				if(request.getParameter(fachbereich) != null ) {
					button = request.getParameter(fachbereich);
					wechsel = false;
					string_buecher = "";
					
					for (int i = 0; i < array_buecher.size(); i++) {
						Buch b = array_buecher.get(i);
						if (b.getFachbereich() == fachbereich) {
							string_buecher += b.toString();
						}
					}				
				}
				if(request.getParameter("buttonStart") != null) {
					button = "start";
				}
				
			}
			
			String address = "index.jsp";
			RequestDispatcher req = request.getRequestDispatcher(address);
			
			session.setAttribute("button" , button);
			session.setAttribute("Buecher", string_buecher);
			req.forward(request, response);
			} catch (NullPointerException e) {

			}
	}

}
