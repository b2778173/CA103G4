package com.ingclass.model;

import java.util.List;

public class IngclassTest {

	public static void main(String[] args) {
		IngclassDAO dao = new IngclassDAO();
	
//		//?���?
//		IngclassVO ingdtc1 = new IngclassVO();
//		ingdtc1.setIngdtc_Id("T0001");
//		ingdtc1.setIngdtc_Name("麵�??");
//
//		dao.insert(ingdtc1);
		
		//修改
		IngclassVO ingdtc2 = new IngclassVO();
		ingdtc2.setIngdtc_Id("T0011");
		ingdtc2.setIngdtc_Name("RR");

		dao.update(ingdtc2);
//		
		//?��?��
//		dao.delete("T0004");
//		
//		//?���?
//		List<IngclassVO> list = dao.getAll();
//		for (IngclassVO ingdtc : list) {
//			System.out.print(ingdtc.getIngdtc_Id() + ",");
//			System.out.print(ingdtc.getIngdtc_Name() + ",");
//
//			System.out.println();
//		}
		
	}
}
