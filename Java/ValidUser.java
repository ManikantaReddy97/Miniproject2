package com.helper;

import java.sql.*;

public class ValidUser {

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


	public static boolean userAlreadyExist(final String userName) throws SQLException {
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
		boolean isUserExists = false;
		
		try {

			dbConnection = getDBConnection();

			// Step 3 preparing query
			final String query = "select User_name from USER_DETAILS where User_name=?";
			preparedStatement = dbConnection.prepareStatement(query);
			preparedStatement.setString(1, userName);

			// Step 4 executing query

			ResultSet rs = preparedStatement.executeQuery();
			System.out.println("userAlreadyExist from Database");

			// step 5 retrieving the result

			while (rs.next()) {
				isUserExists = true;
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
		return isUserExists;
	}
}

