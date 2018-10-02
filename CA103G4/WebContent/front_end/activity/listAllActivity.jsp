<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.activity.model.*"%>
<%
	ActivityService actSvc = new ActivityService();
	List<ActivityVO> list = actSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Site Title -->
<title>活動快訊</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">


	<!-- linearicons CSS -->
<link rel="stylesheet"
	href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

<!--JS BS4-->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
 <!-- Shave v2.1.3 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/shave/2.1.3/shave.min.js"></script>


<style>
html {
	height: 100%;
}

body {
	background-image: url(img/woodbackground3.png);
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center;
	background-size: cover;
	font-family: 'Noto Sans TC', sans-serif;
	font-weight: 400;
}



.promo {
    background: #ccc;
    padding: 3px;
}

.expire {
    color: red;
}
.adimg{
		width:100%;
		height:500px;
	}
#carousel-ctrl .item img{ 
 		height:100%;
 	} 
</style>
</head>
<jsp:include page="/front_end/header.jsp" flush="true" />
<body
	background="<%=request.getContextPath()%>/front_end/img/woodbackground3.png "
	width="100%" height="">
	<!--your html start==================================================================================-->

 <script>$('.carousel').carousel()</script>
	
	<div class="container " >
	<div class="row " style="background-color:rgba(255,255,255,0.45)">
	<div class="my-4"></div>
		<!-- 廣告輪播圖開始 -->
		<div class="container-fulid">
		
      <div class="carousel slide" data-ride="carousel" id="carouselArchitecture" >
          <ol class="carousel-indicators">
            <c:forEach varStatus="s" items="${list}">
            <li data-target="#carouselArchitecture" data-slide-to="${s.index}" class=" ${s.first?'active':''}">
              <i></i>
            </li>
              </c:forEach>
          </ol>
          <div class="carousel-inner" role="listbox">
             <c:forEach varStatus="s" var="actVO" items="${list}">
            <div class="carousel-item ${s.first?'active':''}">
              <img class="img-fluid" src="<%=request.getContextPath()%>/activity/activityshowimage.do?act_No=${actVO.act_No}" data-holder-rendered="true" > </div>
           </c:forEach>
          </div>
        </div>
        </div>
		<!-- 廣告輪播圖end -->

			<%-- 錯誤表列 --%>
			<c:if test="${not empty errorMsgs}">
				<font style="color: red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
			
			<!-- 搜尋開始 -->

			<div class="my-1 col-12" >
				<div class="card" style="background-color:rgba(255,255,255,0.45)">
					<div class="card-header">Featured</div>
					<div class="card-body">
						<p class="card-text">With supporting text below as a natural
							lead-in to additional content.</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>






			<!-- 分頁及內容開始 -->
			<div class="my-1 col-12">	
			
	<%@ include file="pages/page1.file"%></div>
	
<c:forEach var="activityVO" items="${list}" begin="<%=pageIndex%>"
					end="<%=pageIndex+rowsPerPage-1%>" >
<div class="col-12" style="background-color:rgba(255,255,255,0.45)" >
	 <div class="py-4 px-2"  >
    <div class="container" >
      <div class="row">
        <div class=" col-md-12">
          <div class="row" style="background-color:rgba(255,255,255,0.45)">
            <div class="text-center col-4 px-1 py-1">
              <img class="img-fluid d-block" src="<%=request.getContextPath()%>/activity/activityshowsmallpic.do?act_No=${actVO.act_No}"  > </div>
            <div class="col-8">
              <h5 class="mb-3 text-dark my-3">
                <b>${activityVO.act_Name}${activityVO.act_Content}</b>
                
              </h5>
              <hr>
              <p class="my-1">活動期間
							<fmt:formatDate value="${activityVO.act_Start}"
								pattern="yyyy-MM-dd " />
							~
							<fmt:formatDate value="${activityVO.act_End}"
								pattern="yyyy-MM-dd " />&nbsp;${activityVO.act_Views}&nbsp;Views</p> 
			<p></p>
              <a href="#" class="btn btn-outline-primary">More..</a>
              <a class="btn btn-danger" href="#">取得優惠卷</a>
            </div>
          </div>
        </div>
      </div>
  
    </div>
  </div>
  </div>
		</c:forEach>
		
	
			
			
			
			
			
			
		<!-- page2的內容 -->
	    <div class="col-12  my-2">	
	    <div class="row justify-content-center">
	    <div class="col-3 px-2 py-1">
     	<%@ include file="pages/page2.file"%></div>
     	<!-- 內容結束-->
    </div>	
    </div>
	</div>

</div>
<!-- container end -->
	
<jsp:include page="/front_end/footer.jsp" flush="true" />
</body>
</html>
