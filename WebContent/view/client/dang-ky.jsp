<%@page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:url value="/view/client/" var="url" />
  <jsp:include page="header.jsp"></jsp:include>
    
        <!-- Breadcrumb Start -->
        <div class="breadcrumb-area mt-30">
            <div class="container">
                <div class="breadcrumb">
                    <ul class="d-flex align-items-center">
                        <li><a href="index.html"><fmt:message key="TrangChu" bundle="${lang}"/></a></li>
                        <li class="active"><a href="register.html"><fmt:message key="DangKy" bundle="${lang}"/></a></li>
                    </ul>
                </div>
            </div>
            <!-- Container End -->
        </div>
        <!-- Breadcrumb End -->
       <!-- Register Account Start -->
        <div class="register-account ptb-100 ptb-sm-60">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="register-title">
                            <h3 class="mb-10"><fmt:message key="DangKy" bundle="${lang}"/> <fmt:message key="TaiKhoan" bundle="${lang}"/></h3>
                           
                        </div>
                    </div>
                </div>
                <!-- Row End -->
                <div class="row">
                    <div class="col-sm-12">
                        <form class="form-register" method="post" action="${pageContext.request.contextPath}/DangKy">
                            <fieldset>
                                <legend><fmt:message key="ThongTinCaNhan" bundle="${lang}"/></legend>
                                <div class="form-group d-md-flex align-items-md-center">
                                    <label class="control-label col-md-2" for="f-name"><span class="require">*</span><fmt:message key="HoTen" bundle="${lang}"/></label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" autocomplete="off" name="hoten" placeholder="Nhập họ tên" required="required">
                                    </div>
                                </div>
                                
                                <div class="form-group d-md-flex align-items-md-center">
                                    <label class="control-label col-md-2" for="email"><span class="require">*</span>Email</label>
                                    <div class="col-md-10">
                                        <input type="email" class="form-control" autocomplete="off" name="email" placeholder="Nhập email..." required="required">
                                    </div>
                                </div>
                                
                               <div class="form-group d-md-flex align-items-md-center">
                                    <label class="control-label col-md-2" for="username"><span class="require">*</span>UserName</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" autocomplete="off" name="username" placeholder="Nhập userName" required="required">
                                    </div>
                                </div>
                           
                               
                                <div class="form-group d-md-flex align-items-md-center">
                                    <label class="control-label col-md-2" for="pwd"><span class="require">*</span><fmt:message key="MatKhau" bundle="${lang}"/></label>
                                    <div class="col-md-10">
                                        <input type="password" class="form-control" autocomplete="off" name="passwd" placeholder="Mật khẩu" required="required">
                                    </div>
                                </div>
                                <div class="form-group d-md-flex align-items-md-center">
                                    <label class="control-label col-md-2" for="pwd-confirm"><span class="require">*</span><fmt:message key="NhapLaiMatKhau" bundle="${lang}"/></label>
                                    <div class="col-md-10">
                                        <input type="password" class="form-control" autocomplete="off" name="passwd" placeholder="Xác nhận mật khẩu" required="required">
                                    </div>
                                </div>
                            </fieldset>
                            
                            <div class="terms">
                                <center>
                                <c:if test="${trangThai ne null}">
                                  <font color="red"><b><label><fmt:message key="${trangThai}" bundle="${lang}"/></label></b></font></br>
                                   </c:if>
                                    <input type="submit" value="<fmt:message key="DangKy" bundle="${lang}"/>" class="return-customer-btn">
                                </center>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- Row End -->
            </div>
            <!-- Container End -->
        </div>
        <!-- Register Account End -->
        <!-- Support Area Start Here -->
    <jsp:include page="footer.jsp"></jsp:include>
       
