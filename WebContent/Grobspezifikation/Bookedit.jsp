<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	<form method="POST" action="../Datenbank">
		<div class="form-group">
		<!-- Fachbereich -->
			<label for="formGroupExampleInput">Fachbereich: </label> <br> <input
				type="text" class="form-control" name="Fachbereich" 
				placeholder="Fachbereich">
		</div>
		
		<div class="form-group">
		<!-- Titel -->
			<label for="formGroupExampleInput">Buchtitel: </label> <br> <input
				type="text" class="form-control" name="Titel" 
				placeholder="Titel">
		</div>
		
		<div class="form-group">
		<!-- Autor -->
			<label for="formGroupExampleInput">Autor: </label> <br> <input
				type="text" class="form-control" name="Autor" 
				placeholder="Autor">
		</div>
		
		<div class="form-group">
		<!-- Preis -->
			<label for="formGroupExampleInput">Preis: </label> <br> <input
				type="text" class="form-control" name="Preis" 
				placeholder="Preis">
		</div>
		
		<div class="form-group">
		<!-- ISBN -->
			<label for="formGroupExampleInput">ISBN: </label> <br> <input
				type="text" class="form-control" name="ISBN" 
				placeholder="ISBN">
		</div>
		
		<div class="form-group">
		<!-- Jahr -->
			<label for="formGroupExampleInput">Veröffentlichungsjahr: </label> <br> <input
				type="text" class="form-control" name="Jahr" 
				placeholder="Jahr">
		</div>
		
		<div class="form-group">
		<!-- Auflage -->
			<label for="formGroupExampleInput">Auflage: </label> <br> <input
				type="text" class="form-control" name="Auflage" 
				placeholder="Auflage">
		</div>
		
		<div class="form-group">
		<!-- Inhalt -->
			<label for="formGroupExampleInput">Inhalt: </label> <br> <input
				type="text" class="form-control" name="Inhalt" 
				placeholder="Inhalt">
		</div>
		
		<input type="submit" id="login_button" value="Absenden"
			class="btn btn-primary btn-lg btn-block login-button">
	</form>
</body>
</html>