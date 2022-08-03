package tuyen.websach.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tuyen.websach.connect.DBConnect;
import tuyen.websach.dao.DanhMucDAO;
import tuyen.websach.model.DanhMuc;

public class DanhMucDAOImpl implements DanhMucDAO {

	@Override
	public boolean insert(DanhMuc danhMuc) {
		String sql = "INSERT INTO ChuDe(MaChuDe,TenChuDe) VALUES (?,?)";
		Connection conn = null;
		try {
			conn = DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, danhMuc.getMaChuDe());
			ps.setString(2, danhMuc.getTenChuDe());
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;


	}

	@Override
	public void edit(DanhMuc danhMuc) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<DanhMuc> getDanhMuc() {
		List<DanhMuc> danhSachDanhMuc = new ArrayList<DanhMuc>();
		String sql = "SELECT * FROM ChuDe";
		Connection connect = null;
		try {
			connect = DBConnect.getConnection();
			PreparedStatement ps = connect.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				DanhMuc danhMuc = new DanhMuc();
				danhMuc.setMaChuDe(rs.getString("MaChuDe"));
				danhMuc.setTenChuDe(rs.getString("TenChuDe"));
				danhSachDanhMuc.add(danhMuc);
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				connect.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return danhSachDanhMuc;
	}
	/*
	 * public static void main(String[] args) { DanhMucDAOImpl dao = new
	 * DanhMucDAOImpl(); for(DanhMuc d:dao.getDanhMuc()) {
	 * System.out.println(d.getMaChuDe()+"_"+d.getTenChuDe()); } }
	 */

	@Override
	public String getTenChuDe(String maDanhMuc) {
		String tenChuDe = null;
		String sql = "SELECT * FROM ChuDe WHERE MaChuDe=?";
		Connection conn = null;

		try {
			conn = DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, maDanhMuc);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				tenChuDe=rs.getString("TenChuDe");
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return tenChuDe;
	}

	@Override
	public boolean checkDanhMuc(String maDanhMuc) {
		String sql = "SELECT * FROM ChuDe where MaChuDe= ?";
		Connection connect = null;
		try {
			connect = DBConnect.getConnection();
			PreparedStatement ps = connect.prepareStatement(sql);
			ps.setString(1, maDanhMuc);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return true;
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				connect.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return false;
	}
}
