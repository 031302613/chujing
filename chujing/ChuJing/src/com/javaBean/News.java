package com.javaBean;

import java.util.Date;

public class News {
	private String newsId;
	public String getNewsId() {
		return newsId;
	}
	public void setNewsId(String newsId) {
		this.newsId = newsId;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public String getNewsContent() {
		return newsContent;
	}
	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}
	public Date getNewsPublishTime() {
		return newsPublishTime;
	}
	public void setNewsPublishTime(Date newsPublishTime) {
		this.newsPublishTime = newsPublishTime;
	}
	public Date getNewsModifiedTime() {
		return newsModifiedTime;
	}
	public void setNewsModifiedTime(Date newsModifiedTime) {
		this.newsModifiedTime = newsModifiedTime;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	private String newsTitle;
	private String newsContent;
	private Date newsPublishTime;
	private Date newsModifiedTime;
	private String fileName;
}
