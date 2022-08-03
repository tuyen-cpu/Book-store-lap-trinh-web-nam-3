package tuyen.websach.dao;

import java.util.List;

import tuyen.websach.model.DanhMuc;

public interface DanhMucDAO {
	boolean insert(DanhMuc danhMuc);

	void edit(DanhMuc danhMuc);

	void delete(int id);

	String getTenChuDe(String maDanhMuc);

	boolean checkDanhMuc(String maDanhMuc);

	List<DanhMuc> getDanhMuc();

}
