<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int nowPage = 1;
		if(request.getParameter("page")!=null){
			nowPage = Integer.parseInt(request.getParameter("page"));
		}
	int offset = (nowPage - 1) * 5;
	
		//한페이지에보일글수
	int countList = 5;
		//한화면에보일페이지수
	int countPage = 5;
		//총페이지수
	int totalPage = 0;
		//총게시글수
	int totalList = 0;
	try{
		//db연걸
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
		con = ds.getConnection();
		//게시글 총 개수
		String sqltotalList = "select count(*) from board";
		pstmt = con.prepareStatement(sqltotalList);
		rs = pstmt.executeQuery();
		if(rs.next()){
		totalList = rs.getInt(1);
		}
		System.out.println("totalList:"+totalList);
		
		String sql = "select * from board limit ?,?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,offset);
		pstmt.setInt(2,countList);
		rs = pstmt.executeQuery();
		//총10개의글을 한페이지에 5개씩 보여주고싶다면 페이지수는2개
		totalPage = totalList/countList;
		//나누었을때 딱맞아 떨어지지 않는다면 페이지가 한개 더필요하니까
		if(totalList%countList>0){
			totalPage++;
		}
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
	<%}%>
	<tr>
		<td colspan="4" align="center"><a href="boardWriteForm.jsp"><input type="button" value="글작성"></a></td>
	</tr>
</table>
<table>
	<%
	int startPage = ((nowPage - 1) / 5) * 5 + 1;
	int endPage = startPage + countPage - 1;
		if(endPage > totalPage){
			endPage = totalPage;
		}
	System.out.println(startPage+","+endPage);
	%>
		<%
			if(endPage>5){%>
				<a href="boardList.jsp?page=<%=startPage-1 %>">이전</a>
		<%}
	for(int a=startPage; a<=endPage; a++){
		if(a==nowPage){%>
			<%=a %>
		<%}else{%>
			<a href="boardList.jsp?page=<%=a%>"><%=a%>&nbsp;&nbsp;&nbsp;</a>
		<%}%>
	<%}
		if(endPage<totalPage){%>
			<a href="boardList.jsp?page=<%=endPage+1 %>">다음</a>
		<%}%>
</table>
	<% 
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		rs.close();
		pstmt.close();
		con.close();
	}%>
</body>
</html>
