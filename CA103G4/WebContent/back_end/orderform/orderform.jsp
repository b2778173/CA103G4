<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<%
pageContext.setAttribute("empVO",request.getSession().getAttribute("empVO"));
%>


<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>orderform</title>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>


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
<!-- https://www.toodoo.com/db/color.html 色碼表-->
<style type="text/css">

	.btncolor{
		background-color: #FF7F50;
	}
</style>

</head>
<body bgcolor='white'>




<%-- 背景 --%>
<jsp:include page="/back_end/PostHeader.jsp" flush="true"/> 

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<div class="container">

	<%-- s以下是新增外送派送單 --%>
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/delivery/delivery.do">
	<input type="submit" value="營收分析" class="btn btn-dark" value="Submit Button"> 
	<input type="hidden" name="action" value="selectOrd">
	</FORM>
	
	<br>
	
	<jsp:useBean id="deSvc" scope="page" class="com.desk.model.DeskService" />
	<%-- 以下是複合查詢 --%>
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/orderform/orderform.do" class="form-inline" role="form">
		
		<div class="form-row align-items-center">
		
			<div class="input-group-prepend" style=" margin-right:70px;">
				 <span class="input-group-text">訂單編號:</span>
				 <input type="text" name="order_no">
			</div>
			
			<div class="input-group-prepend" style=" margin-right:70px;">
			 <span class="input-group-text">桌位編號</span>
			 <select size="1" name="emp_no" class="form-control" id="exampleSelect1">
	 			<option  value="">
				<c:forEach var="deskVO" items="${deSvc.getByBrano(empVO.branch_No)}">
				<option value="${deskVO.dek_no}">${deskVO.dek_no}
				</c:forEach>
			</select>
			</div>
			
			<div class="input-group-prepend" style=" margin-right:70px;">
	  			<span class="input-group-text">訂單成立時間:</span>
	  			<input type="text" id="f_date1" name="hiredate">
	  		</div>
	  		
			 <div class="input-group-prepend" style=" margin-right:30px;">
				 <input type="hidden" name="action" value="listEmps_ByCompositeQuery"> 
				 <input type="submit" value="開始搜尋" class="btn btn-dark" value="Submit Button">
			 </div>
		</div>
	</FORM>
	<br>


	<table class="table table-hover">
	<tr>
		<th>訂單編號</th>
		<th>桌位流水號</th>
		<th>會員編號</th>
		<th>分店編號</th>
		<th>派送單編號</th>
		<th>訂單類型</th>
		<th>訂單金額</th>
		<th>訂單狀態</th>
		<th>外送地址</th>
		<th>訂單成立時間</th>
		<th>付款狀態</th>
	</tr>
	
	<c:forEach var="deliveryVO" items="${get_By_Key}">
<tr>
	<td>${deliveryVO.deliv_no}</td>
	<td>${deliveryVO.branch_no}</td>
		
	<td>
	
	<jsp:useBean id="empSvc" scope="page" class="com.employee.model.EmpService" />

	<c:if test="${(deSvc.out).size() != (empSvc.getOutEmpByBranchNo(empVO.branch_No)).size()}">
		<c:if test="${deliveryVO.emp_no == null}">
			<form METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/delivery/delivery.do">
				<select size="1" name="emp_no">
					<c:forEach var="empVO" items="${empSvc.getOutEmpByBranchNo(empVO.branch_No)}">
						<c:if test="${!(deSvc.out).contains(empVO.emp_No)}">
							<option value="${empVO.emp_No}" ${(deliveryVO.emp_no==empVO.emp_No)? 'selected':'' } >${empVO.emp_Name}
						</c:if>
					</c:forEach>
				</select>
							
					<input type="hidden" name="action" value="update">
					<input type="hidden" name="deliv_no"  value="${deliveryVO.deliv_no}">
					<input type="hidden" name="deliv_status"  value="${deliveryVO.deliv_status}">
					<input type="hidden" name="whichPage">
					<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
					<input type="submit" value="指派外送員">
			</form>	
		</c:if>
	</c:if>
	
	<c:if test="${(deSvc.out).size() == (empSvc.getOutEmpByBranchNo(empVO.branch_No)).size() and deliveryVO.emp_no == null}">
		目前尚無可派送員工。
	</c:if>
	
						
		<c:if test="${deliveryVO.emp_no != null}">			
					<c:forEach var="empVO" items="${empSvc.getOutEmpByBranchNo(empVO.branch_No)}">
					<c:if test="${deliveryVO.emp_no==empVO.emp_No}">
					${empVO.emp_No}-${empVO.emp_Name}
					</c:if>
					</c:forEach>
		</c:if>
		</td>
			
<%-- 下面可以操控狀態，1為等待派送文字，2時為可以點擊確認的按鈕，點擊後會成為3，派送完成的字樣--%>
		
		<td>
			<c:if test="${deliveryVO.deliv_status == '1'}">
				 等待派送
			</c:if>
			<c:if test="${deliveryVO.deliv_status == '2'}">
				<form METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/delivery/delivery.do">
					<input type="hidden" name="action" value="update">
					<input type="hidden" name="deliv_no"  value="${deliveryVO.deliv_no}">
					<input type="hidden" name="emp_no"  value="${deliveryVO.emp_no}">
					<input type="hidden" name="deliv_status"  value="${deliveryVO.deliv_status}">
					<input type="hidden" name="whichPage">
					<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
					<input type="submit" value="確認完成">
				</form>	
			</c:if>
			<c:if test="${deliveryVO.deliv_status == '3'}">
				 派送完成
			</c:if>
		</td>
	</tr>
</c:forEach>
	</table>




























<%-- 從上面的div class="container"延伸下來，讓include也能排版 --%>
</div>







<%-- 背景 --%>
<jsp:include page="/back_end/PostFooter.jsp" flush="true"/>

 <script src="https://code.jquery.com/jquery-3.2.1.min.js "></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>

<link   rel="stylesheet" type="text/css" href="datetimepicker/jquery.datetimepicker.css" />
<script src="datetimepicker/jquery.js"></script>
<script src="datetimepicker/jquery.datetimepicker.full.js"></script>

<script>
 $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
 	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       //step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: new Date(),              // value:   new Date(),
		   //startDate:	        '2017/07/10',  // 起始日
           maxDate:              new Date()  // 去除今日(不含)之後
        });
</script>

</html>