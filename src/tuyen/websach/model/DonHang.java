package tuyen.websach.model;

public class DonHang {
private int maDonHang;
private int maKH;
public DonHang(int maDonHang, int maKH) {
	super();
	this.maDonHang = maDonHang;
	this.maKH = maKH;
}
public DonHang() {
	
}
public int getMaDonHang() {
	return maDonHang;
}
public void setMaDonHang(int maDonHang) {
	this.maDonHang = maDonHang;
}
public int getMaKH() {
	return maKH;
}
public void setMaKH(int maKH) {
	this.maKH = maKH;
}

}
