package tuyen.websach.model;

public class Account {
private String userName;
private String matKhau;
private int quyen;
private boolean trangThai;
public Account(String userName, String matKhau, int quyen, boolean trangThai) {
	super();
	this.userName = userName;
	this.matKhau = matKhau;
	this.quyen = quyen;
	this.trangThai = trangThai;
}
public Account() {}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getMatKhau() {
	return matKhau;
}
public void setMatKhau(String matKhau) {
	this.matKhau = matKhau;
}
public int getQuyen() {
	return quyen;
}
public void setQuyen(int quyen) {
	this.quyen = quyen;
}
public boolean isTrangThai() {
	return trangThai;
}
public void setTrangThai(boolean trangThai) {
	this.trangThai = trangThai;
}


}
