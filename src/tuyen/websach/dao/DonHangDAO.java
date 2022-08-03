package tuyen.websach.dao;

import java.util.List;

import tuyen.websach.model.DonHang;



public interface DonHangDAO {
	void insert(DonHang donHang);

	void edit(DonHang donHang);

	void delete(int id);
	int getMaDonHang();
	List<DonHang> getAll();
}
