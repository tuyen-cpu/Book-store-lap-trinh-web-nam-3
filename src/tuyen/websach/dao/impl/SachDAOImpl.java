package tuyen.websach.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tuyen.websach.connect.DBConnect;
import tuyen.websach.dao.SachDAO;
import tuyen.websach.model.Sach;

public class SachDAOImpl extends DBConnect implements SachDAO {

	@Override
	public boolean insert(Sach sach) {
		String sql = "INSERT INTO Sach(TenSach,GiaBan,Mota,Anh ,SoLuong,MaChuDe,GiamGia,TrangThai) VALUES (?,?,?,?,?,?,?,?)";
		Connection conn = null;
		try {
			conn = DBConnect.getConnection();

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, sach.getTenSach());
			ps.setFloat(2, sach.getGiaBan());
			ps.setString(3, sach.getMota());
			ps.setString(4, sach.getAnh());
			ps.setInt(5, sach.getSoLuong());
//			ps.setString(6, sach.getMaNXB());
			ps.setString(6, sach.getMaChuDe());
			ps.setFloat(7, sach.getGiamGia());
			ps.setBoolean(8, true);
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
	public void edit(Sach sach) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public int countSachDanhMuc(String maDanhMuc) {
		String sql = "SELECT count(*)FROM Sach WHERE MaChuDe=?";
		Connection conn = null;

		try {
			conn = DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, maDanhMuc);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				return rs.getInt(1);
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
		return 0;
	}

	@Override
	public List<Sach> getAllSach() {
		List<Sach> listSach = new ArrayList<Sach>();
		String sql = "SELECT * FROM Sach";
		Connection conn = null;

		try {
			conn = DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Sach sach = new Sach();

				sach.setMaSach(rs.getInt("MaSach"));
				sach.setTenSach(rs.getString("TenSach"));
				sach.setGiaBan(rs.getFloat("GiaBan"));
				sach.setMota(rs.getString("Mota"));
				sach.setAnh(rs.getString("Anh"));
				sach.setSoLuong(rs.getInt("SoLuong"));
//				sach.setMaNXB(rs.getString("MaNXB"));
				sach.setMaChuDe(rs.getString("MaChuDe"));
				sach.setGiamGia(rs.getFloat("GiamGia"));
				sach.setTrangThai(rs.getBoolean("TrangThai"));
				listSach.add(sach);
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
		return listSach;
	}
	/*
	 * public static void main(String[] args) { SachDAOImpl ss = new SachDAOImpl();
	 * for(Sach s:ss.getSachDanhMuc("cdVH")) { System.out.println(s.getTenSach()); }
	 * }
	 */

	@Override
	public Sach getSach(int id) {

		String sql = "SELECT * FROM Sach WHERE MaSach=?";
		Connection conn = null;

		try {
			conn = DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Sach sach = new Sach();

				sach.setMaSach(rs.getInt("MaSach"));
				sach.setTenSach(rs.getString("TenSach"));
				sach.setGiaBan(rs.getFloat("GiaBan"));
				sach.setMota(rs.getString("Mota"));
				sach.setAnh(rs.getString("Anh"));
				sach.setSoLuong(rs.getInt("SoLuong"));
//				sach.setMaNXB(rs.getString("MaNXB"));
				sach.setMaChuDe(rs.getString("MaChuDe"));
				sach.setGiamGia(rs.getFloat("GiamGia"));
				sach.setTrangThai(rs.getBoolean("TrangThai"));
				return sach;
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
		return null;

	}

	@Override
	public int getTrangCoDanhMuc(String danhMuc,String txtSearch) {

		String sql = "SELECT count(*) FROM Sach where MaChuDe= ? and TenSach like ?";
		Connection conn = null;

		try {
			conn = DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, danhMuc);
			ps.setString(2, "%" + txtSearch + "%");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
			
				return rs.getInt(1);
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
		return 0;
	}

	@Override
	public List<Sach> getSearch(String txtSearch,String maChuDe, int index, int size) {
		List<Sach> listSach = new ArrayList<Sach>();
		String sql = "with x as (select ROW_NUMBER() over(order by MaSach desc) as r,* from Sach where TenSach like ? and MaChuDe like ?)\r\n"
				+ "Select * from x where r between ?*(?-1)+1 and (?*(?-1)+1)+(?-1)";
		Connection conn = null;

		try {
			conn = DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+txtSearch+"%");
			ps.setString(2, "%"+maChuDe+"%");
			ps.setInt(3, size);
			ps.setInt(4, index);
			ps.setInt(5, size);
			ps.setInt(6, index);
			ps.setInt(7, size);
			
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Sach sach = new Sach();
				sach.setMaSach(rs.getInt("MaSach"));
				sach.setTenSach(rs.getString("TenSach"));
				sach.setGiaBan(rs.getFloat("GiaBan"));
				sach.setMota(rs.getString("Mota"));
				sach.setAnh(rs.getString("Anh"));
				sach.setSoLuong(rs.getInt("SoLuong"));
//				sach.setMaNXB(rs.getString("MaNXB"));
				sach.setMaChuDe(rs.getString("MaChuDe"));
				sach.setGiamGia(rs.getFloat("GiamGia"));
				sach.setTrangThai(rs.getBoolean("TrangThai"));
				listSach.add(sach);
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
		return listSach;
	}

	@Override
	public int getTrangKhongDanhMuc(String txtSearch) {
		String sql = "SELECT count(*) FROM Sach where TenSach like ?";
		Connection conn = null;

		try {
			conn = DBConnect.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
		
			ps.setString(1, "%" + txtSearch + "%");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
			
				return rs.getInt(1);
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
		return 0;
	}
public static void main(String[] args) {
	SachDAOImpl dd= new SachDAOImpl();
	System.out.println(dd.getTrangKhongDanhMuc("code"));
}

@Override
public List<Sach> getSearch(String txtSearch, int index, int size) {
	List<Sach> listSach = new ArrayList<Sach>();
	String sql = "with x as (select ROW_NUMBER() over(order by MaSach desc) as r,* from Sach where TenSach like ?)\r\n"
			+ "Select * from x where r between ?*(?-1)+1 and (?*(?-1)+1)+(?-1)";
	Connection conn = null;

	try {
		conn = DBConnect.getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, "%"+txtSearch+"%");
		ps.setInt(2, size);
		ps.setInt(3, index);
		ps.setInt(4, size);
		ps.setInt(5, index);
		ps.setInt(6, size);
		
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			Sach sach = new Sach();
			sach.setMaSach(rs.getInt("MaSach"));
			sach.setTenSach(rs.getString("TenSach"));
			sach.setGiaBan(rs.getFloat("GiaBan"));
			sach.setMota(rs.getString("Mota"));
			sach.setAnh(rs.getString("Anh"));
			sach.setSoLuong(rs.getInt("SoLuong"));
//			sach.setMaNXB(rs.getString("MaNXB"));
			sach.setMaChuDe(rs.getString("MaChuDe"));
			sach.setGiamGia(rs.getFloat("GiamGia"));
			sach.setTrangThai(rs.getBoolean("TrangThai"));
			listSach.add(sach);
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
	return listSach;
}

@Override
public List<Sach> getSachChuDe(String maChuDe, int index, int size) {
	List<Sach> listSach = new ArrayList<Sach>();
	String sql = "with x as (select ROW_NUMBER() over(order by MaSach desc) as r,* from Sach where  MaChuDe like ?)\r\n"
			+ "Select * from x where r between ?*(?-1)+1 and (?*(?-1)+1)+(?-1)";
	Connection conn = null;

	try {
		conn = DBConnect.getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, maChuDe);
		ps.setInt(2, size);
		ps.setInt(3, index);
		ps.setInt(4, size);
		ps.setInt(5, index);
		ps.setInt(6, size);
		
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			Sach sach = new Sach();
			sach.setMaSach(rs.getInt("MaSach"));
			sach.setTenSach(rs.getString("TenSach"));
			sach.setGiaBan(rs.getFloat("GiaBan"));
			sach.setMota(rs.getString("Mota"));
			sach.setAnh(rs.getString("Anh"));
			sach.setSoLuong(rs.getInt("SoLuong"));
//			sach.setMaNXB(rs.getString("MaNXB"));
			sach.setMaChuDe(rs.getString("MaChuDe"));
			sach.setGiamGia(rs.getFloat("GiamGia"));
			sach.setTrangThai(rs.getBoolean("TrangThai"));
			listSach.add(sach);
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
	return listSach;
}

@Override
public List<Sach> getBanChay() {
	List<Sach> listSach = new ArrayList<Sach>();
	String sql = "with BanChay as (select MaSach ,count(*) as SL from ChiTietDonHang\r\n"
			+ "group by MaSach) \r\n"
			+ "select top 5 s.MaSach,s.TenSach,s.GiaBan,s.Anh,s.Mota,s.NgayCapNhat,s.SoLuong,s.MaNXB,s.MaChuDe,s.GiamGia,s.TrangThai from BanChay b join Sach s on s.MaSach=b.MaSach\r\n"
			+ "order by SL desc";
	Connection conn = null;

	try {
		conn = DBConnect.getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			Sach sach = new Sach();

			sach.setMaSach(rs.getInt("MaSach"));
			sach.setTenSach(rs.getString("TenSach"));
			sach.setGiaBan(rs.getFloat("GiaBan"));
			sach.setMota(rs.getString("Mota"));
			sach.setAnh(rs.getString("Anh"));
			sach.setSoLuong(rs.getInt("SoLuong"));
//			sach.setMaNXB(rs.getString("MaNXB"));
			sach.setMaChuDe(rs.getString("MaChuDe"));
			sach.setGiamGia(rs.getFloat("GiamGia"));
			sach.setTrangThai(rs.getBoolean("TrangThai"));
			listSach.add(sach);
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
	return listSach;
}
}
