package com.kh.sammi;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class DAO {
	
	private static final String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String jdbcUsername = "sm";
	private static final String jdbcPassword = "sm1234";
//	private static final String jdbcUsername = "SM";
//	private static final String jdbcPassword = "SM1234";

	
	PreparedStatement ps;
	ResultSet result;
	Intermediary intermediary = null;
	Realestate realestate = null;
	String sqlQuery = null;
	Connection connection;
	sql sql = new sql();
	
	public DAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Intermediary getIntermediaryInfo(int USER_ID) {


		try {
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			
			sqlQuery = sql.intermediarySearch();
			ps = connection.prepareStatement(sqlQuery);
			
			ps.setInt(1, USER_ID);
			
			result = ps.executeQuery();
			
			if (result.next()) {
				int INTERMEDIARY_ID = result.getInt("INTERMEDIARY_ID");
				String BUSINESS_NUMBER = result.getString("BUSINESS_NUMBER");
				String CEO_NAME = result.getString("CEO_NAME");
				String COMPANY_NAME = result.getString("COMPANY_NAME");
				String COMPANY_ADDRESS = result.getString("COMPANY_ADDRESS");
				String CONTACT_START_TIME = result.getString("CONTACT_START_TIME");
				String CONTACT_END_TIME = result.getString("CONTACT_END_TIME");
				int INTERMEDIARY_USER_ID = result.getInt("INTERMEDIARY_USER_ID");
			
				intermediary = new Intermediary(INTERMEDIARY_ID, BUSINESS_NUMBER, CEO_NAME, COMPANY_NAME, COMPANY_ADDRESS, CONTACT_START_TIME, CONTACT_END_TIME, INTERMEDIARY_USER_ID);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return intermediary;
	}
	
	public Realestate getRealestaInfo(int REALESTATE_ID, int INTERMEDIARY_ID) {
		
		try {
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			
			sqlQuery = sql.realestateTargetSearch();
			ps = connection.prepareStatement(sqlQuery);

			ps.setInt(1, INTERMEDIARY_ID);
			ps.setInt(2, REALESTATE_ID);
			
			result = ps.executeQuery();
			
			if (result.next()) {
				String REALESTATE_NAME = result.getString("REALESTATE_NAME");
				String REALESTATE_ADDRESS = result.getString("REALESTATE_ADDRESS");
				String REALESTATE_TYPE = result.getString("REALESTATE_TYPE");
				String REALESTATE_CONDITION = result.getString("REALESTATE_CONDITION");
				double REALESTATE_AREA = result.getDouble("REALESTATE_AREA");
				String FLOORS = result.getString("FLOORS");
				int ROOMS_COUNT = result.getInt("ROOMS_COUNT");
				int TOILET_COUNT = result.getInt("TOILET_COUNT");
				int REALESTATE_SALEPRICE = result.getInt("REALESTATE_SALEPRICE");
				int REALESTATE_MONTHLY = result.getInt("REALESTATE_MONTHLY");
				int REALESTATE_MAINTENANCE_COST = result.getInt("REALESTATE_MAINTENANCE_COST");
				Date AVAILABLE_MOVE_IN_DATE = result.getDate("AVAILABLE_MOVE_IN_DATE");
				int PARKING_COUNT = result.getInt("PARKING_COUNT");
				String REALESTATE_OPTIION = result.getString("REALESTATE_OPTIION");
				String OTHER_COMMENT = result.getString("OTHER_COMMENT");
				Date REALESTATE_DATE = result.getDate("REALESTATE_DATE");
				
				
				Blob REALESTATE_PHOTOS_blob =  result.getBlob("REALESTATE_PHOTOS");
				byte[] imageData = REALESTATE_PHOTOS_blob.getBytes(1, (int) REALESTATE_PHOTOS_blob.length());

                String imageBase64 = java.util.Base64.getEncoder().encodeToString(imageData);
                String REALESTATE_PHOTOS = "data:image/jpeg;base64, " + imageBase64;
                 
				realestate = new Realestate(1,INTERMEDIARY_ID, REALESTATE_NAME, REALESTATE_ADDRESS, REALESTATE_TYPE, REALESTATE_CONDITION, REALESTATE_AREA, FLOORS, ROOMS_COUNT, TOILET_COUNT,
						REALESTATE_SALEPRICE, REALESTATE_MONTHLY, REALESTATE_MAINTENANCE_COST, AVAILABLE_MOVE_IN_DATE, PARKING_COUNT, REALESTATE_OPTIION, REALESTATE_PHOTOS, OTHER_COMMENT, REALESTATE_DATE);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return realestate;
	}
	
	public List<Realestate> getAllRealestateInfo(int INTERMEDIARY_ID) {
		
		List<Realestate> realestateList = new ArrayList<>();
		
		try {
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			
			sqlQuery = sql.realestateSearch();
			ps = connection.prepareStatement(sqlQuery);

			ps.setInt(1, INTERMEDIARY_ID);
			
			result = ps.executeQuery();
			
			while(result.next()) {
				// 매물번호
				int REALESTATE_ID = result.getInt("REALESTATE_ID");
				// 계약조건
				String REALESTATE_CONDITION = result.getString("REALESTATE_CONDITION");
				// 계약금액
				int REALESTATE_SALEPRICE = result.getInt("REALESTATE_SALEPRICE");
				// 월세
				int REALESTATE_MONTHLY = result.getInt("REALESTATE_MONTHLY");
				// 관리비
				int REALESTATE_MAINTENANCE_COST = result.getInt("REALESTATE_MAINTENANCE_COST");
				// 매물유형
				String REALESTATE_TYPE = result.getString("REALESTATE_TYPE");
				// 면적
				double REALESTATE_AREA = result.getDouble("REALESTATE_AREA");
				//층수
				String FLOORS = result.getString("FLOORS");
				// 방 개수
				int ROOMS_COUNT = result.getInt("ROOMS_COUNT");
				// 화장실
				int TOILET_COUNT = result.getInt("TOILET_COUNT");
				// 주차가능
				int PARKING_COUNT = result.getInt("PARKING_COUNT");

				// 사진
				Blob REALESTATE_PHOTOS_blob =  result.getBlob("REALESTATE_PHOTOS");
				byte[] imageData = REALESTATE_PHOTOS_blob.getBytes(1, (int) REALESTATE_PHOTOS_blob.length());

                String imageBase64 = java.util.Base64.getEncoder().encodeToString(imageData);
                String REALESTATE_PHOTOS = "data:image/jpeg;base64, " + imageBase64;
                
				Realestate realestate = new Realestate(REALESTATE_ID, REALESTATE_CONDITION, REALESTATE_SALEPRICE, REALESTATE_MONTHLY, REALESTATE_MAINTENANCE_COST,
						REALESTATE_TYPE, REALESTATE_AREA, FLOORS, ROOMS_COUNT, TOILET_COUNT, PARKING_COUNT, REALESTATE_PHOTOS);
				realestateList.add(realestate);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return realestateList;
	}
	
	public List<Realestate> getTypeRealestateInfo(int INTERMEDIARY_ID, String REALESTATE_TYPE) {
		
		List<Realestate> realestateList = new ArrayList<>();
		
		try {
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			
			sqlQuery = sql.realestateTypeSearch();
			ps = connection.prepareStatement(sqlQuery);

			ps.setInt(1, INTERMEDIARY_ID);
			ps.setString(2, REALESTATE_TYPE);
			
			result = ps.executeQuery();
			
			while(result.next()) {
				// 매물번호
				int REALESTATE_ID = result.getInt("REALESTATE_ID");
				// 계약조건
				String REALESTATE_CONDITION = result.getString("REALESTATE_CONDITION");
				// 계약금액
				int REALESTATE_SALEPRICE = result.getInt("REALESTATE_SALEPRICE");
				// 월세
				int REALESTATE_MONTHLY = result.getInt("REALESTATE_MONTHLY");
				// 관리비
				int REALESTATE_MAINTENANCE_COST = result.getInt("REALESTATE_MAINTENANCE_COST");
				// 면적
				double REALESTATE_AREA = result.getDouble("REALESTATE_AREA");
				//층수
				String FLOORS = result.getString("FLOORS");
				// 방 개수
				int ROOMS_COUNT = result.getInt("ROOMS_COUNT");
				// 화장실
				int TOILET_COUNT = result.getInt("TOILET_COUNT");
				// 주차가능
				int PARKING_COUNT = result.getInt("PARKING_COUNT");

				
				// 사진
				Blob REALESTATE_PHOTOS_blob =  result.getBlob("REALESTATE_PHOTOS");
				byte[] imageData = REALESTATE_PHOTOS_blob.getBytes(1, (int) REALESTATE_PHOTOS_blob.length());

                String imageBase64 = java.util.Base64.getEncoder().encodeToString(imageData);
                String REALESTATE_PHOTOS = "data:image/jpeg;base64, " + imageBase64;
                
				Realestate realestate = new Realestate(REALESTATE_ID, REALESTATE_CONDITION, REALESTATE_SALEPRICE, REALESTATE_MONTHLY, REALESTATE_MAINTENANCE_COST,
						REALESTATE_TYPE, REALESTATE_AREA, FLOORS, ROOMS_COUNT, TOILET_COUNT, PARKING_COUNT, REALESTATE_PHOTOS);
				realestateList.add(realestate);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return realestateList;
	}
}