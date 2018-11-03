package Service;

import static db.JdbcUtil.*;
import java.sql.*;
import java.util.ArrayList;

import vo.BoardBean;
import DAO.BoardDAO;

public class BoardListService {
	public ArrayList<BoardBean> BoardList(){
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();
		boardList = boardDAO.BoardList();
		close(con);
		return boardList;
	}
}
