<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" flush="true"></jsp:include>
<div class="breadcrumb-area mt-30">
            <div class="container">
                <div class="breadcrumb">
                    <ul class="d-flex align-items-center">
                        <li><a href="#">Home</a></li>
                        <li class="active"><a href="404.html">Xác thực tài khoản</a></li>
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
                       
                           <div class="search-error">
                                <form id="search-form" action="${pageContext.request.contextPath}/XacThuc">
                                    <input type="text" name="maxacthuc" placeholder="Nhập mã xác thực">
                                    <button><i class="fa fa-search"></i></button>
                                </form>
                            </div>
                                     
                            <div class="error-button">
                               <font color="red" > ${xacthucthatbai}</font>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         <jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>