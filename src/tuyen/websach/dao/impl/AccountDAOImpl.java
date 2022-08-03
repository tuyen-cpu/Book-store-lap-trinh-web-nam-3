package tuyen.websach.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tuyen.websach.connect.DBConnect;
import tuyen.websach.dao.AccountDAO;
import tuyen.websach.model.Account;
import tuyen.websach.model.KhachHang;


public class AccountDAOImpl implements AccountDAO{

	@Override
	public boolean insert(Account ac) {
		String sql = "INSERT INTO Account(UserName,MatKhau,Quyen,TrangThai) VALUES (?,?,?,?)";
		Connection conn=null;
		try {
			conn = DBConnect.getConnection();

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ac.getUserName());
			ps.setString(2, ac.getMatKhau());
			ps.setInt(3, ac.getQuyen());
			ps.setBoolean(4, ac.isTrangThai());
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
	public void edit(Account ac) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int userName) {
String sql = "DELETE FROM Account where UserName = ?";
		
		Connection con = null;

		try {
			con = DBConnect.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userName);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public boolean kiemTraUserName(String userName) {
		String sql = "SELECT * FROM Account WHERE UserName = ? ";
		Connection conn = null;

		try {
			conn= DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,userName);
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

	@Override
	public boolean kiemTraMatKhau(String userName, String pass) {
		String sql = "SELECT * FROM Account WHERE UserName = ? AND MatKhau= ? ";
		Connection conn = null;

		try {
			conn= DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,userName);
			ps.setString(2,pass);
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

	@Override
	public Account getAccount(String userName) {
		String sql = "SELECT * FROM Account WHERE UserName = ? ";
		Connection conn = null;

		try {
			conn= DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, userName);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Account ac = new Account();
				ac.setUserName(rs.getString("UserName"));
				ac.setMatKhau(rs.getString("MatKhau"));
				ac.setQuyen(rs.getInt("Quyen"));
				ac.setTrangThai(rs.getBoolean("TrangThai"));
				return ac;
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
	public List<Account> getAll() {
		List<Account> dsKH = new ArrayList<Account>();
		String sql = "SELECT * FROM Account";
		Connection connect = null;
		try {
			connect = DBConnect.getConnection();
			PreparedStatement ps = connect.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Account ac = new Account();
				ac.setUserName(rs.getString("UserName"));
				ac.setMatKhau(rs.getString("MatKhau"));
				ac.setQuyen(rs.getInt("Quyen"));
				ac.setTrangThai(rs.getBoolean("TrangThai"));
				dsKH.add(ac);
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
	public boolean doiMatKhau(String userName, String matKhau) {
		String sql = "Update Account SET MatKhau= ? where UserName= ? ";
		Connection conn = null;

		try {
			conn= DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,matKhau);
			ps.setString(2, userName);
			ps.executeUpdate();
			ps.close();
			return true;
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
