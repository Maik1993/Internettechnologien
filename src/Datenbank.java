
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Error");
	}

	protected boolean stringcheck(String s) {
		if (s.length() == 0) {
			return true;
		}
		return false;
	}

	protected boolean intcheck(String s) {
		try {
			int test = Integer.parseInt(s);
		} catch (NumberFormatException nfe) {
			return true;
		}
		return false;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void addBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean error = false;
		String Fachbereich = request.getParameter("Fachbereich");
		if (error == false) {
			error = stringcheck(Fachbereich);
		}

		String Titel = request.getParameter("Titel");
		if (error == false) {
			error = stringcheck(Titel);
		}

		String Autor = request.getParameter("Autor");
		if (error == false) {
			error = stringcheck(Autor);
		}

		String Preis = request.getParameter("Preis");
		if (error == false) {
			try {
				double pricecheck = Double.parseDouble(Preis);
			} catch (NumberFormatException nfe) {
				error = true;
			}
		}
		String ISBN = request.getParameter("ISBN");
		if (error == false) {
			error = intcheck(ISBN);
		}

		String Jahr = request.getParameter("Jahr");
		if (error == false) {
			error = intcheck(Jahr);
		}

		String Auflage = request.getParameter("Auflage");
		if (error == false) {
			error = intcheck(Auflage);
		}

		String Inhalt = request.getParameter("Inhalt");
		if (error == false) {
			error = stringcheck(Inhalt);
		}

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
		String key = "qRE5spZ9NYygM40e2MBda5N27GzOzQLVZxaA7rB2";

		String address = "Bookedit.jsp";

		if (error == false) {
			address = "Output.jsp";
			String value = kvs.get(key);
			String book = Fachbereich + ";" + Titel + ";" + Autor + ";" + Preis + ";" + ISBN + ";" + Jahr + ";"
					+ Auflage + ";" + Inhalt + "-";
			kvs.put(key, value + book);
			value = kvs.get(key);
			
			request.setAttribute("KVS", value);
			session.setAttribute("KVS", value);
			
			} else {
			request.setAttribute("error", error);
			session.setAttribute("error", error);
			address = "Bookedit.jsp";

		}
		RequestDispatcher req = request.getRequestDispatcher(address);
		req.forward(request, response);
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
			addBook(request, response);
	}
}
