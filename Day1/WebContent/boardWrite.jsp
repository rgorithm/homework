<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>


<%	
	String board_title = "";
	String board_content = "";
	String filename = "";
	String origfilename = "";
	String uploadPath = request.getRealPath("/upload");
	int size = 10*1024*1024;
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();
	String file = (String)files.nextElement();
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQLDB");
		con = ds.getConnection();
		String sql = "insert into board(board_title,board_content,board_writer,board_filename) values(?,?,?,?)";
		board_title = multi.getParameter("board_title");
		board_content = multi.getParameter("board_content");
		filename = multi.getFilesystemName(file);
		origfilename = multi.getOriginalFileName(file);
		System.out.println(filename);
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1 ,board_title);
		pstmt.setString(2 , board_content);
		pstmt.setString(3 , "아이디");
		pstmt.setString(4,filename);
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