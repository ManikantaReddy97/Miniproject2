package com.helper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AvailableUsers {
	
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
	
	public static List<User> getAvailableUsers(String userName) throws SQLException {
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
		List<User> users = new ArrayList<>();
		try {

			dbConnection = getDBConnection();
			System.out.println("userName:"+userName);
			// Step 3 preparing query
			final String query = "select user_name from USER_DETAILS where user_name!=?";
			preparedStatement = dbConnection.prepareStatement(query);
			
			preparedStatement.setString(1, userName);

			// Step 4 executing query

			ResultSet rs = preparedStatement.executeQuery();
			System.out.println("getAvailableUsers from Database");

			// step 5 retrieving the result

			while (rs.next()) {
				final User user = new User();
				user.setUserName(rs.getString("user_name"));
				users.add(user);
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
		return users;
	}
}
