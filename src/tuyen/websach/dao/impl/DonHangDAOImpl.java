package tuyen.websach.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tuyen.websach.connect.DBConnect;
import tuyen.websach.dao.DonHangDAO;
import tuyen.websach.model.DonHang;
import tuyen.websach.model.Sach;

public class DonHangDAOImpl implements DonHangDAO{

	@Override
	public void insert(DonHang donHang) {
		String sql = "INSERT INTO DonHang(MaKH) VALUES (?)";
		Connection conn = null;

		try {
			conn = DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, donHang.getMaKH());
			ps.executeUpdate();
			ps.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public void edit(DonHang donHang) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<DonHang> getAll() {
		List<DonHang> listDH = new ArrayList<DonHang>();
		String sql = "SELECT * FROM DonHang";
		Connection conn = null;

		try {
			conn = DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				DonHang dh = new DonHang();

				dh.setMaDonHang(rs.getInt("MaDonHang"));
				dh.setMaKH(rs.getInt("MaKH"));
				listDH.add(dh);
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listDH;
	}

	@Override
	public int getMaDonHang() {
		String sql = "SELECT TOP 1 * FROM DonHang ORDER BY MaDonHang DESC";
		Connection conn = null;
int result = 0;
		try {
			conn = DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
			

				result = rs.getInt("MaDonHang");
				
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}


}
