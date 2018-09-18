<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>�x�Ȭd��</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>�x�ȰO���d��</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Emp: Home</p>

<h3>��Ƭd��:</h3>
	
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllEmp.jsp'>List</a> all Emps.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="storedrecord.do" >
        <b>��J�x�Ȭy���渹 (�pBXXXXXXXXX):</b>
        <input type="text" name="stor_No">
        <input type="hidden" name="action" value="findByPrimaryKey">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="srSv" scope="page" class="com.storedrecord.model.StoredrecordService" />
   
  <li>
     <FORM METHOD="post" ACTION="front_end/storedrecord.do" >
       <b>��ܭ��u�s��:</b>
       <select size="1" name="empno">
         <c:forEach var="storedrecordVO" items="${Storedrecord.all}" > 
          <option value="${storedrecordVO.stor_No}">${storedrecordVO.stor_No}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="front_end/storedrecord.do" >
       <b>��ܭ��u�m�W:</b>
       <select size="1" name="empno">
         <c:forEach var="empVO" items="${empSvc.all}" > 
          <option value="${empVO.empno}">${empVO.ename}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>


<h3>���u�޲z</h3>

<ul>
  <li><a href='addStoredrecord.jsp'>Add</a> a new StoredRecord.</li>
</ul>

</body>
</html>