<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.orderform.model.*"%>
<%@ page import="com.orderinvoice.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>>

<jsp:useBean id="menuService"  scope="page" class="com.menu.model.MenuService" />
<jsp:useBean id="custommealsService" scope="page" class="com.custommeals.model.CustommealsService" />
<jsp:useBean id="ingredientCombinationService" scope="page" class="com.ingredientcombination.model.IngredientCombinationService" />
<jsp:useBean id="ingredientsService" scope="page" class="com.ingredients.model.IngredientsService" />

<%
OrderformService ofsvc = new OrderformService();
List<OrderformVO> orderformlist = new ArrayList();
MemberVO memVO = (MemberVO) session.getAttribute("memVO");
orderformlist = ofsvc.getOrderNoByMemNo(memVO.getMem_No());
pageContext.setAttribute("orderformlist",orderformlist);


OrderinvoiceService orderinvoiceSvc = new OrderinvoiceService();
List<OrderinvoiceVO> orderinvoicelist = new ArrayList();



for(int i = 0; i < orderformlist.size() ; i++ ){
	System.out.println("--------------------------");
	System.out.println(i);
	System.out.println(orderformlist.get(i).getOrder_no());
	System.out.println(orderformlist.get(i).getOrderInvoiceList());
	
	OrderformVO orderformVO = orderformlist.get(i);
	List<OrderinvoiceVO> orderInvoiceList = orderinvoiceSvc.findByOrder_no(orderformVO.getOrder_no());
	orderformVO.setOrderInvoiceList(orderInvoiceList);
	
	
	System.out.println(orderformlist.get(i).getOrderInvoiceList());
}


%>







<html>
<head>
<title>訂單資料 - listOneOrderformByMemNo.jsp</title>

<style>
  table#table-1 {
	background-color: rgba(255, 255, 255, 0.45);
/*     border: 2px solid black; */
	border-radius: 15px;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: white;
    display: inline;
  }
</style>

<style>
  table {
    
	width: 1280px;
	background-color: rgba(255, 255, 255, 0.45);
	margin-top: 5px;
	margin-bottom: 5px;
	margin-left:400px;
	font-family: 'Noto Sans TC', sans-serif;
    font-weight: 600;
    font-size: 20;
    border: 1px;
    border-color:black;
  }
  table, th, td {
/*     border: 2px solid rgba(255, 255, 255, 0.8); */
    border-radius: 15px;
    text-align: center;
    font-family: 'Noto Sans TC', sans-serif;
    font-weight: 600;
  }
  th, td {
    padding: 5px;
    text-align: center;
    font-family: 'Noto Sans TC', sans-serif;
    font-weight: 600;
  }
  @import url(//fonts.googleapis.com/earlyaccess/notosanstc.css);
  body{background-image:url("images/woodbackground3.png");}

</style>


</head>
<body bgcolor='white'>

<jsp:include page="/front_end/header.jsp" flush="true"></jsp:include>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>訂單資料 - listOneOrderformByMemNo.jsp</h3>
		 <h4><a href="select_page.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table>
	

	<c:forEach var="orderFormVO" items="${orderformlist}">
	<tr>
		<th>訂單編號--------------------------------------------</th>
		<th>會員編號</th>
		<th>訂單價格</th>
	</tr>
	<tr>
		<td>${orderFormVO.order_no}</td>
		<td>${orderFormVO.mem_no}</td>
		<td>${orderFormVO.order_price}</td>

	</tr>
		<tr>
			<th></th>
			<th>餐點編號</th>
			<th>自訂餐點編號</th>
		</tr>
		<c:forEach var="orderinvoiceVO" items="${orderFormVO.getOrderInvoiceList()}">
			

		<tr>
				<td></td>
				<td>${orderinvoiceVO.menu_no}</td>
				<td>${orderinvoiceVO.custom_no}</td>
		</tr>
		
		<tr>
				<td></td>
				<td>${menuService.getOneMenu(orderinvoiceVO.menu_no).menu_Id}</td> 
				<td>${custommealsService.getOneCustommeals(orderinvoiceVO.custom_no).custom_Name}</td>
				<td>${ingredientCombinationService.getOneIngredientCombination(orderinvoiceVO.custom_no).ingdt_Id}</td>
<%-- 				<td>${ingredientsService.getOneIngredients(orderinvoiceVO.ingdt_Id).ingdt_Name}</td> --%>
		</tr>
		
		</c:forEach>	
	</c:forEach>
	

</table>

</body>
</html>