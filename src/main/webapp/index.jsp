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
<meta charset="UTF-8">
<title>Home Page</title>
</head>
	<body>
<div align="right">
    Bonjour <%=login %><br>
    <a href="Logout">Logout</a>
</div>
<h1>Liste des Etudiants</h1>
<table border="1" width="100%">
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Prénom</th>
        <th>coef</th>
        <th>nommat </th>
        <th>notetp</th>
        <th>noteds </th>
        <th>noteex </th>
        <th>Moyenne de matière</th>
        
    </tr>
    
    
    <%
	String url="jdbc:mysql://localhost:3306/jee_etudiant";
	String user= "root";
	String pwd = "";  
	int number=0; 
	             
	            
	try{
	     Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection con = DriverManager.getConnection (url, user , pwd );
	    PreparedStatement pst=con.prepareStatement ("SELECT * FROM etudiant  ");
	   
	    ResultSet rs =   pst.executeQuery();
	
	    while(rs.next()){ 
	    	%> 
	    
	        <tr>
	            <td><%=rs.getString(1) %></td>
	            <td><%=rs.getString(2) %></td>
	            <td><%=rs.getString(3) %></td>
	            <td><%=rs.getString(4) %></td>
	            <td><%=rs.getString(5) %></td> 
	            <td><%=rs.getString(6) %></td>
	            <td><%=rs.getString(7) %></td>
	           
	           	<td><%=rs.getDouble(8) %></td>
	           	 <td><%=rs.getString(9) %></td>
	           	 	
	           	 
	           	 
	           
	            
	    <td><a href="Delete?id=<%=rs.getString(1) %>">Supprimer</a></td>
 
	        </tr>
	       <% 
	    }
	    pst=con.prepareStatement ("SELECT COUNT(*) FROM etudiant");
	    rs =pst.executeQuery();
	    rs.next();
	    number = rs.getInt(1); 
	    rs.close();
	    pst.close();
	    con.close();
	}catch (Exception e) { 
		System.out.print(e);
}
    %>
    

</table>
 Nombre des étudiants : <%=number %> <br>
 <a href="ajouter.jsp" > Ajouter un étudiants </a>
 
</body>
</html>