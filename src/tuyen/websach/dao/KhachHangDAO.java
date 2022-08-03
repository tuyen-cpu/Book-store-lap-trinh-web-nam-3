package tuyen.websach.dao;

import java.util.List;

import tuyen.websach.model.KhachHang;



public interface KhachHangDAO {
	boolean insert(KhachHang kh);

	void edit(KhachHang kh);

	void delete(int id);

	
	boolean kiemTraEmail(String email);
	KhachHang getKhachHang(int maKH);
	KhachHang getKhachHang(String email);
	List<KhachHang> getAll();

	KhachHang search(String username);
	
	
	

}
