<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.storedrecord.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    StoredrecordService strSvc = new StoredrecordService();
    List<StoredrecordVO> list = strSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>�Ҧ��x�Ȭ������ - listAllStoredRecord.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
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
<body bgcolor='white'>

<h4>�����m�߱ĥ� EL ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�Ҧ��x�Ȭ������ - listAllEmp.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

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
		<th>�x�Ȭy���渹</th>
		<th>�|���s��</th>
		<th>�x�Ȥ��</th>
		<th>�x���I��</th>
		<th>�^�X���Q�I��(�˹�)</th>
		<th>�x�ȧ������A</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="StoredrecordVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${StoredrecordVO.stor_No}</td>
			<td>${StoredrecordVO.mem_No}</td>
			<td>${StoredrecordVO.stor_Date}</td>
			<td>${StoredrecordVO.stor_Point}</td>
			<td>${StoredrecordVO.drew_Point}</td>
			<td>${StoredrecordVO.stor_Status}</td> 
			<td>
			  <FORM METHOD="post" ACTION="storedrecord.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="stor_No"  value="${StoredrecordVO.stor_No}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="storedrecord.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="stor_No"  value="${StoredrecordVO.stor_No}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>