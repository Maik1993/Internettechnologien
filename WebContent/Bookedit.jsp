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
<link rel="stylesheet" href="css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bücher hinzufügen</title>
</head>
<body>
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
	<%
		if (error) {
	%>
	<h2>BITTE ANGABEN ÜBERPRÜFEN!</h2>
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

			<label for="formGroupExampleInput">Buchtitel: </label> <br> <input
				type="text" class="form-control" name="Titel" value=<%=Titel%>>

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
			<label for="formGroupExampleInput">Veröffentlichungsjahr: </label> <br>
			<input type="text" class="form-control" name="Jahr" value=<%=Jahr%>>



		</div>

		<div class="form-group">
			<!-- Auflage -->
			<label for="formGroupExampleInput">Auflage: </label> <br> <input
				type="text" class="form-control" name="Auflage" value=<%=Auflage%>>


		</div>

		<div class="form-group">
			<!-- Inhalt -->
			<label for="formGroupExampleInput">Inhalt: </label> <br> <input
				type="text" class="form-control" name="Inhalt" value=<%=Inhalt%>>


		</div>
		<input type="submit" id="login_button" value="Absenden"
			class="btn btn-primary btn-lg btn-block login-button">
	</form>
</body>
</html>