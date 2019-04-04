<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>RESULT</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page import = "javax.sql.*" %>

<%

	//Get data from form
	String fname = request.getParameter("first_name");
	String lname = request.getParameter("last_name");
	String mname = request.getParameter("middle_name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String address = request.getParameter("address");
	int id=0;
	
	//Make a connection to database
	String url = "jdbc:sqlserver://localhost:1433;databaseName=sample;integratedSecurity=true";
	DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
	Connection conn = DriverManager.getConnection(url);
	Statement s =conn.createStatement();
	
	ResultSet rs = s.executeQuery("SELECT * from uni_id where ind =1;");
	while(rs.next()){
	int t = rs.getInt("value");
	
	id=t+1;
	}
	String query = "insert into form_data values('"+fname+"','"+mname+"','"+lname+"','"+age+"','"+gender+"','"+address+"','"+id+"')";
	
	int i = s.executeUpdate(query);
	
	s.executeUpdate("update uni_id set value = value +1");  
	
	s.close();
	conn.close();
	
	out.println("<H1>SUCCESSFULLY REGISTERED!!!</H1>");
	out.println("<br>");
	out.println("<H3>Your id is : "+id+"</H3>");
%>


</body>
</html>