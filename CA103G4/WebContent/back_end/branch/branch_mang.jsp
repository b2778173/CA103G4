<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.branch.model.*"%>

<%
	//BranchVO brVO = (BranchVO) request.getAttribute("brVO");
	//List<BranchVO> list = (List<BranchVO>) request.getAttribute("list");
	//pageContext.setAttribute("list", list);
%>
<!-- header -->
<jsp:include page="/front_end/header.jsp" />
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- font aewsome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="theme.css" type="text/css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/v4-shims.css">
<!-- Bootsraps-->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<!-- datepicker-->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />

<!-- My <css></css> for transaction page-->
<link rel="stylesheet" href="css/branch_css.css">

</head>

<body class="shadow-lg w-100" style="background-color: antiquewhite">
	<form method="post" action="branch.do">
		<div id="div_shadow" class="py-5"">
			<div class=" container">
				<div class="row">
					<div class="col-md-12">
						<a id="a1" href="branch_mang.jsp">
							<h1 class="d-flex justify-content-start">分店管理</h1>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="py-1" style="">
			<div class="container">
				<div class="row ">
					<div id="div1" class="col-md-12 d-flex align-items-center">
						<jsp:useBean id="branchSvc" scope="page"
							class="com.branch.model.BranchService" />
						<div class="input-group d-flex align-items-center"
							style="width: 430px;">
							<FORM METHOD="post" ACTION="branch.do">
								<div class="input-group-append">
									<button type="submit" class="btn btn-sm align-items-center"
										style="height: 35px; width: 35px; background-color: antiquewhite;">
										<i class="fas fa-search"
											style="font-size: 20px; color: grey; margin-top: 8px;"></i>
									</button>
								</div>
								<b>分店編號:</b> <select class="custom-select align-items-center"
									id="inputGroupSelect04 stor_No"
									aria-label="Example select with button addon" size="1"
									name="branch_No"
									style="margin-left: 5px !important; width: 100px; margin-right: 8%;"
									onchange="submit()">
									<option selected>請選擇
										<c:forEach var="brVO" items="${branchSvc.all}">
											<option value="${brVO.branch_No}">${brVO.branch_No}
										</c:forEach>
								</select> <input type="hidden" name="action" value="getOne_For_Display">

							</FORM>
							<FORM METHOD="post" ACTION="branch.do">
								<b>所在城市:</b> <select class="custom-select align-items-center"
									id="inputGroupSelect04 stor_No"
									aria-label="Example select with button addon" size="1"
									name="branch_City"
									style="margin-left: 5px !important; width: 100px;"
									onchange="submit()">
									<option selected>請選擇
										<c:forEach var="brCity" items="${branchSvc.city}">
											<option value="${brCity}">${brCity}
										</c:forEach>
								</select> <input type="hidden" name="action" value="findBybranch_City">
							</FORM>
						</div>
						<div class="d-flex ml-auto">

							<button id="allbranch"
								class="align-self-center btn btn-light btn-xs" type="button"
								name="action" value="listAll" onclick="getAll()">
								<i class="fas fa-globe-asia">全部分店</i>
							</button>


						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="shadow p-1">
			<div class="container">
				<div class="row">
					<div class="col-md-12" style="">
						<table class="table datatable">
							<thead>
								<tr>
									<th>#分店編號</th>
									<th>分店名稱</th>
									<th>分店所在縣市</th>
									<th>分店所在區域</th>
									<th>分店所在地址</th>
									<th>分店電話</th>
								</tr>
							</thead>

							<tbody id="tbody">
								<c:if test="${not empty errorMsgs}">
									<c:forEach var="errorObj" items="${errorMsgs}">
										<tr valign="middle">
											<td class="text-center" colspan="6" rowspan="6"
												style="vertical-align: middle; font-size: 20px; color: sienna; padding-top: 20px; font-weight: bold;">${errorObj}</td>
										</tr>
									</c:forEach>
									<tr style="height: 40px;"></tr>
									<tr style="height: 40px;"></tr>
									<tr style="height: 40px;"></tr>
									<tr style="height: 40px;"></tr>
									<tr style="height: 40px;"></tr>
									<tr style="height: 40px;"></tr>
								</c:if>
								<!-- display for one object query -->
								<c:if test="${not empty brVO}">

									<tr>

										<td>${brVO.branch_No}</td>
										<td>${brVO.branch_Name}</td>
										<td>${brVO.branch_City}</td>
										<td>${brVO.branch_Dist}</td>
										<td>${brVO.branch_Addr}</td>
										<td>${brVO.branch_Tel}</td>

										<td>
											<FORM id="upform" method="post" action="branch.do">
												<input id="update" type="button"
													class="update btn btn-warning btn-sm" value="修改"
													style="display: none"> <input type="hidden"
													name="action" value="update"> <input id="branch_No"
													type="hidden" name="branch_No" value="${brVO.branch_No}">
											</FORM>
										</td>
										<td>
											<FORM id="delform" method="post" action="branch.do">
												<input type="button" class="del btn btn-danger btn-sm"
													value="刪除 " style="display: none"> <input
													type="hidden" name="action" value="delete"> <input
													type="hidden" name="branch_No" value="${brVO.branch_No}">
											</FORM>
										</td>

									</tr>

								</c:if>
								<!-- display for multi objects query -->
								<c:if test="${not empty list}">
									<c:forEach var="brVO" items="${list}">
										<tr>
											<td>${brVO.branch_No}</td>
											<td>${brVO.branch_Name}</td>
											<td>${brVO.branch_City}</td>
											<td>${brVO.branch_Dist}</td>
											<td>${brVO.branch_Addr}</td>
											<td>${brVO.branch_Tel}</td>
											<td><input id="update" type="button"
												class="update btn btn-warning btn-sm" value="修改"
												style="display: none"></td>
											<td><input type="button"
												class="del btn btn-danger btn-sm" value="刪除 "
												style="display: none"></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						<div class="d-flex inline">
							<button class="d-flex ml-auto btn btn-info btn-sm"
								style="margin: 5px;" onclick="mytoggle()">
								<i class="fas fa-edit">編輯</i>
							</button>
							<button class="d-flex btn btn-info btn-sm" style="margin: 5px;">
								<i class="far fa-plus-square"><b>新增</b></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--add & update-->
		
		<!-- footer -->
		<jsp:include page="/front_end/footer.jsp" />
		<!--Timestampicker-->
		<!-- 		<script type="text/javascript"> -->
		// $(function() { // $('#datetimepicker2').datetimepicker({ // locale
		: 'ru' // }); // });
		<!-- 		</script> -->
		<script>
			//Ajax查全部分店資料
			function getAll() {
				var xhr = new XMLHttpRequest();
				xhr.onload = function() {
					if (xhr.status == 200) {
						//取回...回傳的資料
						document.getElementById("tbody").innerHTML = xhr.responseText;
					} else {
						alert(xhr.status);
					} //xhr.status == 200
				}; //onload 
				xhr.open("POST", "branch.do", true);
				xhr.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded"); //若無設定此header, servlet getParameter將取不到值
				//送出請求 
				xhr
						.send("action="
								+ document.getElementById("allbranch").value);
				// 				alert(document.getElementById("allbranch").value);
			}
			//顯示修改刪除按鈕
			var updateBtn; //修改按鈕
			var update; //確定修改布林值
			var delBtn; //刪除按鈕
			var del; //確定刪除布林值
			function mytoggle() {
				updateBtn = document.getElementsByClassName("update");
				delBtn = document.getElementsByClassName("del");
				for (var i = 0; i < delBtn.length; i++) {
					updateBtn[i].style.display = "table-cell"; //顯示修改按鈕
					updateBtn[i].onclick = function() { //註冊點擊事件
						if (confirm("確定修改分店?")) {
							document.getElementById("upform").submit();
						}
					}
					delBtn[i].onclick = function() {
						del();
					}
					delBtn[i].style.display = "table-cell"; //顯示刪除按鈕

					//console.log(x[i]);
				}
			}

			function del() {
				if (confirm("確定刪除分店?"))
					var xhr = new XMLHttpRequest();
				xhr.onload = function() {
					if (xhr.status == 200) {
						document.getElementById("tbody").innerHTML = xhr.responseText;
					} else {
						alert(xhr.status);
					}
				};
				xhr.open("post", "branch.do", true);
				xhr.setRequestHeader("Content-Type",
						"application/x-www-form-urlencoded");
				xhr.send("action=delete&branch_No="
						+ document.getElementById("branch_No").value);
			}
		</script>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"
			integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
			integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
			crossorigin="anonymous"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
			integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
			crossorigin="anonymous"></script>
	</form>
</body>

</html>