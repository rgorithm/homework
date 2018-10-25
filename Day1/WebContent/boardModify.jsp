<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>

    <%
    int board_num = 0;
    String board_title = "";
	String board_content = "";
	String existing_file = "";
	String update_file = "";
	String uploadPath = request.getRealPath("/upload");
	int size = 10*1024*1024;
    
    Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();
	String file = (String)files.nextElement();
	update_file = multi.getFilesystemName(file);
		if(update_file == null){
			existing_file = multi.getParameter("existing_file");
			update_file = existing_file;
		}
		
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MySQLDB");
		con = ds.getConnection();
		String sql = "update board set board_title=?, board_content=? ,board_filename=? where board_num = ?";
		pstmt = con.prepareStatement(sql);
		board_title = multi.getParameter("board_title");
		board_content = multi.getParameter("board_content");
		board_num = Integer.parseInt(multi.getParameter("board_num"));
		System.out.println("기존파일:"+existing_file);
		pstmt.setString(1,board_title);
		pstmt.setString(2,board_content);
		pstmt.setString(3,update_file);
		pstmt.setInt(4,board_num);
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