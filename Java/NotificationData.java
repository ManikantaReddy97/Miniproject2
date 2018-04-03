package com.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class NotificationData {
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

	public static void insertNotifyRecordIntoTable(final Notification notify) throws SQLException {

		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;

		final String insertTableSQL = "insert into NOTIFICATION(Sender_id, Receiver_id, File_name, File_path, Sent_time, Written_text) values(?,?,?,?,?,?)";

		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(insertTableSQL);

			preparedStatement.setInt(1, notify.getSenderId());
			preparedStatement.setInt(2, notify.getReceiverId());
			preparedStatement.setString(3, notify.getFileName());
			preparedStatement.setString(4, notify.getFilePath());
			java.sql.Timestamp currentTimeStamp = new java.sql.Timestamp((new Date()).getTime());
			preparedStatement.setTimestamp(5, currentTimeStamp);
			preparedStatement.setString(6, notify.getWrittenText());

		//	 execute insert SQL statement
			preparedStatement.executeUpdate();

			System.out.println("Record is inserted into Notification table!");

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

	
	public static List<Notification> fetchSentFileData(final int senderId) throws SQLException{
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
		final List<Notification> notifications = new ArrayList<>();
		try { 
			
			dbConnection = getDBConnection();
			
		   //Step 3 preparing query
		    final String query="select Sender_id, Receiver_id, File_name, File_path, Sent_time, Written_text from NOTIFICATION where Sender_id=?";
		    preparedStatement = dbConnection.prepareStatement(query);
		    preparedStatement.setInt(1, senderId);
		
		   // Step 4 executing query
			
		    ResultSet rs= preparedStatement.executeQuery();
		    System.out.println("fetchSentFileData from Database");
		    
		    // step 5 retrieving the result
		    
		    while(rs.next()) {
		    	final Notification notify = new Notification();
		    	notify.setSenderId(rs.getInt("Sender_id"));
		    	notify.setFileName(rs.getString("File_name"));
		    	notify.setFilePath(rs.getString("File_path"));
		    	notify.setSentTime(rs.getDate("Sent_time"));
		    	notify.setWrittenText(rs.getString("Written_text"));
		    	notifications.add(notify);
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
		return notifications;		
}
	
	
	public static List<Notification> fetchReceivedFileData(final int receiverId) throws SQLException{
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
		final List<Notification> notifications = new ArrayList<>();
		
		try { 
			
			dbConnection = getDBConnection();
			
		   //Step 3 preparing query
		    final String query="select Sender_id, Receiver_id, File_name, File_path, Sent_time, Written_text from NOTIFICATION where Sender_id=?";
		    preparedStatement = dbConnection.prepareStatement(query);
		    preparedStatement.setInt(1, receiverId);
		
		   // Step 4 executing query
			
		    ResultSet rs= preparedStatement.executeQuery();
		    System.out.println("fetchReceivedFileData from Database");
		    
		    // step 5 retrieving the result
		    
		    while(rs.next()) {
		    	final Notification notify = new Notification();
		    	notify.setReceiverId(rs.getInt("Receiver_id"));
		    	notify.setFileName(rs.getString("File_name"));
		    	notify.setFilePath(rs.getString("File_path"));
		    	notify.setSentTime(rs.getDate("Sent_time"));
		    	notify.setWrittenText(rs.getString("Written_text"));
		    	notifications.add(notify);
		    	
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
		return notifications;		
}
	
}
