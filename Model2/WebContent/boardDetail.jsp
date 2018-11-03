<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.BoardBean" %>
	<%
		BoardBean board = (BoardBean)request.getAttribute("board");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table height="300" width="500" align="center">
<%
%>
	<tr>
		<td>글쓴이 </td><td> <%=board.getBoard_writer()%></td>
	</tr>
	<tr>
		<td>글제목</td><td> <%=board.getBoard_title()%></td>
	</tr>
	<tr>
		<td>글내용</td><td> <%=board.getBoard_content() %></td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td><a href="fileDown.jsp?board_filename=<%=board.getBoard_filename()%>">
		<%=board.getBoard_filename() %></a></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<a href="./BoardModifyForm?board_num=<%=board.getBoard_num()%>"><input type="button" value="수정"></a>
		<a href="./BoardDelete?board_num=<%=board.getBoard_num()%>"><input type="button" value="삭제"></a>
		</td>
	</tr>
</table>
</body>
</html>