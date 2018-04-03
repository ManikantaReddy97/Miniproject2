package com.helper;

import java.sql.Date;

public class Notification {

	private int notifyId;
	private int senderId;
	private int receiverId;
	private String fileName;
    private String filePath;
	private Date sentTime;
	private String writtenText;
	
	
	public int getNotifyId() {
		return notifyId;
	}

	public void setNotifyId(int notifyId) {
		this.notifyId = notifyId;
	}
 
	public int getSenderId() {
		return senderId;
	}

	public void setSenderId(int senderId) {
		this.senderId = senderId;
	}

	public int getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(int receiverId) {
		this.receiverId = receiverId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	public Date getSentTime() {
		return sentTime;
	}
	
	public void setSentTime(Date sentTime) {
		this.sentTime = sentTime;
	}
	
	public String getWrittenText() {
		return writtenText;
	}
	
	public void setWrittenText(String writtenText) {
		this.writtenText = writtenText;
	}
}
