package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.util.JDBCUtil;
import model.vo.MemberVO;

public class MemberDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	final String sql_insert="INSERT INTO MEMBER (NAME,SCORE) VALUES(?,?)";
	final String sql_selectAll="SELECT * FROM MEMBER";
	final String sql_delete = "DELETE FROM MEMBER WHERE MPK=?";
	final String sql_update = "UPDATE MEMBER SET SCORE=? WHERE MPK=?";
	final String sql_selectOne = "SELECT * FROM MEMBER WHERE MPK=?";
	
	public MemberVO selectOne(MemberVO vo) {
		
		try {
			conn = JDBCUtil.connect();
			MemberVO data = new MemberVO();
			
			pstmt=conn.prepareStatement(sql_selectOne);
			pstmt.setInt(1, vo.getMpk());
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				data.setMpk(rs.getInt("MPK"));
				data.setName(rs.getString("NAME"));
				data.setScore(rs.getInt("SCORE"));
			}
			
			rs.close();
			JDBCUtil.disconnect(pstmt, conn);
			
			return data;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	public boolean update(MemberVO vo) {
		try {
			conn = JDBCUtil.connect();
			
			pstmt=conn.prepareStatement(sql_update);
			pstmt.setInt(1, vo.getScore());
			pstmt.setInt(2, vo.getMpk());
			pstmt.executeUpdate();
			
			JDBCUtil.disconnect(pstmt, conn);
			
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean delete(MemberVO vo) {
		try {
			conn = JDBCUtil.connect();
			
			pstmt=conn.prepareStatement(sql_delete);
			pstmt.setInt(1, vo.getMpk());
			pstmt.executeUpdate();
			
			JDBCUtil.disconnect(pstmt, conn);
			
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean insert(MemberVO vo) { // 추가하기
		try {
			conn = JDBCUtil.connect();
			
			pstmt=conn.prepareStatement(sql_insert);
			pstmt.setString(1,vo.getName());
			pstmt.setInt(2, vo.getScore());
			pstmt.executeUpdate();
			
			JDBCUtil.disconnect(pstmt, conn);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public ArrayList<MemberVO> selectAll(MemberVO vo){
		ArrayList<MemberVO> datas = new ArrayList<MemberVO>();
		try{
			conn = JDBCUtil.connect();
			pstmt = conn.prepareStatement(sql_selectAll);
			ResultSet rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MemberVO mvo = new MemberVO();
				mvo.setMpk(rs.getInt("MPK"));
				mvo.setName(rs.getString("NAME"));
				mvo.setScore(rs.getInt("SCORE"));
				datas.add(mvo);
			}
			
			rs.close();
			JDBCUtil.disconnect(pstmt, conn);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return datas;
	}
}
