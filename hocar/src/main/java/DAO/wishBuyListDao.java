package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import DTO.usedCarVo;
import DTO.wishBuyListVo;

public class wishBuyListDao {
	private ArrayList<wishBuyListVo> dtos;
	private Connection con;
	private Statement st;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private ArrayList<wishBuyListVo> arrayListWishBuyCar = new ArrayList<wishBuyListVo>();
	
	public wishBuyListDao() {
		dtos = new ArrayList<wishBuyListVo>();
		try {
			String user = "system";
			String pw = "1234";
			String url = "jdbc:oracle:thin:@localhost:1521:XE";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, pw);
			st = con.createStatement();
		} catch (Exception e) {
			System.out.println("데이터베이스 연결 오류:" + e.getMessage());
		}
	}

	public ArrayList<wishBuyListVo> wishBuyList() {
		String SQL = "SELECT * FROM wishBuyList";
		try {
			rs = st.executeQuery(SQL);
			while (rs.next()) {

				String car_Number = rs.getString("car_Number");
				String wishBuyUser_name = rs.getString("wishBuyUser_name");
				String phone_Num = rs.getString("phone_Num");
				wishBuyListVo gwVO = new wishBuyListVo(car_Number,wishBuyUser_name, phone_Num);
				arrayListWishBuyCar.add(gwVO);
				System.out.printf("차번호 : %s /\n", car_Number);
				System.out.printf("구매자 이름 : %s / ", wishBuyUser_name);
				System.out.printf("휴대폰 번호 : %s / ", phone_Num);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arrayListWishBuyCar;
	}
	
	public void deleteBuyList(String car_name) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String SQL = "delete from wishBuyList where car_name=?";

		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, car_name);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
