package com.orderinvoice.model;

import java.sql.Connection;
import java.util.List;



public class OrderinvoiceService {
private OrderinvoiceDAO_interface dao;
	
	public OrderinvoiceService() {
		dao = new OrderinvoiceDAO();
	}

	public OrderinvoiceVO addInvoice(OrderinvoiceVO orderinvoiceVO, Connection con) {
		OrderinvoiceVO oinVO = new OrderinvoiceVO();
		dao.insert2(orderinvoiceVO, con);
		return oinVO;
	}
	
	public List<OrderinvoiceVO> findByOrder_no(String order_no) {
		return dao.findByOrder_no(order_no);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
