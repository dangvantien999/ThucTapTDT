package Demo;

import java.util.Hashtable;
import java.util.Set;

public class Main {

	public static void main(String[] args) {
		Hashtable<Integer, Intern> hashtable = new Hashtable<Integer, Intern>();
		hashtable.put(1 , new Intern("Inter01", "Đặng Văn Tiến", "Java"));
		hashtable.put(2 , new Intern("Inter02", "Nguyễn Xuân Trường", "Font End"));
		hashtable.put(3 , new Intern("Inter03", "Phạm Minh Hiếu", "Font end"));
		hashtable.put(4 , new Intern("Inter04", "Ngô Thanh Tâm", "Java"));
		hashtable.put(5 , new Intern("Inter05", "Nguyễn Hồng Ngân", "Tester"));
		hashtable.put(6 , new Intern("Inter06", "Đỗ Xuân Vĩnh", "Java"));
		// Lấy ra các phần tử theo key value
		
		Show(hashtable);
		// Lấy ra phần tử theo key
		System.out.println("Lấy ra phần tử theo key" + hashtable.get(1));
	}

	public static void Show( Hashtable<Integer, Intern> hashtable) {
		Set<Integer> key = hashtable.keySet();
		
		for ( Integer keys : key) {
			System.out.println( keys +"," + hashtable.get(keys));
		}
	}
}
