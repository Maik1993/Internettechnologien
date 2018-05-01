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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<h3>
	Fachbereich <%= Fachbereich %> <br>
	Titel <%= Titel %> <br>
	Autor <%= Autor %> <br>
	Preis <%= Preis %> <br>
	ISBN <%= ISBN %> <br>
	Jahr <%= Jahr %> <br>
	Auflage <%= Auflage %> <br>
	Inhalt <%= Inhalt %> <br>
	<br> <br> <br>
	<%= Fachbereich %> ,
	 <%= Titel %> ,
	 <%= Autor %> ,
	 <%= Preis%> ,
	 <%= ISBN%> ,
	 <%= Jahr%> ,
	 <%= Auflage%> ,
	 <%= Inhalt%> <br> <br> <br>
	 <%= KVS %>
	
	
	
	</h3>
	
</body>
</html>