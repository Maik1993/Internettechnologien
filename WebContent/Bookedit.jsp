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
	} catch (NullPointerException e) {

	}
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
	</form>


	<ul class="navbar-nav  ">
		<li class="nav-item active "><a class="nav-link"
			href="Grobspezifikation/Bestellungen/warenkorb.html">Warenkorb</a></li>
			<li class="nav-item active "><a class="nav-link"
				href="../Bookedit.jsp">Login</a></li>
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
						
						 -->
			
				<div class="col-sm-4 ">
					<%
						if (error) {
					%>
					<h2>Bitte Angaben überprüfen!</h2>
					<%
						}
					%>
					<form method="POST" action="Datenbank">
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
						<div class="form-group">
							<!-- Titel -->

							<label for="formGroupExampleInput">Buchtitel: </label> <br>
							<input type="text" class="form-control" name="Titel"
								value=<%=Titel%>>

						</div>

						<div class="form-group">
							<!-- Autor -->

							<label for="formGroupExampleInput">Autor: </label> <br> <input
								type="text" class="form-control" name="Autor" value=<%=Autor%>>

						</div>

						<div class="form-group">
							<!-- Preis -->

							<label for="formGroupExampleInput">Preis: </label> <br> <input
								type="text" class="form-control" name="Preis" value=<%=Preis%>>

						</div>

						<div class="form-group">
							<!-- ISBN -->
							<label for="formGroupExampleInput">ISBN: </label> <br> <input
								type="text" class="form-control" name="ISBN" value=<%=ISBN%>>


						</div>

						<div class="form-group">
							<!-- Jahr -->
							<label for="formGroupExampleInput">Veröffentlichungsjahr:
							</label> <br> <input type="text" class="form-control" name="Jahr"
								value=<%=Jahr%>>



						</div>

						<div class="form-group">
							<!-- Auflage -->
							<label for="formGroupExampleInput">Auflage: </label> <br> <input
								type="text" class="form-control" name="Auflage"
								value=<%=Auflage%>>


						</div>

						<div class="form-group">
							<!-- Inhalt -->
							<label for="formGroupExampleInput">Inhalt: </label> <br> <input
								type="text" class="form-control" name="Inhalt" value=<%=Inhalt%>>


						</div>
						<div class="col-sm-4">
						<input type="submit" id="login_button" value="Hinzufügen"
							class="btn btn-primary btn-lg btn-block login-button">
						</div>
					</form>
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