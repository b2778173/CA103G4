<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.storedrecord.model.*"%>

<%
	List<StoredrecordVO> list = (List<StoredrecordVO>) request.getAttribute("list");
	pageContext.setAttribute("list", list);
%>
<jsp:include page="/front_end/header.jsp" />
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- font aewsome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="theme.css" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/v4-shims.css">

    <!-- Bootsraps-->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!-- datepicker-->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />

    <!-- My css for transaction page-->
    <link rel="stylesheet" href="css/transaction_css.css">
</head>

<body class="shadow-lg w-100" style="background-color: antiquewhite">
    <form method="post" action="storedrecord.do">
        <div id="div_shadow" class="py-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <a id="a1" href="transaction_mang.jsp" "><h1 class=" d-flex justify-content-start" style="font-weight: bolder;">�x�Ⱥ޲z</h1></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="py-1" style="">
            <div class="container">
                <div class="row ">
                    <div id="div1" class="col-md-12 d-flex" style="margin-top: 10px">
                        <input id="stor_No" class="form-control" type="text" name="mem_No" placeholder="�x�ȳ渹 ,�|���s��"><input type="hidden" name="action" value="findByMem_no">
                        <button class="btn btn-sm align-items-center" style="height: 35px; width: 35px; background-color: antiquewhite;">
                            <i class="fas fa-search" style="font-size: 20px; color: grey"></i>
                        </button>
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <div class="input-group date" id="datetimepicker2" data-target-input="nearest">
                                            <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker2">

                                            <div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
                                                <div class="input-group-text">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="shadow p-2">
            <div class="container">
                <div class="row">
                    <div class="col-md-12" style="">
                        <table class="table datatable">
                            <thead>
                                <tr>
                                    <th>#�x�Ȭy���渹</th>
                                    <th>�|���s��</th>
                                    <th>�x�Ȥ��</th>
                                    <th>�x���I��</th>
                                    <th>�^�X�˹�</th>
                                    <th>�x�Ȫ��A</th>
                                </tr>
                            </thead>
                            <%@ include file="page1.file"%>
                            <tbody>
                                <c:forEach var="StoredrecordVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                                    <tr>
                                        <td>${StoredrecordVO.stor_No}</td>
                                        <td>${StoredrecordVO.mem_No}</td>
                                        <td>${StoredrecordVO.stor_Date}</td>
                                        <td>${StoredrecordVO.stor_Point}</td>
                                        <td>${StoredrecordVO.drew_Point}</td>
                                        <c:choose>
                                            <c:when test="${StoredrecordVO.stor_Status==1}">
                                                <td>���\</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td>����</td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <%@ include file="page2.file"%>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="/front_end/footer.jsp" />
        <!--Timestampicker-->
        <script>
            $(function() {
                $('#datetimepicker2').datetimepicker({
                    locale: 'zh'
                });
            });

        </script>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </form>
</body>

</html>
