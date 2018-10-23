<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
		con = ds.getConnection();
		String sql = "select * from board";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글목록</title>
</head>
<body>

<jsp:include page="include.jsp" flush="false" /><br><br>

<table align="center" border="1">
	<tr>
		<td>글번호</td><td>글제목</td><td>작성자</td><td>날짜</td>
	</tr>
	<%while(rs.next()){%>
	<tr>
		
		<td><%=rs.getInt("board_num")%></td>
		<td><a href="boardDetail.jsp?num=<%=rs.getInt("board_num") %>"><%=rs.getString("board_title")%></a></td>
		<td><%=rs.getString("board_writer")%></td>
		<td><%=rs.getString("date")%></td>
	</tr>
	<%}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		rs.close();
		pstmt.close();
		con.close();
	}%>
	<tr>
		<td colspan="4" align="center"><a href="boardWriteForm.jsp"><input type="button" value="글작성"></a></td>
	</tr>
</table>
</body>
</html>
