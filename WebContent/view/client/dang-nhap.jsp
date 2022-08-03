<%@page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:url value="/view/client/" var="url" />
   
   
       <jsp:include page="header.jsp"></jsp:include>
      
        <div class="breadcrumb-area mt-30">
            <div class="container">
                <div class="breadcrumb">
                    <ul class="d-flex align-items-center">
                        <li><a href="index.html"><fmt:message key="TrangChu" bundle="${lang}"/></a></li>
                        <li><a href="register.html"><fmt:message key="DangNhap" bundle="${lang}"/></a></li>
                        
                    </ul>
                </div>
            </div>
            <!-- Container End -->
        </div>
        <!-- Breadcrumb End -->
        <!-- LogIn Page Start -->
        <div class="log-in ptb-100 ptb-sm-60">
            <div class="container">
                <div class="row">
                    <!-- New Customer Start -->
                    <div class="col-md-6">
                        <div class="well mb-sm-30">
                            <div class="new-customer">
                                <h3 class="custom-title">Khách hàng mới</h3>
                                <p class="mtb-10"><strong><fmt:message key="DangKy" bundle="${lang}"/></strong></p>
                                <p>
Bằng cách tạo tài khoản, bạn sẽ có thể mua sắm nhanh hơn, cập nhật trạng thái đơn hàng và theo dõi các đơn hàng bạn đã thực hiện trước đó</p>
                                <a class="customer-btn" href="register.jsp"><fmt:message key="DangKy" bundle="${lang}"/></a>
                            </div>
                        </div>
                    </div>
                    <!-- New Customer End -->
                    <!-- Returning Customer Start -->
                    <div class="col-md-6">
                        <div class="well">
                            <div class="return-customer">
                                <h3 class="mb-10 custom-title"><fmt:message key="DangNhap" bundle="${lang}"/></h3>
                               
                                <form action="${pageContext.request.contextPath}/DangNhap" method="post">
                                    <div class="form-group">
                                        <label>Tên Tài khoản</label>
                                        <input type="text" name="username" autocomplete="off" placeholder="Nhập username tại đây..."  class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label><fmt:message key="MatKhau" bundle="${lang}"/></label>
                                        <input type="text" name="pass" autocomplete="off" placeholder="Nhập mật khẩu tại đây" id="input-password" class="form-control">
                                    </div>
                                    <p class="lost-password"><a href="${pageContext.request.contextPath}/QuenMatKhau"><fmt:message key="MatKhau" bundle="${lang}"/></a></p>
                                <p>  <font color="red">  ${dangnhap}</font></p>
                                    <input type="submit" value="Đăng nhập" autocomplete="off" class="return-customer-btn">
                                </form>
                                <div><font color="red"><b>${dadangnhap}</b></font></div>
                            </div>
                        </div>
                    </div>
                    <!-- Returning Customer End -->
                </div>
                <!-- Row End -->
            </div>
            <!-- Container End -->
        </div>
       
       <jsp:include page="footer.jsp"></jsp:include>
    
 