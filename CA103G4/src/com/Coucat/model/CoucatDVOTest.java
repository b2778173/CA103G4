package com.Coucat.model;
import java.util.List;


public class CoucatDVOTest {

	public static void main(String[] args) {
//		insert������ done
//		 CoucatVO cv1=new CoucatVO("�I�æ������ש��ѧ馩100��",
//				 "CC2","�n�d�u�f�֨ӻ��",100,"2018-09-05","2018-09-08",100);
		 CoucatDAO dao =new CoucatDAO();
//		 dao.insert(cv1);
//   	update������ done
		
//		 CoucatVO cv2=new CoucatVO("20180908-000002","XX�I�æ������ש��ѧ馩100��",
//				 "CC2","�n�d�u�f�֨ӻ��",80,"2018-09-05 10:00","2018-09-08 12:00",100);
//		 
//		 dao.update(cv2);
		 
//		 getAll������ done
		
//		 List<CoucatVO> licv=dao.getAll();
//		 for(CoucatVO cv4:licv) {
//			 System.out.println(cv4.getCoucat_No());
//			 System.out.println(cv4.getCoucat_Name());
//			 System.out.println(cv4.getCoucat_Cata());
//			 System.out.println(cv4.getCoucat_Cont());
//			 System.out.println(cv4.getCoucat_Value());
//			 System.out.println(cv4.getCoucat_Valid());
//			 System.out.println(cv4.getCoucat_Invalid());
//			 System.out.println(cv4.getCoucat_Amo());
//			 System.out.println("=========================");
//		 }
//		 findbyCATA������ DONE
		 CoucatVO cv5=dao.findByCata("CC1");
		 System.out.println(cv5.getCoucat_No());
		 System.out.println(cv5.getCoucat_Name());
		 System.out.println(cv5.getCoucat_Cata());
		 System.out.println(cv5.getCoucat_Cont());
		 System.out.println(cv5.getCoucat_Value());
		 System.out.println(cv5.getCoucat_Valid());
		 System.out.println(cv5.getCoucat_Invalid());
		 System.out.println(cv5.getCoucat_Amo());
		 System.out.println("=========================");
		 
		 
	}

}
