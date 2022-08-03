package tuyen.websach.model;



public class Item {
	private Sach sach;
	private int soLuong;
	public Item(Sach sach) {
		super();
		this.sach = sach;
		this.soLuong = 1;
	}
	public void tangSoLuong() {
        soLuong++;
    }

    public void giamSoLuong() {
       soLuong--;
    }
	public Sach getSach() {
		return sach;
	}
	public void setSach(Sach sach) {
		this.sach = sach;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public float getTongGia() {
		return sach.getGiaBan()*soLuong;
	}
	
}
