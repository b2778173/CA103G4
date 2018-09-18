<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.delivery.model.*"%>

<jsp:useBean id="delSvc" scope="page" class="com.delivery.model.DeliveryService" />
<html>
<head><title>�Ҧ����� - listAllDelivey.jsp</title>

<style>
  table#table-1 {
	background-color: orange;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>���e��s��</th>
		<th>�����s��</th>
		<th>���u�s��</th>
		<th>���e�檬�A</th>
	</tr>
	
	<c:forEach var="deliveryVO" items="${delSvc.all}">
		<tr>
			<td>${deliveryVO.deliv_no}</td>
			<td>${deliveryVO.branch_no}</td>
			<td>${deliveryVO.emp_no}</td>
			<td>${deliveryVO.deliv_status}</td>
		</tr>
	</c:forEach>
</table>

</body>
</html>