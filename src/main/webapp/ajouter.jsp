<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<% 
String login="";
 if(session.getAttribute("login")!=null){
     login=session.getAttribute ("login").toString ();
 }else{
     response.sendRedirect ("auth.jsp");
 }
       %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Project </title>
</head>
<body>

<div align="right">
    Bonjour <%=login %><br>
    <a href="Logout">Logout</a>
</div>
<h1>Ajouter un Etudiant</h1>
<form method="POST" action="Ajouter">

<table border ="1"> 


<tr>
	<td>Nom de l'etudiant </td>
	<td> <input type ="text" name="nom" required > </td>
</tr>
<tr>
	<td>Prénom de l'etudiant </td>
	<td> <input type ="text" name="prenom" required  > </td>
</tr>

<tr>
	<td>Nom de matiére </td>
	<td> <input type ="text" name="nommat" required  > </td>
</tr>
<tr>
	<td>cofficient de matiére </td>
	<td> <input type ="text" name="coef" required  > </td>
</tr>
<tr>
	<td>Note de TP </td>
	<td> <input type ="text" name="notetp" required  > </td>
</tr>
<tr>
	<td>Note de DS </td>
	<td> <input type ="text" name="noteds" required  > </td>
</tr>
<tr>
	<td>Note de l'examen </td>
	<td> <input type ="text" name="noteex" required  > </td>
</tr>

<tr>
    <td  colsapn="2">
        <input type="submit" value="Ajouter">
        <input type="reset" value="Retablir">
    </td>
</tr> 
</table>
</form>

</body>
</html>