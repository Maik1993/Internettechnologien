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

<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.TreeSet"%>
<%@ page import="java.util.HashMap"%>

<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.reflect.TypeToken"%>

<%@ page import="java.util.Iterator"%>

<%
	String button = "start";
	button = (String) session.getAttribute("button");
	System.out.println(button);
	if(button==null){
		button="start";		
	}
	String buecher = (String) session.getAttribute("Buecher");
	
	KeyValueStore kvs = new KeyValueStore();
	String key = "lBenYS9JqrKN2ld8dlkmICXiEVmYQPaIWDKid762";
	String buecher_gson = "";
	
	ArrayList<datenbank.Buch> array_buecher = new ArrayList<datenbank.Buch>();
	Gson json = new Gson();
	TypeToken<List<datenbank.Buch>> list_type = new TypeToken<List<datenbank.Buch>>() {
	};
	Set<String> genres = new TreeSet<String>();
	ArrayList<String> titles  = new ArrayList<>();
	ArrayList<String> autor  = new ArrayList<>();
	ArrayList<String>  preis = new ArrayList<>();
	String fachbereich = "";
	String titel = "";
	String Autor = "";
	String Preis = "";
	ArrayList<String> Liste = new ArrayList<>();
	try {
		buecher_gson = kvs.get(key);
		
		array_buecher = json.fromJson(buecher_gson, list_type.getType());
		for (int i = 0; i < array_buecher.size(); i++) {
			
			Buch b = array_buecher.get(i);
			String genre = b.getFachbereich();
			
			genres.add(genre);
			//String buffer = button.replaceAll(" ","");
			if(button.equals(genre)){
				String title = b.getTitel();	
				titles.add(title);
				String aut = b.getAutor();
				autor.add(aut);
				String p = b.getPreis();
				preis.add(p);
			}
		}
	} catch (NullPointerException e) {
	}
%>
<!-- 


 -->

<body>

	<!--  Oberste Line mit Gruppennamen  -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<!-- Brand -->
		<a class="navbar-brand" href="#">D2</a>

		<!-- Oberste Leiste -->
		<ul class="navbar-nav mr-auto">
			<form action="Warengruppe" methode="get">
					<input type="submit" class="btn btn-link  text-white" name="buttonStart"
						value="Startseite" /><br>
			</form>
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
				href="Bookedit.jsp">Login</a></li>
		</ul>
	</nav>
	<!--  Ende oberste Line mit Gruppennamen und Buchshop-Logo -->
	<div class="container-fluid">

		<div class="row">

			<div class="col-lg-2">
				<h2>Fachbereiche:</h2>
				<%
					Iterator<String> it_genres = genres.iterator();
					while (it_genres.hasNext()) {
						fachbereich = it_genres.next();
				%>
				<form action="Warengruppe" methode="get">
					<input type="submit" class="btn btn-link btn-lg" name="<%=fachbereich%>"
						value="<%=fachbereich%>" /><br>
				</form>
				<%
					}
				%>
			</div>
			<%
				if (button.equals("start")) {
			%>


			<!-- muss noch weg -->
			<div class="container">
				<div class="col-lg-8">
					<div class="row">
						<div class="col-lg-3"></div>
						<div class="col-lg-6">Diese Bücher sind zurzeit total beliebt.</div>
						<br><br>
						<div class="col-lg-3"></div>
					</div>

					<div class="row">

						<div class="col-lg-3"></div>

						<div class=col-lg-8>

							<div id="buchkarussel" class="carousel slide"
								data-ride="carousel">

								<ul class="carousel-indicators">
									<li data-target="#buchkarussel" data-slide-to="0"
										class="active"></li>
									<li data-target="#buchkarussel" data-slide-to="1"></li>
									<li data-target="#buchkarussel" data-slide-to="2"></li>
									<li data-target="#buchkarussel" data-slide-to="3"></li>
									<li data-target="#buchkarussel" data-slide-to="4"></li>
								</ul>

								<div class="carousel-inner">

									<div class="carousel-item active">
										<img src="Grobspezifikation/Bilder/Krimi/1.jpg" alt="Krimi 1"
											width="500" height="500">
									</div>
									<div class="carousel-item">
										<img src="Grobspezifikation/Bilder/Kinder/1.jpg"
											alt="Kinder 1" width="500" height="500">
									</div>
									<div class="carousel-item">
										<img src="Grobspezifikation/Bilder/Fach/1.jpg" alt="Fach 1"
											width="500" height="500">
									</div>
									<div class="carousel-item">
										<img src="Grobspezifikation/Bilder/Thriller/1.jpg"
											alt="Thriller 1" width="500" height="500">
									</div>
									<div class="carousel-item">
										<img src="Grobspezifikation/Bilder/Roman/1.jpg" alt="Roman 1"
											width="500" height="500">
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
			<%
				} else {

					String[] s = buecher.split("}");
			%>
	
			<div class="row">
				<div class="col-lg-12">
					<table class="table">
						<thead>
							<tr>
								<th>Titel</th>
								<td>
						</td>
						<td>
						</td>
								<th>Autor</th>
							<td>
						</td>
						<td>
						</td>
								<th>Preis</th>
								

							</tr>
						</thead>
						<tbody>
						<tr>
						<td><%
					Iterator<String> it_titles = titles.iterator();

					while (it_titles.hasNext()) {
						titel = it_titles.next();
				%>
					<form action="Warengruppe" methode="get">
					<input type="submit" class="btn btn-link btn-lg" name="<%=titel%>"
						value="<%=titel%>" /><br>
				</form>				
				
				<%
					}
				%>
						</td><td></td><td></td><td>
						<%
					Iterator<String> it_autore = autor.iterator();

					while (it_autore.hasNext()) {
						Autor = it_autore.next();
				%>
				
					<form action="Warengruppe" methode="get">
					<input type="submit" class="btn btn-link btn-lg" name="<%=Autor%>"
						value="<%=Autor%>" /><br>
				</form>
				
				<%
					}
				%>
						</td><td></td><td></td><td>
						<%
					Iterator<String> it_preis = preis.iterator();

					while (it_preis.hasNext()) {
						Preis = it_preis.next();
				%>
				
					
						<form action="Warengruppe" methode="get">
					<input type="submit" class="btn btn-link btn-lg" name="<%=Preis%>"
						value="<%=Preis%>" /><br>
				</form>
				
				<%
					}
				%>
						</td></tr>
						</tbody>
					</table>
				</div>
			</div>

			<%
				}
			%>

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
	
</body>
</html>