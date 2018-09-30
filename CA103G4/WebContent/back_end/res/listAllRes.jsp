<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.reservation.model.*"%>

<%
	ResService resSvc = new ResService();
	List<ResVO> list = resSvc.getAll();
	pageContext.setAttribute("list",list);
%>



<%-- <%@ include file="/front_end/PostHeader.jsp" %> --%>
<%@ include file="/back_end/HeadquarterHeader.jsp" %> 

     	<div >
     			<b>所有訂位紀錄 - listAllRes.jsp</b>
     			<hr>
     		</div>
     		
              <div class="remove"  id="res2end">
                    <div class="col-md-12 text-center">
                            <div class="container" >
                                <table class="table table-striped">
	                                <thead>
	                                    <tr>
	                                        <th>訂位流水編號</th>
	                                        <th>會員編號</th>
	                                        <th>桌位流水編號</th>
	                                        <th>訂位成立日期</th>
	                                        <th>訂位日期時段起始時間</th>
	                                        <th>訂位日期時段結束時間</th>
	                                        <th>用餐人數</th>
	                                        <th>訂位使用狀態</th>           
	                                        <th>修改</th>           
	                                                   
	                                    </tr>
	                                </thead>
                                <tbody> 
					<%@ include file="page1.file" %> 
					<c:forEach var="resVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">                       
                                    <tr>    
                	
      					<c:set var="res_timefn">
      							${resVO.res_timefn}
      					</c:set>   
      					<c:set var="res_timebg">
      							${resVO.res_timefn}
      					</c:set>
      					     	
                		
                                        <td>${resVO.res_no}</td>
                                        <td>${resVO.mem_no}</td>
                                        <td>${resVO.dek_no}</td>
                                        <td>${resVO.res_submit}</td>
                                       <td> <% 
				                             java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
				                             String res_timebg = df.format(java.sql.Timestamp.valueOf((String)pageContext.getAttribute("res_timebg")));
				
				                             out.println(res_timebg);
				                          %> </td>
                                        <td> <% 
				                             java.text.DateFormat fd = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
				                             String res_timefn = fd.format(java.sql.Timestamp.valueOf((String)pageContext.getAttribute("res_timefn")));
				
				                             out.println(res_timefn);
				                          %> </td>
                                        <td>${resVO.res_people}</td>
                                        <td>${resVO.res_status}</td>
                                        
                                        <td>
										  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/res/res.do" style="margin-bottom: 0px;">
										     <input type="submit" value="修改">
										     <input type="hidden" name="res_no"  value="${resVO.res_no}">
										     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
										</td>
				
                                    </tr>
                                  
                   </c:forEach> 
                   
                                </tbody>
                              
                                          
                            </table>
                          <%@ include file="page2.file" %>   
                     </div>
                </div>
             </div>


<%-- <%@ include file="/back_end/PostFooter.jsp" %>	 --%>
<%@ include file="/back_end/HeadquarterFooter.jsp" %> 	
	