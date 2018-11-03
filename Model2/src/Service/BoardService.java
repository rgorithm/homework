package Service;

import java.util.ArrayList;
import java.sql.*;
import static db.JdbcUtil.*;

import DAO.BoardDAO;
import vo.BoardBean;

public class BoardService {
	//글목록
	public ArrayList<BoardBean> BoardList(){
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		ArrayList<BoardBean> boardList = null;
		boardList = boardDAO.BoardList();
		close(con);
		return boardList;
	}
	//글쓰기
	public int BoardWrite(BoardBean board) {
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int insertCount = 0;
		
		insertCount = boardDAO.BoardWrite(board);
		if(insertCount>0) {
			System.out.println("글쓰기성공");
			commit(con);
		}else {
			System.out.println("글쓰기실패");
			rollback(con);
		}
		close(con);
		return insertCount;
	}
	//글상세보기
	public BoardBean BoardDetail(int board_num) {
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		BoardBean board = new BoardBean();
		board = boardDAO.BoardDetail(board_num);
		close(con);
		return board;
	}
	//글삭제
	public int BoardDelete(int board_num) {
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int deleteCount = 0;
		
		deleteCount = boardDAO.BoardDelete(board_num);
		if(deleteCount>0) {
			commit(con);
			System.out.println("삭제성공");
		}else {
			rollback(con);
			System.out.println("삭제실패");
		}
		close(con);
		return deleteCount;
	}
	//글수정
	public int BoardModify(int board_num) {
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int updateCount = 0;
		return updateCount;
	}
}
