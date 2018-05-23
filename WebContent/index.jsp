<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="Grobspezifikation/css/bootstrap.min.css">

<title>Warengruppe</title>
</head>
<!--Imports-->
<%@ page import="de.imut.ec.keyvaluestore.KeyValueStore"%>
<%@ page import="datenbank.Buch"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.TreeSet"%>

<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.reflect.TypeToken"%>

<%@ page import="java.util.Iterator"%>

<%
	KeyValueStore kvs = new KeyValueStore();
	String key = "lBenYS9JqrKN2ld8dlkmICXiEVmYQPaIWDKid762";
	String buecher_gson = "";
	ArrayList<datenbank.Buch> array_buecher = new ArrayList<datenbank.Buch>();
	Gson json = new Gson();
	TypeToken<List<datenbank.Buch>> list_type = new TypeToken<List<datenbank.Buch>>() {};
	Set<String> genres = new TreeSet<String>();
	String fachbereich = "";
	try{
		buecher_gson = kvs.get(key);
		array_buecher = json.fromJson(buecher_gson, list_type.getType());
		
		for(int i = 0 ; i < array_buecher.size(); i++){
			
			Buch b = array_buecher.get(i);
			String genre = b.getFachbereich();
			genres.add(genre);
			
		}
		
		
	}catch(NullPointerException e){
		
	}

%>
<body>

	<!--  Oberste Line mit Gruppennamen  -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<!-- Brand -->
		<a class="navbar-brand" href="#">D2</a>

		<!-- Oberste Leiste -->
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="main.html">Startseite</a>
			</li>
		</ul>


		<!--  Serveranfrage Suche -->
		<form class="form-inline" action="/action_page.php">
			<input class="form-control mr-sm-2" type="text"
				placeholder="Suche...">
			<button class="btn btn-success" type="submit">Suche</button>
		</form>


		<ul class="navbar-nav  ">
			<li class="nav-item active "><a class="nav-link"
				href="Bestellung/warenkorb.html">Warenkorb</a></li>
			<li class="nav-item active "><a class="nav-link"
				href="../Bookedit.jsp">Login</a></li>
		</ul>
	</nav>
	<!--  Ende oberste Line mit Gruppennamen und Buchshop-Logo -->
	<div class="container-fluid">

		<div class="row">

			<div class="col-lg-2">
				<h2>Fachbereiche:</h2>
				<%
					Iterator<String> it_genres = genres.iterator();
					
					while(it_genres.hasNext()){
						
						fachbereich = it_genres.next();
					%>
				<a href=""><%="  "+ fachbereich %><br></a>
				<%}
				%>
			</div>
			<div class="col-lg-8">
				<div class="row">
					<div class="col-lg-3"></div>
					<div class="col-lg-6">Die Bücher sind zurzeit total beliebt.</div>
					<div class="col-lg-3"></div>
				</div>

				<div class="row">

					<div class="col-lg-3"></div>

					<div class=col-lg-8>

						<div id="buchkarussel" class="carousel slide" data-ride="carousel">

							<ul class="carousel-indicators">
								<li data-target="#buchkarussel" data-slide-to="0" class="active"></li>
								<li data-target="#buchkarussel" data-slide-to="1"></li>
								<li data-target="#buchkarussel" data-slide-to="2"></li>
								<li data-target="#buchkarussel" data-slide-to="3"></li>
								<li data-target="#buchkarussel" data-slide-to="4"></li>
							</ul>

							<div class="carousel-inner">

								<div class="carousel-item active">
									<img src="Grobspezifikation/Bilder/Krimi/1.jpg" alt="Krimi 1" width="500"
										height="500">
								</div>
								<div class="carousel-item">
									<img src="Grobspezifikation/Bilder/Kinder/1.jpg" alt="Kinder 1" width="500"
										height="500">
								</div>
								<div class="carousel-item">
									<img src="Grobspezifikation/Bilder/Fach/1.jpg" alt="Fach 1" width="500"
										height="500">
								</div>
								<div class="carousel-item">
									<img src="Grobspezifikation/Bilder/Thriller/1.jpg" alt="Thriller 1" width="500"
										height="500">
								</div>
								<div class="carousel-item">
									<img src="Grobspezifikation/Bilder/Roman/1.jpg" alt="Roman 1" width="500"
										height="500">
								</div>
							</div>

							<a class="carousel-control-prev" href="#buchkarussel"
								data-slide="prev"> <span class="carousel-control-prev-icon"></span>
							</a> <a class="carousel-control-next" href="#buchkarussel"
								data-slide="next"> <span class="carousel-control-next-icon"></span>
							</a>
						</div>

					</div>
					<div class="col-lg-3"></div>
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>

	</div>
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