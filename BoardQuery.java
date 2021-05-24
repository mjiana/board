package board;

import java.sql.*;
import java.util.*;
import mydb.poolfact.*;

public class BoardQuery {
	String board = "board2"; //table name
	String idxNum = "board2_idx_seq.nextval"; //sequence
	ConnectionPool pool = null; 

	//��ü�� ������ �� ����
	public BoardQuery() {
		try {
			pool = ConnectionPool.getInstance();
		} catch (Exception e) {
			System.out.println("������� "+ e);
		}
	}//BoardQury() end

	//�۾��� DB����
	public void boardInsert(BoardBean bb) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		/* stmt�� ����� ���
		 * Statement stmt = null; String name = bb.getName(); String email =
		 * bb.getEmail(); String homepage = bb.getHomepage(); String title =
		 * bb.getTitle(); String content = bb.getContent(); String pwd = bb.getPwd();
		 */

		try {
			conn = pool.getConnection();
			//stmt = conn.createStatement();

			String sql = "insert into "+board+" values("+idxNum+",?,?,?,?,?,?,sysdate,0)"; 
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, bb.getName()); 
			pstmt.setString(2, bb.getEmail()); 
			pstmt.setString(3, bb.getHomepage()); 
			pstmt.setString(4, bb.getTitle()); 
			pstmt.setString(5, bb.getContent()); 
			pstmt.setString(6, bb.getPwd()); 
			//sql = new String(sql.getBytes("8859_1"),"euc-kr"); //�ѱ� ���ڵ�
			
			//������ õ�� �Է��ϱ�, �ѹ� ���� �� �ּ�ó��
			//for(int i=0; i<1000; i++) { pstmt.executeUpdate(); }
			
			//pstmt.executeUpdate();

			/* stmt�� ����� ���
			 * sql = "insert into "+board+" values("
			 * +idxNum+", '"+name+"', '"+email+"', '"+homepage+"',"
			 * +" '"+title+"', '"+content+"', '"+pwd+"', sysdate, 0)";
			 * stmt.executeUpdate(sql);
			 */
		} catch (Exception e) {
			System.out.println("boardInsert Exception : "+e);
		} finally {
			if(pstmt != null) pstmt.close();
			//if(stmt != null) stmt.close();
			pool.releseConnection(conn);
		}
	} //boardInsert(BoardBean bb) end
	
	//�Խñ��� �Ѱ��� ���ϱ�
	public int boardCount() throws SQLException{
		int cnt = 0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			conn = pool.getConnection();
			stmt = conn.createStatement();
			sql = "select count(*) from "+board;
			rs = stmt.executeQuery(sql);
			rs.next();
			cnt = rs.getInt(1); //�÷����� count�Լ��̹Ƿ� ���ڷ� �÷� �޾ƿ���
			
		} catch (Exception e) {
			System.out.println("boardCount Exception : "+e);
		} finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			pool.releseConnection(conn);
		}
		return cnt;
	} //boardCount() end
	
	//�Խ��� ��� ��������
	public Vector getBoardList(int offset, int limit) throws SQLException{
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector boardList = new Vector();
		try {
			conn = pool.getConnection();
			stmt = conn.createStatement();
			sql = "select a.* from ( select ROWNUM as RN, b.* from "
						+"(select * from "+board+" order by idx desc)b"
					+")a where a.RN > "+offset+" and a.RN <= "+(offset+limit);
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setIdx(rs.getInt("idx"));
				bb.setHit(rs.getInt("hit"));
				bb.setName(rs.getString("name"));
				bb.setEmail(rs.getString("email"));
				bb.setHomepage(rs.getString("homepage"));
				bb.setTitle(rs.getString("title"));
				bb.setWdate(rs.getString("wdate").substring(0,10));
				boardList.add(bb);
			}//while
		} catch (Exception e) {
			System.out.println("getBoardList Exception : "+e);
		} finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			pool.releseConnection(conn);
		}
		return boardList;
	}//getBoardList(int offset, int limit) end

}// class end
