package Demo;

public class Intern {

	private String MaIntern;
	private String HoTen;
	private String Language;
	public Intern(String maIntern, String hoTen, String language) {
		super();
		MaIntern = maIntern;
		HoTen = hoTen;
		Language = language;
	}
	public String getMaIntern() {
		return MaIntern;
	}
	public void setMaIntern(String maIntern) {
		MaIntern = maIntern;
	}
	public String getHoTen() {
		return HoTen;
	}
	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}
	public String getLanguage() {
		return Language;
	}
	public void setLanguage(String language) {
		Language = language;
	}
	
	public String toString() {
		return " Mã số Intern : " + MaIntern + " Họ Và Tên : " + HoTen + " Language : " + Language;
	}
}
