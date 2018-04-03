package com.helper;

import java.sql.*;

public class RegisterForm {

	private static final String DB_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String DB_CONNECTION = "jdbc:oracle:thin:@localhost:1521/XE";
	private static final String DB_USER = "sample";
	private static final String DB_PASSWORD = "sample";
//	public static void main(String[] args) throws SQLException {
//
//		try {
//
//			insertRecordIntoTable("mkyong", "system");
//
//		} catch (SQLException e) {
//
//			System.out.println(e.getMessage());
//
//		}
//	}

	
	private static Connection getDBConnection() {

		Connection dbConnection = null;

		try {

			Class.forName(DB_DRIVER);

		} catch (ClassNotFoundException e) {

			System.out.println(e.getMessage());

		}

		try {

			dbConnection = DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);
			return dbConnection;

		} catch (SQLException e) {

			System.out.println(e.getMessage());

		}

		return dbConnection;
	}
	
	
	public static void insertRecordIntoTable(final User user) throws SQLException {

		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;

		final String insertTableSQL = "insert into USER_DETAILS(First_name,Last_name,User_name,Email_id,Password,QID,USER_ANSWER) values(?,?,?,?,?,?,?)";

		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(insertTableSQL);

			preparedStatement.setString(1, user.getFirstName());
			preparedStatement.setString(2, user.getLastName());
			preparedStatement.setString(3, user.getUserName());
			preparedStatement.setString(4, user.getEmail());
			preparedStatement.setString(5, user.getPassword());
			preparedStatement.setString(6, user.getQuestion());
			preparedStatement.setString(7, user.getAnswer());

		//	 execute insert SQL statement
			preparedStatement.executeUpdate();

			System.out.println("Record is inserted into USER_DETAILS table!");

		} catch (SQLException e) {

			System.out.println(e.getMessage());

		} finally {

			if (preparedStatement != null) {
				preparedStatement.close();
			}

			if (dbConnection != null) {
				dbConnection.close();
			}

		}

	}


	public static User fetchData(final String userName, final String password) throws SQLException{
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
		User user = null;
		try { 
			
			dbConnection = getDBConnection();
			
		   //Step 3 preparing query
		    final String query="select User_id,First_name,Last_name,User_name,Email_id from USER_DETAILS where User_name=? and Password=?";
		    preparedStatement = dbConnection.prepareStatement(query);
		    preparedStatement.setString(1, userName);
		    preparedStatement.setString(2, password);
		
		   // Step 4 executing query
			
		    ResultSet rs= preparedStatement.executeQuery();
		    System.out.println("fetchData from Database");
		    
		    // step 5 retrieving the result
		    
		    while(rs.next()) {
		    	user = new User();
		    	user.setUserId(rs.getInt("User_id"));
		    	user.setFirstName(rs.getString("First_name"));
		    	user.setLastName(rs.getString("Last_name"));
		    	user.setUserName(rs.getString("User_name"));
		    	user.setEmail(rs.getString("Email_id"));
		    	
		    }
	}
		
		catch (SQLException e) {

			e.printStackTrace();
		}
		
		finally {

			if (preparedStatement != null) {
				preparedStatement.close();
			}

			if (dbConnection != null) {
				dbConnection.close();
			}


	}
		return user;		
}
}
