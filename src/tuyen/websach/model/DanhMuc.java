package tuyen.websach.model;

public class DanhMuc {
private String	MaChuDe ;
private String TenChuDe ;
public DanhMuc() {
}
public DanhMuc(String maChuDe, String tenChuDe) {
	super();
	MaChuDe = maChuDe;
	TenChuDe = tenChuDe;
}
public String getMaChuDe() {
	return MaChuDe;
}
public void setMaChuDe(String maChuDe) {
	MaChuDe = maChuDe;
}
public String getTenChuDe() {
	return TenChuDe;
}
public void setTenChuDe(String tenChuDe) {
	TenChuDe = tenChuDe;
}

			
}
