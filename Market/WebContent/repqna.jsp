<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="app.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Q and A</title>
</head>
<body>
<h1>Hello <%=session.getAttribute("user")%></h1>
<form action = "answer.jsp" method="post">
	<table>
		<tr><td>Answer a Question:</td></tr>
		<tr><td>Enter qId: <input type= text name="qId"> </td></tr>
		<tr><td>Enter answer: <input type= text name="answer"> </td></tr>
		<tr><td><input type="submit" value="Submit"></td></tr>
	</table>
	</form>
List of questions and answers:
	<% try {
			//Get the database connection
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebay","root", "Qwe123456");		
			Statement stmt = con.createStatement();
			
			String str = "select * from qna";
			ResultSet result = stmt.executeQuery(str);
		%>
			
		<!--  Make an HTML table to show the results in: -->
	<table>
		<tr>    
			<td>qId</td>
			<td>Question</td>
			<td>Answer</td>
		</tr>
			<%
			//parse out the results
			while (result.next() ) { %>
				<tr>    
					<td><%= result.getString("qId") %></td>
					<td><%= result.getString("question") %></td>
					<td><%= result.getString("answer") %></td>
				</tr>
				

			<% }
			//close the connection.
			con.close();
			%>
		</table>

			
		<%} catch (Exception e) {
			out.print(e);
		}%>
		<br>
		
	<a href='customer_rep_welcome.jsp'>Go back</a>
</body>
</html>