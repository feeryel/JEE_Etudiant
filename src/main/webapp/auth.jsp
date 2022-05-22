<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<form method="POST" action="Login">
<table style="border:solid 4px ">
    <tr>
        <td>User name</td>
        <td><input type="text" name="login" required ></td>
    </tr>
    <tr>
        <td>Password</td>
        <td><input type="password" name="pwd" required></td>
    </tr>
    <tr>
    <td colspan="2"><input type="submit" value="Se Connecter"></td>
    </tr>
</table>
</form>
</body>
</html>