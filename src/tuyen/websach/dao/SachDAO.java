package tuyen.websach.dao;

import java.util.List;

import tuyen.websach.model.Sach;

public interface SachDAO {
	boolean insert(Sach sach);

	void edit(Sach sach);

	void delete(int id);

	Sach getSach(int id);

	int countSachDanhMuc(String maDanhMuc);

	List<Sach> getAllSach();

	int getTrangCoDanhMuc(String danhMuc, String txtSearch);

	int getTrangKhongDanhMuc(String txtSearch);

	List<Sach> getSearch(String txtSearch, String maChuDe, int index, int size);

	List<Sach> getSachChuDe( String maChuDe, int index, int size);

	List<Sach> getSearch(String txtSearch, int index, int size);
	List<Sach> getBanChay();
}
