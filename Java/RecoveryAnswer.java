package com.helper;

import java.sql.*;

public class RecoveryAnswer {
	
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
	
	
	
	public static boolean userRecoveryAnswer(final String userName, final String userAnswer) throws SQLException {
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
		boolean isAnswerCorrect = false;
		
		try {

			dbConnection = getDBConnection();

			// Step 3 preparing query
			final String query = "select user_answer from USER_DETAILS where user_name=? and user_answer=?";
			preparedStatement = dbConnection.prepareStatement(query);
			preparedStatement.setString(1, userName);
			preparedStatement.setString(2, userAnswer);

			// Step 4 executing query

			ResultSet rs = preparedStatement.executeQuery();
			System.out.println("userRecoveryAnswer from Database");

			// step 5 retrieving the result

			while (rs.next()) {
				isAnswerCorrect = true;
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
		return isAnswerCorrect;
	}

	
}
