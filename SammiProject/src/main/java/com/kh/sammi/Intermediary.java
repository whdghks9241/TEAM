package com.kh.sammi;

public class Intermediary {

	// 중개인번호
	private int INTERMEDIARY_ID; 
	// 사업자번호
	private String BUSINESS_NUMBER;
	// 대표자이름
	private String CEO_NAME;
	// 부동산이름
	private String COMPANY_NAME;
	// 부동산주소
	private String COMPANY_ADDRESS;
	// 문의시작시간
	private String CONTACT_START_TIME;
	// 문의종료시간
	private String CONTACT_END_TIME;
	// 유저아이디
	private int INTERMEDIARY_USER_ID;
	
	public Intermediary(int INTERMEDIARY_ID, String BUSINESS_NUMBER, String CEO_NAME, String COMPANY_NAME, String COMPANY_ADDRESS, String CONTACT_START_TIME, String CONTACT_END_TIME, int INTERMEDIARY_USER_ID) {

		this.INTERMEDIARY_ID = INTERMEDIARY_ID;
		this.BUSINESS_NUMBER = BUSINESS_NUMBER;
		this.CEO_NAME = CEO_NAME;
		this.COMPANY_NAME = COMPANY_NAME;
		this.COMPANY_ADDRESS = COMPANY_ADDRESS;
		this.CONTACT_START_TIME = CONTACT_START_TIME;
		this.CONTACT_END_TIME = CONTACT_END_TIME;
		this.INTERMEDIARY_USER_ID = INTERMEDIARY_USER_ID;
	}

	public int getINTERMEDIARY_ID() {
		return INTERMEDIARY_ID;
	}
	
	public String getBUSINESS_NUMBER() {
		return BUSINESS_NUMBER;
	}

	public String getCEO_NAME() {
		return CEO_NAME;
	}

	public String getCOMPANY_NAME() {
		return COMPANY_NAME;
	}

	public String getCOMPANY_ADDRESS() {
		return COMPANY_ADDRESS;
	}

	public String getCONTACT_START_TIME() {
		return CONTACT_START_TIME;
	}

	public String getCONTACT_END_TIME() {
		return CONTACT_END_TIME;
	}

	public int getINTERMEDIARY_USER_ID() {
		return INTERMEDIARY_USER_ID;
	}
	
	public void setINTERMEDIARY_ID(int iNTERMEDIARY_ID) {
		INTERMEDIARY_ID = iNTERMEDIARY_ID;
	}

	public void setBUSINESS_NUMBER(String bUSINESS_NUMBER) {
		BUSINESS_NUMBER = bUSINESS_NUMBER;
	}

	public void setCEO_NAME(String cEO_NAME) {
		CEO_NAME = cEO_NAME;
	}

	public void setCOMPANY_NAME(String cOMPANY_NAME) {
		COMPANY_NAME = cOMPANY_NAME;
	}

	public void setCOMPANY_ADDRESS(String cOMPANY_ADDRESS) {
		COMPANY_ADDRESS = cOMPANY_ADDRESS;
	}

	public void setCONTACT_START_TIME(String cONTACT_START_TIME) {
		CONTACT_START_TIME = cONTACT_START_TIME;
	}

	public void setCONTACT_END_TIME(String cONTACT_END_TIME) {
		CONTACT_END_TIME = cONTACT_END_TIME;
	}


	public void setINTERMEDIARY_USER_ID(int iNTERMEDIARY_USER_ID) {
		INTERMEDIARY_USER_ID = iNTERMEDIARY_USER_ID;
	}

}