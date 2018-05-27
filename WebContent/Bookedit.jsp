<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	boolean error = false;
	String Titel = "";
	String Fachbereich = "";
	String Autor = "";
	String Preis = "";
	String ISBN = "";
	String Jahr = "";
	String Auflage = "";
	String Inhalt = "";
	String key = "lBenYS9JqrKN2ld8dlkmICXiEVmYQPaIWDKid762";
	String KVS = "";
	try {
		error = (boolean) session.getAttribute("error");
		Titel = (String) session.getAttribute("Titel");
		Fachbereich = (String) session.getAttribute("Fachbereich");
		Autor = (String) session.getAttribute("Autor");
		Preis = (String) session.getAttribute("Preis");
		ISBN = (String) session.getAttribute("ISBN");
		Jahr = (String) session.getAttribute("Jahr");
		Auflage = (String) session.getAttribute("Auflage");
		Inhalt = (String) session.getAttribute("Inhalt");
		KVS = (String) session.getAttribute("KVS");

	} catch (NullPointerException e) {

	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="Grobspezifikation/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bücherverwaltung</title>
</head>
<body>
	<!--  Oberste Line mit Gruppennamen  -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark"> <!-- Brand -->
	<a class="navbar-brand" href="#">D2</a> <!-- Oberste Leiste -->
	<ul class="navbar-nav mr-auto">
		<li class="nav-item active"><a class="nav-link"
			href="index.jsp">Startseite</a></li>
	</ul>


	<!--  Serveranfrage Suche -->
	<form class="form-inline" action="/action_page.php">
		<input class="form-control mr-sm-2" type="text" placeholder="Suche...">
		<button class="btn btn-success" type="submit">Suche</button>
	</form>


	<ul class="navbar-nav  ">
		<li class="nav-item active "><a class="nav-link"
			href="Grobspezifikation/Bestellungen/warenkorb.html">Warenkorb</a></li>
		<li class="nav-item active "><a class="nav-link"
			href="Bookedit.jsp">Login</a></li>
	</ul>
	</nav>
	<!--  Ende oberste Line mit Gruppennamen und Buchshop-Logo -->

	<!--  Aufspaltung der Seite in Container  -->
	<div class="container-fluid">

		<!-- Ende der Liste links -->

		<!-- Benötigte Informationen:
							Fachbereich
							Titel
							Autor
							Preis
							ISBN
							Veröffentlichungsdatum
							Auflage
							(Inhalt)
						
						 -->

		<div class="col-sm-8 ">

			<%
				if (error) {
			%>
			<h2>BITTE ANGABEN ÜBERPRÜFEN!</h2>
			<%
				}
			%>
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h3>Bücher hinzufügen</h3>
						<form method="POST" action="Datenbank">

							<div class="form-group">

								<input type="hidden" class="form-control" name="put">
							</div>
							<div class="row">
								<div class="col-lg-3">
									<div class="form-group">
										<label for="exampleFormControlSelect1">Fachbereich</label> <select
											class="form-control" name="Fachbereich">
											<option><%=Fachbereich%>
											<option>Krimi</option>
											<option>Kinder</option>
											<option>Fach</option>
											<option>Roman</option>
											<option>Thriller</option>
										</select>
									</div>
								</div>
								<div class="col-lg-3">
									<div class="form-group">
										<!-- Titel -->

										<label for="formGroupExampleInput">Buchtitel: </label> <br>
										<input type="text" class="form-control" name="Titel"
											value=<%=Titel%>>

									</div>
								</div>
								<div class="col-lg-3">
									<div class="form-group">
										<!-- Autor -->

										<label for="formGroupExampleInput">Autor: </label> <br> <input
											type="text" class="form-control" name="Autor"
											value=<%=Autor%>>

									</div>
								</div>
								<div class="col-lg-3">
									<div class="form-group">
										<!-- Preis -->

										<label for="formGroupExampleInput">Preis: </label> <br> <input
											type="text" class="form-control" name="Preis"
											value=<%=Preis%>>

									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-3">
									<div class="form-group">
										<!-- ISBN -->
										<label for="formGroupExampleInput">ISBN: </label> <br> <input
											type="text" class="form-control" name="ISBN" value=<%=ISBN%>>
									</div>
								</div>
								<div class="col-lg-3">
									<div class="form-group">
										<!-- Jahr -->
										<label for="formGroupExampleInput">Veröffentlichungsjahr:
										</label> <br> <input type="text" class="form-control" name="Jahr"
											value=<%=Jahr%>>
									</div>
								</div>
								<div class="col-lg-3">
									<div class="form-group">
										<!-- Auflage -->
										<label for="formGroupExampleInput">Auflage: </label> <br>
										<input type="text" class="form-control" name="Auflage"
											value=<%=Auflage%>>
									</div>
								</div>
								<div class="col-lg-3">
									<div class="form-group">
										<!-- Inhalt -->
										<label for="formGroupExampleInput">Inhalt: </label> <br>
										<input type="text" class="form-control" name="Inhalt"
											value=<%=Inhalt%>>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-3">
									<input type="submit" id="login_button" value="Absenden"
										class="btn btn-primary btn-lg btn-block login-button">
								</div>
								<div class="col-lg-9"></div>

							</div>
						</form>
					</div>
				</div>

				<hr>

				<div class="row">
					<div class="col-lg-3">
						<h3>Buch löschen</h3>
						<form method="POST" action="Datenbank">
							<div class="form-group">
								<input type="hidden" name="delete">
							</div>
							<div class="form-group">
								<label for="isbn">ISBN:</label><br> <input type="text"
									class="form-control" id="isbn" name="isbn">
							</div>
							<input type="submit" id="delete_button" value="Löschen"
								class="btn btn-primary btn-lg btn-block login-button">
						</form>
					</div>
					<div class="col-lg-9"></div>
					<br>
				</div>
				<hr>

				<div class="row"></div>

			
			<div class="row">
				<div class="col-lg-12">
					<h3>Bücher-Datenbank</h3>
					<%@ page import="de.imut.ec.keyvaluestore.KeyValueStore"%>
					<%
						KeyValueStore kvs = new KeyValueStore();
						String sKVS = kvs.get(key);
						String[] s = sKVS.split("}");
					%>
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

							</tr>
						</thead>
						<tbody>
							<%
								for (int i = s.length - 1; i > 0; i--) {
									String[] sBuch = s[i].split(",");
							%>
							<tr>
								<%
									for (int j = 1; j < sBuch.length; j++) {
											String output = (String) sBuch[j];
											if (j == 4) {
												output = output + " Euro";
											}
											String tmp = output.replaceAll("[^a-zA-Z 0-9 .: ]", "");
											output = tmp.replace(":", ": ");
								%>
								<td><%=output%></td>
								<%
									}
								%>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
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
	<!-- 
				Methode für die Ausgabe der Bücher-Datenbank 
			 -->
</body>
</html>