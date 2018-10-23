<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String user_id = (String)session.getAttribute("user_id");
    	Cookie[] cookie = request.getCookies();
    	String cookie_id = "";
    	if(cookie != null){
    		for(int i=0; i<cookie.length; i++){
    			if(cookie[i].getName().trim().equals("cookie_id")){
    				cookie_id = cookie[i].getValue();
    			}
    		}
    	}
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="login.jsp" method="post">
<table align="center">
	<%if(user_id == null){%>
	<tr>
		<td>ID : <input type="text" name="user_id" value="<%=cookie_id %>"></td>
		<td>PASS : <input type="text" name="user_passwd"></td>
		<td><input type="submit" value="로그인"></td>
	</tr>
	<tr>
		<td align="right" colspan="3">아이디저장<input type="checkbox" name="cookie_id"></td>
	</tr>
	<%}else{%>
	<tr>
		<td><%= user_id %>로 로그인됨 <a href="logout.jsp"><input type="button" value="로그아웃"></a></td>
	</tr>
	<%}%>
</table>
</form>
</body>
</html>