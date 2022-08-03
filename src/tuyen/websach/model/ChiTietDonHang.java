package tuyen.websach.model;

public class ChiTietDonHang {
private int maDonHang;
private int maSach;
private int soLuong;
private float donGia;
public ChiTietDonHang(int maDonHang, int maSach, int soLuong, float donGia) {
	super();
	this.maDonHang = maDonHang;
	this.maSach = maSach;
	this.soLuong = soLuong;
	this.donGia = donGia;
}
public ChiTietDonHang() {}
public int getMaDonHang() {
	return maDonHang;
}
public void setMaDonHang(int maDonHang) {
	this.maDonHang = maDonHang;
}
public int getMaSach() {
	return maSach;
}
public void setMaSach(int maSach) {
	this.maSach = maSach;
}
public int getSoLuong() {
	return soLuong;
}
public void setSoLuong(int soLuong) {
	this.soLuong = soLuong;
}
public float getDonGia() {
	return donGia;
}
public void setDonGia(float donGia) {
	this.donGia = donGia;
}


}
