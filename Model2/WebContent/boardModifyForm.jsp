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
<table height="300" width="500" align="center" border="1">
	<tr>
		<td>글제목</td><td><input type="text" name="board_title" value=<%=board.getBoard_title()%>></td>
	</tr>
	<tr>
		<td>글내용</td><td><textArea name="board_content"><%=board.getBoard_content()%></textArea></td>
		
	</tr>
	<tr>
		<td>첨부파일</td><td><%=board.getBoard_filename()%></td>
		<input type="hidden" name="existing_file" value="<%=board.getBoard_filename()%>">
	</tr>
	<tr>
		<td>첨부파일수정</td><td><input type="file" name="updatefilename"></td>
	</tr>
	<tr>
		<input type="hidden" name="board_num" value="<%=board.getBoard_num()%>">
		<td colspan="3" align="center"><input type="submit" value="수정"></a></td>
	</tr>
</table>
</body>
</html>