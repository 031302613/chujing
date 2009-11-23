package com.javaBean;

import java.util.Date;

public class Case {
	private String caseId;
	public String getCaseId() {
		return caseId;
	}
	public void setCaseId(String caseId) {
		this.caseId = caseId;
	}
	public String getCaseTitle() {
		return caseTitle;
	}
	public void setCaseTitle(String caseTitle) {
		this.caseTitle = caseTitle;
	}
	public String getCaseIntroduction() {
		return caseIntroduction;
	}
	public void setCaseIntroduction(String caseIntroduction) {
		this.caseIntroduction = caseIntroduction;
	}
	public String getCaseCustomer() {
		return caseCustomer;
	}
	public void setCaseCustomer(String caseCustomer) {
		this.caseCustomer = caseCustomer;
	}
	public Date getCasePublishTime() {
		return casePublishTime;
	}
	public void setCasePublishTime(Date casePublishTime) {
		this.casePublishTime = casePublishTime;
	}
	public String getCase3DPath() {
		return case3DPath;
	}
	public void setCase3DPath(String case3DPath) {
		this.case3DPath = case3DPath;
	}
	public String getCaseRARPath() {
		return caseRARPath;
	}
	public void setCaseRARPath(String caseRARPath) {
		this.caseRARPath = caseRARPath;
	}
	public String getCase3DSize() {
		return case3DSize;
	}
	public void setCase3DSize(String case3DSize) {
		this.case3DSize = case3DSize;
	}
	public String getCaseRARSize() {
		return caseRARSize;
	}
	public void setCaseRARSize(String caseRARSize) {
		this.caseRARSize = caseRARSize;
	}
	public String getCaseScreenshot1() {
		return caseScreenshot1;
	}
	public void setCaseScreenshot1(String caseScreenshot1) {
		this.caseScreenshot1 = caseScreenshot1;
	}
	public String getCaseScreenshot2() {
		return caseScreenshot2;
	}
	public void setCaseScreenshot2(String caseScreenshot2) {
		this.caseScreenshot2 = caseScreenshot2;
	}
	public String getCaseScreenshot3() {
		return caseScreenshot3;
	}
	public void setCaseScreenshot3(String caseScreenshot3) {
		this.caseScreenshot3 = caseScreenshot3;
	}
	public String getCaseScreenshot4() {
		return caseScreenshot4;
	}
	public void setCaseScreenshot4(String caseScreenshot4) {
		this.caseScreenshot4 = caseScreenshot4;
	}
	public String getCaseScreenshot5() {
		return caseScreenshot5;
	}
	public void setCaseScreenshot5(String caseScreenshot5) {
		this.caseScreenshot5 = caseScreenshot5;
	}
	private String caseTitle;
	private String caseIntroduction;
	private String caseCustomer;
	private Date casePublishTime;
	private String case3DPath;
	private String caseRARPath;
	private String case3DSize;
	private String caseRARSize;
	private String caseScreenshot1;
	private String caseScreenshot2;
	private String caseScreenshot3;
	private String caseScreenshot4;
	private String caseScreenshot5;
	private int caseStar;
	public int getCaseStar() {
		return caseStar;
	}
	public void setCaseStar(int caseStar) {
		this.caseStar = caseStar;
	}
}
