<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ausgabe: Warengruppe</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="Grobspezifikation/css/bootstrap.min.css">
<script src="Grobspezifikation/js/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style>
#Form-Ele {
	padding-right: 25px;
}

.footer {
	bottom: 0;
	position: absolute;
	width: 100%
}
</style>

</head>

<%@ page import="datenbank.Buch"%>

<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.Iterator"%>

<%@ page import="de.imut.ec.keyvaluestore.KeyValueStore"%>

<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.reflect.TypeToken"%>

<%@ page import="java.io.StringReader"%>
<%
	String key = "lBenYS9JqrKN2ld8dlkmICXiEVmYQPaIWDKid762";
	KeyValueStore kvs = new KeyValueStore();
	TypeToken<List<datenbank.Buch>> list_type = new TypeToken<List<datenbank.Buch>>() {
	};
	Enumeration<String> params;
	Gson json = new Gson();
	HashMap<String, String> ausgabe = new HashMap<String, String>();
	String buecher_genre = "";

	if (request.getParameterNames() != null) {

		params = request.getParameterNames();

		String jsonBuecher = kvs.get(key);

		List<datenbank.Buch> buecher = json.fromJson(jsonBuecher, list_type.getType());

		while (params.hasMoreElements()) {

			String current_p = params.nextElement();

			for (int i = 0; i < buecher.size(); i++) {

				Buch b = buecher.get(i);

				if (b.getFachbereich().equals(current_p)) {
					buecher_genre += b.toString();
				}

			}
			ausgabe.put(current_p, buecher_genre);
			buecher_genre = "";
		}

	}
%>
<body>
	<div class="container-fluid align-buttom" style="padding: 0">
		<!--  Oberste Line mit Gruppennamen  -->
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<!-- Brand -->
			<a class="navbar-brand" href="#">D2</a>
			<!-- Oberste Leiste -->
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="Grobspezifikation/main.html">Startseite</a></li>
			</ul>


			<!--  Serveranfrage Suche -->
			<form class="form-inline" action="/action_page.php">
				<input class="form-control mr-sm-2" type="text"
					placeholder="Suche...">
				<button class="btn btn-success" type="submit">Suche</button>
			</form>


			<ul class="navbar-nav  ">
				<li class="nav-item active "><a class="nav-link"
					href="Grobspezifikation/Bestellung/warenkorb.html">Warenkorb</a></li>
				<li class="nav-item active "><a class="nav-link"
					href="Bookedit.jsp">Login</a></li>
			</ul>
		</nav>
		<!--  Ende oberste Line mit Gruppennamen und Buchshop-Logo -->

		<!-- Auswahl der benötigten Warengruppe zu Auswahl -->

		<div class="row">

			<!-- Anzeige der möglichen Warengruppen -->

			<div class="col-lg-12">
				

					<form method="post" class="form-inline"
						action="AusgabeWarengruppe.jsp" style="padding-top: 5px">

						<h2 id="Form-Ele">Warengruppen:</h2>

						<div class="form-check" id="Form-Ele">
							<label class="form-check-label"> <input
								class="form-check-input" type="checkbox" name="Krimi">
								Krimis
							</label>
						</div>

						<div class="form-check" id="Form-Ele">
							<label class="form-check-label"> <input
								class="form-check-input" type="checkbox" name="Fach">
								Fachbücher
							</label>
						</div>

						<div class="form-check" id="Form-Ele">
							<label class="form-check-label"> <input
								class="form-check-input" type="checkbox" name="Kinder">
								Kinderbücher
							</label>
						</div>

						<div class="form-check" id="Form-Ele">
							<label class="form-check-label"> <input
								class="form-check-input" type="checkbox" name="Roman">
								Romane
							</label>
						</div>

						<div class="form-check" id="Form-Ele">
							<label class="form-check-label"> <input
								class="form-check-input" type="checkbox" name="Thriller">
								Thriller
							</label>
						</div>

						<button type="submit" class="btn btn-primary">Anzeigen</button>

					</form>
					<hr>
					<!-- Ende Auswahl der benötigten Warengruppe zu Auswahl -->
					<table class="table">
						<thead>
							<tr>
								<th>Fachbereich</th>
								<th>Titel</th>
								<th>Autor</th>
								<th>Preis</th>
								<th>ISBN</th>
								<th>Jahr</th>
								<th>Auflage</th>
								<th>Inhalt</th>

							</tr>
						</thead>
						<tbody>

							<%
								Set<String> keySet = ausgabe.keySet();
								Iterator<String> it_key = keySet.iterator();

								while (it_key.hasNext()) {
									String current_key = it_key.next();
									String current_val = ausgabe.get(current_key);
									String[] buecher = current_val.split("}");

									for (int i = 0; i < buecher.length; i++) {
							%>
							<tr>
								<%
									String bucher = buecher[i].replaceAll("[^a-zA-Z 0-9 .:, ]", "");
											String tmp = bucher.replaceAll(":", ": ");
											String[] buch = tmp.split(",");
											for (int j = 0; j < buch.length; j++) {
								%>
								<td><%=buch[j]%></td>
								<%
									}
								%>
							</tr>
							<%
								}
								}
							%>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>


	<!-- Anfang der Fußleiste -->
	
		<div class="container-fluid">
			<div class="row">
				<div class="col"></div>
				<!-- Puffer für Buttons -->

				<!-- Serverabfrage Vor und Zurück -->
				<div class="col">
					<button type="button" class="btn btn-secondary">Zurück</button>
				</div>
				<div class="col">
					<button type="button" class="btn btn-secondary">Vorwärts</button>
				</div>
			</div>

			<!-- Fußleiste Impressum -->
			<div class="row bg-dark .text-light">

				<div class=".col-sm-6">
					<p class="text-light">
						Maik Habben <br> Tobias Scheermann <br> Rouven Hollens <br>
				</div>
				<div class=".col-sm-6">
					<p class="text-light">
						7009381 <br> 7009569 <br> 7008980 <br>
				</div>
				<div class=".col-sm-6">
					<p class="text-light">
						Internet-Technologien<br> Sommersemester 2018<br>
					</p>
				</div>
			</div>
		</div>


	<!-- Ende der Fußleiste -->



</body>
</html>