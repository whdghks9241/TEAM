package com.kh.sammi;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/UserInfoUpdateServlet")
public class UserInfoUpdateServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
	    String jdbcUsername = "sm";
		String jdbcPassword = "sm1234";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try { 
			Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			
			HttpSession session = request.getSession();
			
			int USER_ID = (int) session.getAttribute("USER_ID");
			String userpw = request.getParameter("password");
			String userpwcheck = request.getParameter("confirmpassword");
			String userphonenumber = request.getParameter("phonenumber");
			String useremail = request.getParameter("email");
			String useraddress = request.getParameter("address");
			
			String sql = "UPDATE USERINFO SET password = ?, phone_number = ?,"
					+ "email = ?, address = ? WHERE USER_ID = ?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, userpw);
			ps.setString(2, userphonenumber);
			ps.setString(3, useremail);
			ps.setString(4, useraddress);
			ps.setInt(5, USER_ID);
			
	
			ps.executeUpdate();
			
			session.setAttribute("password", userpw);
			session.setAttribute("phonenumber", userphonenumber);
			session.setAttribute("email", useremail);
			session.setAttribute("address", useraddress);
			
			response.sendRedirect("MyInfo.jsp?success=true");
			request.setAttribute("success", "true");
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}