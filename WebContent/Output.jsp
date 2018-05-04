<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String Titel = (String) session.getAttribute("Titel");
	String Fachbereich = (String) session.getAttribute("Fachbereich");
	String Autor = (String) session.getAttribute("Autor");
	String Preis = (String) session.getAttribute("Preis");
	String ISBN = (String) session.getAttribute("ISBN");
	String Jahr = (String) session.getAttribute("Jahr");
	String Auflage = (String) session.getAttribute("Auflage");
	String Inhalt = (String) session.getAttribute("Inhalt");
	String KVS = (String) session.getAttribute("KVS");
	String[] s = KVS.split("-");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="Grobspezifikation/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bücher hinzufügen</title>
</head>
<body>
	<!--  Oberste Line mit Gruppennamen  -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark"> <!-- Brand -->
	<a class="navbar-brand" href="#">D2</a> <!-- Oberste Leiste -->
	<ul class="navbar-nav mr-auto">
		<li class="nav-item active"><a class="nav-link"
			href="Grobspezifikation/main.html">Startseite</a></li>
	</ul>


	<!--  Serveranfrage Suche -->
	<form class="form-inline" action="/action_page.php">
		<input class="form-control mr-sm-2" type="text" placeholder="Suche...">
		<button class="btn btn-success" type="submit">Suche</button>
		<li class="nav-item active "><a class="nav-link"
				href="Bookedit.jsp">Login</a></li>
	</form>


	<ul class="navbar-nav  ">
		<li class="nav-item active "><a class="nav-link"
			href="Grobspezifikation/Bestellungen/warenkorb.html">Warenkorb</a></li>
	</ul>
	</nav>
	<!--  Ende oberste Line mit Gruppennamen und Buchshop-Logo -->

	<!--  Aufspaltung der Seite in Container  -->
	<div class="container-fluid">
		<div class="row">
			<div class=".col-sm-6 bg-light">
				<!-- Beginn der Liste links -->
				<nav class="navbar bg-light navbar-light ">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link active"
						href="Grobspezifikation/Warengruppen/krimis.html">Krimis</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="Grobspezifikation/Warengruppen/kinderbuecher.html">Kinderb&uumlcher</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="Grobspezifikation/Warengruppen/fachbuecher.html">Fachb&uumlcher</a></li>
					<li class="nav-item"><a class="nav-link active"
						href=".Grobspezifikation/Warengruppen/romane.html">Romane</a></li>
					<li class="nav-item"><a class="nav-link active"
						href=".Grobspezifikation/Warengruppen/thriller.html">Thriller</a></li>

				</ul>
				</nav>

			</div>
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
						<div class="form-group row">
					<label for="buch" class="col-sm-4 col-form-label">1 x</label>
					<label class="col-sm-2 col-form-label">Buch der Liebe</label>
                    <label class="col-sm-2 col-form-label">5 Euro</label>
				</div>
						 -->
			<!-- Aktuelles Buch -->


			<div class="col-sm-4 ">
				<h3>Buch hinzugefügt!</h3>
				<div class="form-group row">
					<label class="col-sm-3 col-form-label">Fachbuch:</label> <label
						class="col-sm-2 col-form-label"><%=Fachbereich%></label>
				</div>

				<div class="form-group row">
					<label class="col-sm-3 col-form-label">Titel:</label> <label
						class="col-sm-2 col-form-label"><%=Titel%></label>
				</div>

				<div class="form-group row">
					<label class="col-sm-3 col-form-label">Autor:</label> <label
						class="col-sm-2 col-form-label"><%=Autor%></label>
				</div>

				<div class="form-group row">
					<label class="col-sm-3 col-form-label">Preis:</label> <label
						class="col-sm-2 col-form-label"><%=Preis%></label>
				</div>

				<div class="form-group row">
					<label class="col-sm-3 col-form-label">ISBN:</label> <label
						class="col-sm-2 col-form-label"><%=ISBN%></label>
				</div>

				<div class="form-group row">
					<label class="col-sm-3 col-form-label">Jahr:</label> <label
						class="col-sm-2 col-form-label"><%=Jahr%></label>
				</div>

				<div class="form-group row">
					<label class="col-sm-3 col-form-label">Auflage:</label> <label
						class="col-sm-2 col-form-label"><%=Auflage%></label>
				</div>

				<div class="form-group row">
					<label class="col-sm-3 col-form-label">Inhalt:</label> <label
						class="col-sm-2 col-form-label"><%=Inhalt%></label>
				</div>
				
				
				<div class="container">
					<h3>Bücher-Datenbank</h3>
					<table class="table">
						<thead>
							<tr>
								<th>Fachbuch</th>
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
								for(int i = s.length-1; i > 0; i--){
									String[] sBuch =  s[i].split(";");
									%>
									<tr>
									<%
									for(int j = 0; j < sBuch.length; j++){
										String x = (String) sBuch[j];
										%>
											<td><%=x%></td>
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


			<!-- Ende der Fußleiste -->
			<!--  Benötigt zum Ausführen von Javascript -->
			<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
				integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
				crossorigin="anonymous"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
				integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
				crossorigin="anonymous"></script>
			<script
				src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
				integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
				crossorigin="anonymous"></script>
</body>
</html>