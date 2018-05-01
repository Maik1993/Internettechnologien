

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import de.imut.ec.keyvaluestore.KeyValueStore;
/**
 * Servlet implementation class Datenbank
 */
@WebServlet("/Datenbank")
public class Datenbank extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Datenbank() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Error");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String Titel = request.getParameter("Titel");
		String Autor = request.getParameter("Autor");
		String Preis = request.getParameter("Preis");
		String ISBN = request.getParameter("ISBN");
		String Jahr = request.getParameter("Jahr");
		String Auflage = request.getParameter("Auflage");
		String Inhalt = request.getParameter("Inhalt");
		String Fachbereich = request.getParameter("Fachbereich");
		
		String address = "Grobspezifikation/Output.jsp";
		
		HttpSession session = request.getSession(true); 
		request.setAttribute("Fachbereich", Fachbereich);
		session.setAttribute("Fachbereich", Fachbereich);
		
		request.setAttribute("Titel", Titel);
		session.setAttribute("Titel", Titel);
		
		request.setAttribute("Autor", Autor);
		session.setAttribute("Autor", Autor);
		
		request.setAttribute("Preis", Preis);
		session.setAttribute("Preis", Preis);
		
		request.setAttribute("ISBN", ISBN);
		session.setAttribute("ISBN", ISBN);
		
		request.setAttribute("Jahr", Jahr);
		session.setAttribute("Jahr", Jahr);
		
		request.setAttribute("Auflage", Auflage);
		session.setAttribute("Auflage", Auflage);
		
		request.setAttribute("Inhalt", Inhalt);
		session.setAttribute("Inhalt", Inhalt);
		
		
		
		KeyValueStore kvs = new KeyValueStore();
		String key ="qRE5spZ9NYygM40e2MBda5N27GzOzQLVZxaA7rB2";
		
		String value = kvs.get(key);
		System.out.println(value);
		request.setAttribute("KVS", "Hier ist was drin");
		session.setAttribute("KVS", "Hier ist was drin");
		request.setAttribute("KVS", value);
		session.setAttribute("KVS", value);
		System.out.println("Hallo");
		RequestDispatcher req = request.getRequestDispatcher(address);
		req.forward(request, response);
	}

}
/*
 * import de.imut.ec.keyvaluestore.KeyValueStore;
...

* KeyValueStore kvs = new KeyValueStore();
 * String key ="rFmN7V4NVROK29doJcAsOos6T4OVXtiqup7DF5uu";
* kvs.put(key,"Hello World!!!");
* String value = kvs.get(key);
* System.out.println(value);
 * 
 * 
 * 
 * 
 * */
