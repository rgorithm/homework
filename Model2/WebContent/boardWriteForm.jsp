<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="./BoardWrite" method="post" enctype="multipart/form-data">
<table height="300" width="500" align="center" border="1">
	<tr>
		<td><input type="text" name="board_title" placeholder="글제목"></td>
	</tr>
	<tr>
		<td><textarea name="board_content" cols="20" rows="10" placeholder="글내용"></textarea></td>
	</tr>
	<tr>
		<td><input type="text" name="board_writer" placeholder="글쓴이"></td>
	</tr>
	<tr>
		<td>파일업로드: <input type="file" name="file"></td>
	</tr>
	<tr>
		<td align="center"><input type="submit" value="글쓰기"></td>
	</tr>
</table>
</form>
</body>
</html>