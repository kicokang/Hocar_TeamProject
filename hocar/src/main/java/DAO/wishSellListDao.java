package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;

import DTO.usedCarVo;
import DTO.wishBuyListVo;
import DTO.wishSellListVo;

public class wishSellListDao {
	private ArrayList<wishSellListVo> dtos;
	private Connection con;
	private Statement st;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private ArrayList<wishSellListVo> arrayListSellBuyCar = new ArrayList<wishSellListVo>();
	DecimalFormat DRIVEN = new DecimalFormat("###,###");

	public wishSellListDao() {
		dtos = new ArrayList<wishSellListVo>();
		try {
			String user = "system";
			String pw = "1234";
			String url = "jdbc:oracle:thin:@localhost:1521:XE";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, pw);
			st = con.createStatement();
		} catch (Exception e) {
			System.out.println("�����ͺ��̽� ���� ����:" + e.getMessage());
		}
	}

	public ArrayList<wishSellListVo> wishSellList() {
		String SQL = "SELECT * FROM wishSellList";
		try {
			rs = st.executeQuery(SQL);
			while (rs.next()) {
				String car_Number = rs.getString("car_Number");
				String car_name = rs.getString("car_name");
				Double made_year = rs.getDouble("made_year");
				int dis_driven = rs.getInt("dis_driven");
				String wishSellUser_name = rs.getString("wishSellUser_name");
				String phone_Num = rs.getString("phone_Num");
				wishSellListVo gwVO = new wishSellListVo(car_Number,car_name,made_year,dis_driven,wishSellUser_name, phone_Num);
				arrayListSellBuyCar.add(gwVO);
				System.out.printf("����ȣ : %s / ", car_Number);
				System.out.printf("������ : %s / ", car_name);
				System.out.printf("���� : %.0f�⵵ / ", made_year);
				System.out.printf("����Ÿ� : " + DRIVEN.format(dis_driven) + "km ");
				System.out.printf("�Ǹ��� �̸� : %s / ", wishSellUser_name);
				System.out.printf("�޴��� ��ȣ : %s /\n", phone_Num);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arrayListSellBuyCar;
	}
	public void deleteSellList(String car_name) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String SQL = "delete from wishSellList where car_name=?";

		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, car_name);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
