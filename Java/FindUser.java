package com.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FindUser {
	private static final String DB_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String DB_CONNECTION = "jdbc:oracle:thin:@localhost:1521/XE";
	private static final String DB_USER = "sample";
	private static final String DB_PASSWORD = "sample";

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
	

	public static User findUserByName(String userName) throws SQLException {

		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
		User user = null;

		try {

			dbConnection = getDBConnection();
			// Step 3 preparing query
			final String query = "select First_name,Last_name,User_name,Email_id from USER_DETAILS where User_name=?";
			preparedStatement = dbConnection.prepareStatement(query);
			preparedStatement.setString(1, userName);

			// Step 4 executing query

			ResultSet rs = preparedStatement.executeQuery();
			System.out.println("finding a user by name from Database");

			// step 5 retrieving the result

			while (rs.next()) {
				user = new User();
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

	
	public static boolean updateUserPassword(String userName , String password) throws SQLException {
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
		boolean isPasswordChanged=false;
		
		try {
			dbConnection = getDBConnection();
			// Step 3 preparing query
			final String query = "update USER_DETAILS set Password=? where User_name=?";
			preparedStatement = dbConnection.prepareStatement(query);
			preparedStatement.setString(1, password);
			preparedStatement.setString(2, userName);

			// Step 4 executing query

			 preparedStatement.executeUpdate();
			System.out.println("Updating password in Database");
			isPasswordChanged=true;
			// step 5 retrieving the result
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
		return isPasswordChanged;
	}

}
