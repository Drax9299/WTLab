package com.srk.pkg;
import java.sql.*;

public class checkdatabase {

	public static void main(String args[]) throws SQLException {
		
		String url = "jdbc:sqlserver://localhost:1433;databaseName=sample;integratedSecurity=true";
		
		DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
		
		
		Connection conn = DriverManager.getConnection(url);
		if (conn != null) {
		    System.out.println("Connected");
		}
		
		Statement s =conn.createStatement();
		
		String query = "insert into test values('hello','yo')";
		
		s.executeUpdate(query);
		
		s.close();
		conn.close();

	
	}
}
