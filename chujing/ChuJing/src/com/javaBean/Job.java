package com.javaBean;

import java.util.Date;
public class Job {
	public String getJobId() {
		return jobId;
	}
	public void setJobId(String jobId) {
		this.jobId = jobId;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getJobContent() {
		return jobContent;
	}
	public void setJobContent(String jobContent) {
		this.jobContent = jobContent;
	}
	public Date getJobPublishTime() {
		return jobPublishTime;
	}
	public void setJobPublishTime(Date jobPublishTime) {
		this.jobPublishTime = jobPublishTime;
	}
	public String getJobAvailableTime() {
		return jobAvailableTime;
	}
	public void setJobAvailableTime(String jobAvailableTime) {
		this.jobAvailableTime = jobAvailableTime;
	}
	private String jobId;
	private String jobTitle;
	private String jobContent;
	private Date jobPublishTime;
	private String jobAvailableTime;
}
