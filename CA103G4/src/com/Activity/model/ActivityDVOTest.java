package com.Activity.model;

import java.util.List;
import java.util.Scanner;

public class ActivityDVOTest {

	public static void main(String[] args) {
//		Scanner sc=new Scanner(System.in);
//		System.out.println("�п�J���ʽs��201809-0004");
//		String act_No=sc.next();
//		System.out.println("�п�J�u�f�����O�s��20180904-01");
//		String coucat_No=sc.next();
//		System.out.println("�п�J���ʤ���");
//		Integer act_Cat=sc.nextInt();
//		System.out.println("�п�J���ʦW��");
//		String act_Name=sc.next();
//		System.out.println("�п�J���ʤ��e");
//		String act_Content=sc.next();
//		System.out.println("�п�J���ʰ_�l���2018-10-18");
//		String act_Start=sc.next();
//		System.out.println("�п�J���ʲפ���2018-10-18");
//		String act_End=sc.next();
//		sc.close();
//		insert������ done
//		ActivityVO cv1=new ActivityVO("20180904-03",1,"sdfsf","sdfsdfsdf","2018-09-05","2018-09-20");
		 ActivityDAO dao =new ActivityDAO();
//		 dao.insert(cv1);

		//  update������ done
//		 ActivityVO cv2=new ActivityVO(act_No,coucat_No,act_Cat,act_Name,act_Content,act_Start,act_End);
//		 dao.update(cv2);
		 
//		 findByDate_between������ done
		 
//		 ActivityVO  cv3=dao.findByDate_between("2018-09-12","2018-09-22","2018-09-12","2018-12-22");
//		 System.out.println(cv3.getAct_No());
//		 System.out.println(cv3.getCoucat_No());
//		 System.out.println(cv3.getAct_Cat());
//		 System.out.println(cv3.getAct_Name());
//		 System.out.println(cv3.getAct_Content());
//		 System.out.println(cv3.getAct_Start());
//		 System.out.println(cv3.getAct_End());
		 
//		 getAll������done
		
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
//		 List<ActivityVO> licv1=dao.findended();
//		 for(ActivityVO cv4:licv1) {
//			 System.out.println(cv4.getAct_No());
//			 System.out.println(cv4.getCoucat_No());
//			 System.out.println(cv4.getAct_Cat());
//			 System.out.println(cv4.getAct_Name());
//			 System.out.println(cv4.getAct_Content());
//			 System.out.println(cv4.getAct_Start());
//			 System.out.println(cv4.getAct_End());
//			 System.out.println("=========================");
//		 }
		 
//		 List<ActivityVO> licv2=dao.findonGoing();
//		 for(ActivityVO cv4:licv2) {
//			 System.out.println(cv4.getAct_No());
//			 System.out.println(cv4.getCoucat_No());
//			 System.out.println(cv4.getAct_Cat());
//			 System.out.println(cv4.getAct_Name());
//			 System.out.println(cv4.getAct_Content());
//			 System.out.println(cv4.getAct_Start());
//			 System.out.println(cv4.getAct_End());
//			 System.out.println("=========================");
//		 }
		 List<ActivityVO> licv3=dao.findbfStart();
		 for(ActivityVO cv4:licv3) {
			 System.out.println(cv4.getAct_No());
			 System.out.println(cv4.getCoucat_No());
			 System.out.println(cv4.getAct_Cat());
			 System.out.println(cv4.getAct_Name());
			 System.out.println(cv4.getAct_Content());
			 System.out.println(cv4.getAct_Start());
			 System.out.println(cv4.getAct_End());
			 System.out.println("=========================");
		 }
//		 
	}

}