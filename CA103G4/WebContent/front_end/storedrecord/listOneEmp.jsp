<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.storedrecord.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  StoredrecordVO SrVO = (StoredrecordVO) request.getAttribute("srVO"); //EmpServlet.java(Concroller), �s�Jreq��SrVO����
%>

<html>
<head>
<title>�x�Ⱦ��v���� - listOneEmp.jsp</title>

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
	width: 600px;
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

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�x�Ⱦ��v���� - ListOneEmp.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/arrow-back-icon.png" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�x�Ȭy���渹</th>
		<th>�|���s��</th>
		<th>�x�Ȥ��</th>
		<th>�x���I��</th>
		<th>�^�X���Q�I��(�˹�)</th>
		<th>�x�ȧ������A</th>
	</tr>
	<tr>
		<td><%=SrVO.getStor_No()%></td>
		<td><%=SrVO.getMem_No()%></td>
		<td><%=SrVO.getStor_Date()%></td>
		<td><%=SrVO.getStor_Point()%></td>
		<td><%=SrVO.getStor_Point()%></td>
		<td><%=SrVO.getStor_Status()%></td>
	</tr>
</table>

</body>
</html>