package tuyen.websach.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;




import tuyen.websach.connect.DBConnect;
import tuyen.websach.dao.KhachHangDAO;
import tuyen.websach.model.Account;
import tuyen.websach.model.KhachHang;

public class KhachHangDAOImpl implements KhachHangDAO{

	@Override
	public boolean insert(KhachHang kh) {
		
		String sql = "INSERT INTO KhachHang(HoTen,UserName,Email) VALUES (?,?,?)";
		Connection conn=null;
		try {
			conn = DBConnect.getConnection();

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, kh.getHoTen());
			ps.setString(2, kh.getUserName());
			ps.setString(3, kh.getEmail());
			
			ps.executeUpdate();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
		
	}

	@Override
	public void edit(KhachHang kh) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int id) {
		String sql = "DELETE FROM KhachHang where MaKH = ?";
		
		Connection con = null;

		try {
			con = DBConnect.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

	@Override
	public KhachHang getKhachHang(int maKH) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<KhachHang> getAll() {
		List<KhachHang> dsKH = new ArrayList<KhachHang>();
		String sql = "SELECT * FROM KhachHang";
		Connection connect = null;
		try {
			connect = DBConnect.getConnection();
			PreparedStatement ps = connect.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				KhachHang kh = new KhachHang();
				kh.setMaKH(rs.getInt("MaKH"));
				kh.setHoTen(rs.getString("HoTen"));
				kh.setEmail(rs.getString("Email"));
				kh.setsDT(rs.getString("SDT"));
				kh.setDiaChi(rs.getString("DiaChi"));
				kh.setGioiTinh(rs.getString("GioiTinh"));
				kh.setUserName(rs.getString("UserName"));
				dsKH.add(kh);
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connect.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return dsKH;
	}

	@Override
	public KhachHang search(String username) {
		String sql = "SELECT * FROM KhachHang WHERE UserName = ? ";
		Connection conn = null;

		try {
			conn= DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				KhachHang kh = new KhachHang();
				kh.setMaKH(rs.getInt("MaKH"));
				kh.setHoTen(rs.getString("HoTen"));
				kh.setUserName(rs.getString("UserName"));
				kh.setEmail(rs.getString("Email"));
				kh.setsDT(rs.getString("SDT"));
				kh.setDiaChi(rs.getString("DiaChi"));
				kh.setGioiTinh(rs.getString("GioiTinh"));
				return kh;
			}
			rs.close();
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
		return null;
	}



	@Override
	public KhachHang getKhachHang(String email) {
		String sql = "SELECT * FROM KhachHang WHERE Email = ? ";
		Connection conn = null;

		try {
			conn= DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				KhachHang user = new KhachHang();
				user.setMaKH(rs.getInt("MaKH"));
				user.setEmail(rs.getString("Email"));
				user.setHoTen(rs.getString("HoTen"));
				user.setUserName(rs.getString("UserName"));
				return user;
			}
			rs.close();
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
		return null;
	}

	@Override
	public boolean kiemTraEmail(String email) {
		String sql = "SELECT * FROM Account WHERE KhachHang = ? ";
		Connection conn = null;

		try {
			conn= DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,email);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				return true;
			}
			rs.close();
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
		return false;
	}





}
