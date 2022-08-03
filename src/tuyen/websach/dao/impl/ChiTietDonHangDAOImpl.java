package tuyen.websach.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tuyen.websach.connect.DBConnect;
import tuyen.websach.dao.ChiTietDonHangDAO;
import tuyen.websach.model.ChiTietDonHang;
import tuyen.websach.model.DonHang;

public class ChiTietDonHangDAOImpl implements ChiTietDonHangDAO {

	@Override
	public void insert(ChiTietDonHang ctdh) {
		String sql = "INSERT INTO ChiTietDonHang(MaDonHang,MaSach,SoLuong,DonGia) VALUES (?,?,?,?)";
		Connection conn = null;

		try {
			conn = DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, ctdh.getMaDonHang());
			ps.setInt(2, ctdh.getMaSach());
			ps.setInt(3, ctdh.getSoLuong());
			ps.setFloat(4, ctdh.getDonGia());
			ps.executeUpdate();
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

	}

	@Override
	public void edit(ChiTietDonHang ctdh) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public ChiTietDonHang getCTDH(int maDonHang) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChiTietDonHang> getSachDanhMuc(int maDonHang) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChiTietDonHang> getAll() {
		List<ChiTietDonHang> listCTDH = new ArrayList<ChiTietDonHang>();
		String sql = "SELECT * FROM ChiTietDonHang";
		Connection conn = null;

		try {
			conn = DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ChiTietDonHang ctdh = new ChiTietDonHang();
				ctdh.setMaDonHang(rs.getInt("MaDonHang"));
				ctdh.setMaSach(rs.getInt("MaSach"));
				ctdh.setSoLuong(rs.getInt("SoLuong"));
				ctdh.setDonGia(rs.getFloat("DonGia"));
				listCTDH.add(ctdh);
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
		return listCTDH;
	}

}
