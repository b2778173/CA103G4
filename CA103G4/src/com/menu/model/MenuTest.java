package com.menu.model;

import java.util.List;

public class MenuTest {

	public static void main(String[] args) {
		MenuDAO dao = new MenuDAO();
		
//		//?���?
//		MenuVO menu1 = new MenuVO();
//		menu1.setMenu_No("M001");
//		menu1.setMenu_Id("極致豚骨??��?�麵");
//		menu1.setMenu_Type("經典餐�??");
//		menu1.setMenu_Price(299);
//		menu1.setMenu_Intro("48小�?�溫?��?��?��精緻豚骨湯頭，搭??��?��?��?��?�溫泉�??");
//		menu1.setMenu_Photo(null);
//		menu1.setMenu_Status(1);
//		dao.insert(menu1);
		
		
		
//		//修改
//		MenuVO menu2 = new MenuVO();
//		menu2.setMenu_No("M003");
//		menu2.setMenu_Id("?��???");
//		menu2.setMenu_Type("經典餐�??");
//		menu2.setMenu_Price(269);
//		menu2.setMenu_Intro("OOOOOOOOO");
//		menu2.setMenu_Photo(null);
//		menu2.setMenu_Status(1);
//		dao.update(menu2);
//		
//		//?��?��
//		dao.delete("M003");
//		
		//?���?
		List<MenuVO> list = dao.getAll();
		for (MenuVO menu : list) {
			System.out.print(menu.getMenu_No() + ",");
			System.out.print(menu.getMenu_Id() + ",");
			System.out.print(menu.getMenu_Type() + ",");
			System.out.print(menu.getMenu_Price() + ",");
			System.out.print(menu.getMenu_Intro() + ",");
			System.out.print(menu.getMenu_Photo() + ",");
			System.out.print(menu.getMenu_Status() + ",");

			System.out.println();
		}
	
	}
	
	
}





