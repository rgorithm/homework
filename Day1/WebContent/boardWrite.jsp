<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>



<%	
	String board_title = request.getParameter("board_title");
	String board_content = request.getParameter("board_content");
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
		con = ds.getConnection();
		String sql = "insert into board(board_title,board_content,board_writer) values(?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1 ,board_title);
		pstmt.setString(2 , board_content);
		pstmt.setString(3 , "아이디");
		pstmt.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
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