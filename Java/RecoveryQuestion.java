package com.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RecoveryQuestion {

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

	public static List<Question> getAllQuestions() throws SQLException {
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
		List<Question> questions = new ArrayList<>();
		try {

			dbConnection = getDBConnection();

			// Step 3 preparing query
			final String query = "select QID, QNAME from QUESTIONS";
			preparedStatement = dbConnection.prepareStatement(query);

			// Step 4 executing query

			ResultSet rs = preparedStatement.executeQuery();
			System.out.println("getAllQuestions from Database");

			// step 5 retrieving the result

			while (rs.next()) {
				final Question question = new Question();
				question.setQid(rs.getInt("QID"));
				question.setQvalue(rs.getString("QNAME"));
				questions.add(question);
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
		return questions;
	}
	
	
	public static Question getQuestion(final int qid) throws SQLException{
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
		Question question= null;
		try {
			dbConnection = getDBConnection();
			
			   //Step 3 preparing query
			    final String query="select QNAME from QUESTIONS where QID=?";
			    preparedStatement = dbConnection.prepareStatement(query);
			    preparedStatement.setInt(1, qid);
			
			   // Step 4 executing query
				
			    ResultSet rs= preparedStatement.executeQuery();
			    System.out.println("getQuestion from Database");
			    
			    // step 5 retrieving the result
			    
			    while(rs.next()) {
			    	question = new Question();
			    	question.setQvalue(rs.getString("QNAME"));
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
		
	return question;	
	}
}

