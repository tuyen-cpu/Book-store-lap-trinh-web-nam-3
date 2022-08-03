package tuyen.websach.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GioHang {
private Map<String, Item> danhSachSanPham=null;

public GioHang() {
	super();
	danhSachSanPham = new HashMap<String, Item>();
}
public void themSanPham(String maSach,Sach sach) {
	if(danhSachSanPham.containsKey(maSach)) {
		Item item= danhSachSanPham.get(maSach);
		item.tangSoLuong();
		System.out.println(sach.getTenSach()+ "đã thêm 1");
	}else {
		Item item= new Item(sach);
		danhSachSanPham.put(maSach, item);
		System.out.println("Đã thêm "+sach.getTenSach()+ " vào giỏ");
	}
}
public void xoaSanPham(String maSach) {
	if(danhSachSanPham.containsKey(maSach)) {
		Item item=danhSachSanPham.get(maSach);
		item.setSoLuong(0);
		danhSachSanPham.remove(maSach);
		System.out.println("Đã xóa "+item.getSach().getTenSach());
		
	}
}
public List<Item> getGioHang(){
	List<Item> danhSachSach= new ArrayList<Item>();
	danhSachSach.addAll(danhSachSanPham.values());
	return danhSachSach;
}
public int getSize() {
	return getGioHang().size();
}
public double getTongGia() {
	double result=0;
	for(Item item:getGioHang()) {
		Sach sach= item.getSach();
		result+=item.getSoLuong()* sach.getGiaBan();
	}
	return result;
}
}
