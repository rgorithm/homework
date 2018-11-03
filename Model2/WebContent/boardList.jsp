<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.BoardBean" %>
    <%
    	ArrayList<BoardBean> boardList = (ArrayList<BoardBean>)request.getAttribute("boardList");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table align="center" border="1">
	<tr>
		<td>글번호</td><td>글제목</td><td>작성자</td><td>날짜</td>
	</tr>
	<%
		for(int i=0; i<boardList.size(); i++){
	%>
	<tr>
		<td><%=boardList.get(i).getBoard_num() %></td>
		<td><a href="./BoardDetail?board_num=<%=boardList.get(i).getBoard_num() %>"><%=boardList.get(i).getBoard_title() %></a></td>
		<td><%=boardList.get(i).getBoard_writer() %></td>
		<td><%=boardList.get(i).getDate() %></td>
	</tr>
	<%
		}
	%>
	<tr>
		<td colspan="4" align="center"><a href="./BoardWriteForm"><input type="button" value="글작성"></a></td>
	</tr>
</table>
<table>
</body>
</html>