package FrontController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Service.BoardListService;
import Service.BoardService;
import vo.BoardBean;

@WebServlet("/BoardWrite")
public class BoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String board_title = "";
		String board_content = "";
		String board_writer = "";
		String filename = "";
		String origfilename = "";
		String uploadPath = request.getRealPath("/upload");
		int size = 10*1024*1024;
		
		MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
		board_title = multi.getParameter("board_title");
		board_content = multi.getParameter("board_content");
		board_writer = multi.getParameter("board_writer");
		//파일에대한정보를 Enumeration+타입으로 files에담기
		Enumeration files = multi.getFileNames();
		//files에 요소들이 있는동안 와일문실행
		while(files.hasMoreElements()){
		//files에담긴 다음요소를 file에담기
		String file = (String)files.nextElement();
		filename = multi.getFilesystemName(file);
		origfilename = multi.getOriginalFileName(file);
		}
		BoardBean board = new BoardBean();
		board.setBoard_title(multi.getParameter("board_title"));
		board.setBoard_content(multi.getParameter("board_content"));
		board.setBoard_writer(multi.getParameter("board_writer"));
		board.setBoard_filename(filename);
		
		BoardService boardService = new BoardService();
		int insertCount = boardService.BoardWrite(board);
		if(insertCount>0) {
			System.out.println("글쓰기성공");
			response.sendRedirect("./BoardList");
		}else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기실패.')");
			script.println("history.back()");
			script.println("</script>");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("gg");
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("gg");
		doProcess(request, response);
	}

}
