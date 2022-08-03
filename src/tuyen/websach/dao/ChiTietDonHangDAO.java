package tuyen.websach.dao;

import java.util.List;

import tuyen.websach.model.ChiTietDonHang;

public interface ChiTietDonHangDAO {
	void insert(ChiTietDonHang ctdh);

	void edit(ChiTietDonHang ctdh);

	void delete(int id);

	ChiTietDonHang getCTDH(int maDonHang);

	List<ChiTietDonHang> getSachDanhMuc(int maDonHang);

	List<ChiTietDonHang> getAll();

}
