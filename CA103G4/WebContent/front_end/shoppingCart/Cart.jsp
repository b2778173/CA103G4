<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="java.util.* , com.menu.model.*"%>
<html>
<head>
<title>Mode II �d�ҵ{�� - Cart.jsp</title>
<!-- <link rel="stylesheet" type="text/css" -->
<%-- 	href="<%=request.getContextPath()%>/front_end/shoppingCart/css/shoppingCart.css"> --%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/v4-shims.css">
<style>
table, th, td {
	border: 1px solid black;
	text-align: center;
}
</style>
</head>
<body>
	<br>
	<%
		@SuppressWarnings("unchecked")
		Vector<MenuVO> buylist = (Vector<MenuVO>) session.getAttribute("shoppingcart");
		System.out.println(request.getContextPath() + "/front_end/shoppingCart/css/shoppingCart.css");
	%>
	<%
		if (buylist != null && (buylist.size() > 0)) {
	%>

	<img src="images/tomcat.gif">
	<font size="+3">�ثe�ʪ��������e�p�U�G�]Cart.jsp�^</font>

	<table id="table-1" >
		<tr>
			<th width="200">�\�I�W��</th>
			<th width="100">����</th>
			<th width="100">�ƶq</th>
			<th width="100">�`�p</th>
			
			<th width="120"><img src="images/view-cart.png"></th>
		</tr>
	</table>
	<table>

		<%
			for (int index = 0; index < buylist.size(); index++) {
					MenuVO menuVO = buylist.get(index);
		%>
		<tr>
			<td width="200"><%=menuVO.getMenu_Id()%></td>
			<td width="100"><%=menuVO.getMenu_Price()%></td>
			<td width="100"><%=menuVO.getMenu_quantity()%></td>
			<td width="100"><%=menuVO.getMenu_Price() * menuVO.getMenu_quantity()%></td>
			<td width="120">
				<form name="deleteForm" action="ShoppingServlet.do" method="POST">
					<input type="hidden" name="action" value="DELETE"> 
					<input type="hidden" name="del" value="<%=index%>">
					<button type="submit" value="�R��"><i class="fa fa-trash" style="font-size: 25px;color: firebrick"></i></button>
				</form>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<p>
	<form name="checkoutForm" action="ShoppingServlet.do" method="POST">
		<input type="hidden" name="action" value="CHECKOUT"> <input
			type="submit" value="�I�ڵ��b" class="button">
	</form>
	<form name="checkoutForm" action="noodleShop.jsp" method="POST">
		<input type="hidden" name="action" value="CHECKOUT"> <input
			type="submit" value="�~�����" class="button">
	</form>
	<%
		}
	%>
</body>
</html>