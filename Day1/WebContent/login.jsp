<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
	<%
		String user_id = request.getParameter("user_id");
		String user_passwd = request.getParameter("user_id");
		String cookie_id = request.getParameter("cookie_id");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
			con = ds.getConnection();
			String sql = "select user_passwd from user where user_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,user_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
			String passwd = rs.getString("user_passwd");
				String URL = "boardList.jsp";
				if(passwd.equals(user_passwd)){
					session.setAttribute("user_id", user_id);
					 	if(cookie_id !=null && cookie_id.trim().equals("on")){
							Cookie cookie = new Cookie("cookie_id",user_id);
							cookie.setMaxAge(60*60);
							response.addCookie(cookie);
						}else{
							Cookie cookie = new Cookie("cookie_id",user_id);
							cookie.setMaxAge(0);
							response.addCookie(cookie);
						} 
				}
				response.sendRedirect(URL);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			rs.close();
			pstmt.close();
			con.close();
		}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>