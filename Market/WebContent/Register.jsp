<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registering</title>
</head>
<body>
<h1>Register A User Here</h1>
<form action="Registered.jsp" method="post">
	Email: <input type= text name="email"> <br> <br>
	Username: <input type= text name="uname"> <br> <br>
	Password: <input type= text name="upass"> <br> <br>
	Confirm Password: <input type= text name="upassc"> <br> <br>
	Date of Birth (Year-Month-Day): <input type= text name="dob"> <br> <br>
	<input type="submit" value="Submit">
	</form>
</body>
</html>