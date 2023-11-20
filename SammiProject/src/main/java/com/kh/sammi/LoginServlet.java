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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
		String jdbcUsername ="sm";
		String jdbcPassword ="sm1234";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		
		
		String id = request.getParameter("ID");
		String password = request.getParameter("PASSWORD");
		
		//·Î±×ÀÎ SELECT
		String sql = "SELECT * FROM USERINFO WHERE ID = ? AND PASSWORD =?";
		
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, id);
		preparedStatement.setString(2, password);
		
		ResultSet result = preparedStatement.executeQuery();
		
		if(result.next()) {
			HttpSession session = request.getSession();
			
			// 이게 세션에 넣는코드
			session.setAttribute("ID",result.getString("ID"));
			session.setAttribute("USER_ID",result.getInt("USER_ID"));
			session.setAttribute("PASSWORD",result.getString("PASSWORD"));
			session.setAttribute("ADDRESS",result.getString("ADDRESS"));

			DAO interDAO = new DAO();
			Intermediary inter = interDAO.getIntermediaryInfo(result.getInt("USER_ID"));
			
			if (inter != null) {
				session.setAttribute("INTERMEDIARY_ID", inter.getINTERMEDIARY_ID());
			}
			// If 추가
		 	// 입력한 id,pw 값이랑 db에 있는 값이랑 비교해서 맞다면 main
			/* 기존 동재님 코드 수정
			response.sendRedirect("Main.jsp");
		}else {
			request.setAttribute("loginError","true");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}	
			 */
			//login_success, login_error 활용
			response.sendRedirect("login_success.jsp");
		}else {
			request.setAttribute("loginError","true");
			request.getRequestDispatcher("login_error.jsp").forward(request, response);
		}
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
		
				
	}
	
}