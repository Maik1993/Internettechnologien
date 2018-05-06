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
<meta charset="utf-8">
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
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h3>Buecher hinzufuegen</h3>
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
									type="text" class="form-control" name="Autor" value=<%=Autor%>>

							</div>
						</div>
						<div class="col-lg-3">
							<div class="form-group">
								<!-- Preis -->

								<label for="formGroupExampleInput">Preis: </label> <br> <input
									type="text" class="form-control" name="Preis" value=<%=Preis%>>

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
								<label for="formGroupExampleInput">Auflage: </label> <br> <input
									type="text" class="form-control" name="Auflage"
									value=<%=Auflage%>>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="form-group">
								<!-- Inhalt -->
								<label for="formGroupExampleInput">Inhalt: </label> <br> <input
									type="text" class="form-control" name="Inhalt"
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
				<h3>Buch loeschen</h3>
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

		<div class="row">
			<div class="log-lg-12">
				<div class="container">
					<h3>Vorhandene Buecher:</h3>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Key:</th>
								<th><%=key%></th>
							</tr>
							<tr>
								<th>Buecher:</th>
								<%@ page import="de.imut.ec.keyvaluestore.KeyValueStore"%>
								<%
									KeyValueStore kvs = new KeyValueStore();
								%>
								<%
									KVS = kvs.get(key);
								%>
								<th><%=KVS%></th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>