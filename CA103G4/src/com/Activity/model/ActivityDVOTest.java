package com.Activity.model;

import java.util.List;
import java.util.Scanner;

public class ActivityDVOTest {

	public static void main(String[] args) {
//		insert的執行 done
		ActivityVO cv1=new ActivityVO();
		cv1.setCoucat_No("20180908-000002");
		cv1.setAct_Cat("a1");
		cv1.setAct_Name("gfdgfd");
		cv1.setAct_Content("yoyoyoy");
		cv1.setAct_Start("2018-09-05 10:10");
		cv1.setAct_End("2018-09-06 11:20");
		cv1.setAct_Usecou("AU1");
		ActivityDAO dao =new ActivityDAO();
		 dao.insert(cv1);

		//  update的執行 done
//		 ActivityVO cv2=new ActivityVO(act_No,coucat_No,act_Cat,act_Name,act_Content,act_Start,act_End);
//		 dao.update(cv2);
		 
//		 findByDate_between的執行 done
		 
//		 ActivityVO  cv3=dao.findByDate_between("2018-09-12","2018-09-22","2018-09-12","2018-12-22");
//		 System.out.println(cv3.getAct_No());
//		 System.out.println(cv3.getCoucat_No());
//		 System.out.println(cv3.getAct_Cat());
//		 System.out.println(cv3.getAct_Name());
//		 System.out.println(cv3.getAct_Content());
//		 System.out.println(cv3.getAct_Start());
//		 System.out.println(cv3.getAct_End());
		 
//		 getAll的執行done
		
//		 List<ActivityVO> licv=dao.getAll();
//		 for(ActivityVO cv4:licv) {
//			 System.out.println(cv4.getAct_No());
//			 System.out.println(cv4.getCoucat_No());
//			 System.out.println(cv4.getAct_Cat());
//			 System.out.println(cv4.getAct_Name());
//			 System.out.println(cv4.getAct_Content());
//			 System.out.println(cv4.getAct_Start());
//			 System.out.println(cv4.getAct_End());
//			 System.out.println("=========================");
//		 }
//		
//		 }
//		 
	}

}