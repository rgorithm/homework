<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
    <%
    int board_num = Integer.parseInt(request.getParameter("num"));
    
    Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MySQLDB");
		con = ds.getConnection();
		String sql = "select * from board where board_num =?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,board_num);
		rs = pstmt.executeQuery();
		if(rs.next()){
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="boardModify.jsp" method=post enctype="multipart/form-data">
<table height="300" width="500" align="center">
	<tr>
		<td>글제목</td><td><input type="text" name="board_title" value=<%=rs.getString("board_title")%>></td>
	</tr>
	<tr>
		<td>글내용</td><td><textArea name="board_content"><%=rs.getString("board_content") %></textArea></td>
		
	</tr>
	<tr>
		<td>첨부파일</td><td><%=rs.getString("board_filename") %></td>
		<input type="hidden" name="existing_file" value="<%=rs.getString("board_filename") %>">
	</tr>
	<tr>
		<td>첨부파일수정</td><td><input type="file" name="updatefilename"></td>
	</tr>
	<tr>
		<input type="hidden" name="board_num" value="<%=board_num %>">
		<td><input type="submit" value="수정"></a></td>
	</tr>
</table>
	<%	}
		}catch(Exception e){
		e.printStackTrace();
		}finally{
			rs.close();
			pstmt.close();
			con.close();
		}
		%>
</form>
</body>
</html>