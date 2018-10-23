<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

    <%
    int board_num = Integer.parseInt(request.getParameter("board_num"));
    String board_title = request.getParameter("board_title");
    String board_content = request.getParameter("board_content");
    
    Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MySQLDB");
		con = ds.getConnection();
		String sql = "update board set board_title=?, board_content=? where board_num = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,board_title);
		pstmt.setString(2,board_content);
		pstmt.setInt(3,board_num);
		int updateCount = pstmt.executeUpdate();
			if(updateCount>0){
				System.out.println("수정성공");	
			}else{
				System.out.println("수정실패");
			}
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