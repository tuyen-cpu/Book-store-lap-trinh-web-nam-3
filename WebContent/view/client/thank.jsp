<%@page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" flush="true"></jsp:include>
<div class="breadcrumb-area mt-30">
            <div class="container">
                <div class="breadcrumb">
                    <ul class="d-flex align-items-center">
                        <li><a href="#"><fmt:message key="TrangChu" bundle="${lang}"/></a></li>
                        <li class="active"><a href="404.html">Thành công</a></li>
                    </ul>
                </div>
            </div>
            <!-- Container End -->
        </div>
        <!-- Breadcrumb End -->
        <!-- Error 404 Area Start -->
        <div class="error404-area ptb-100 ptb-sm-60">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="error-wrapper text-center">
                            <div class="error-text">
                              
                                <h2>${camon}</h2>
                               
                            </div>
                            <div class="search-error">
                                <form id="search-form" action="#">
                                    <input type="text" placeholder="Search">
                                    <button><i class="fa fa-search"></i></button>
                                </form>
                            </div>
                            <div class="error-button">
                                <a href="${pageContext.request.contextPath}/TrangChu"><fmt:message key="TroLai" bundle="${lang}"/> <fmt:message key="TrangChu" bundle="${lang}"/></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>