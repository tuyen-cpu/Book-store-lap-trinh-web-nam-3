<%@page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:url value="/view/client" var="url" />
<jsp:include page="header.jsp" flush="true"></jsp:include>
        <div class="breadcrumb-area mt-30">
            <div class="container">
                <div class="breadcrumb">
                    <ul class="d-flex align-items-center">
                        <li><a href="index.html"><fmt:message key="TrangChu" bundle="${lang}"/></a></li>
                        <li><a href="register.html"><fmt:message key="TaiKhoan" bundle="${lang}"/></a></li>
                        <li class="active"><a href="forgot-password.html"><fmt:message key="QuenMatKhau" bundle="${lang}"/></a></li>
                    </ul>
                </div>
            </div>
            <!-- Container End -->
        </div>
        <!-- Breadcrumb End -->
        <!-- Register Account Start -->
        <div class="Lost-pass ptb-100 ptb-sm-60">
            <div class="container">
                <div class="register-title">
                    <h3 class="mb-10 custom-title"><fmt:message key="TaoTaiKhaon" bundle="${lang}"/></h3>
                    <p class="mb-10">${trangthaiquenmatkhau}</p>
                </div>
                <form class="password-forgot clearfix" action="${pageContext.request.contextPath}/XuLyQuenMatKhau">
                    <fieldset>
                        <legend><fmt:message key="ThongTinCaNhan" bundle="${lang}"/></legend>
                        <div class="form-group d-md-flex">
                            <label class="control-label col-md-2" for="email"><span class="require">*</span>Enter you email address here...</label>
                            <div class="col-md-10">
                                <input type="email" name="email" class="form-control" id="email" placeholder="Nhập email tại đây..." required="required">
                            </div>
                        </div>
                    </fieldset>
                    <div class="buttons newsletter-input">
                        <div class="float-left float-sm-left">
                            <a class="customer-btn mr-20" href="login.html"><fmt:message key="TroLai" bundle="${lang}"/></a>
                        </div>
                        <div class="float-right float-sm-right">
                            <input type="submit" value="Tiếp tục" class="return-customer-btn">
                        </div>
                    </div>
                </form>
            </div>
            <!-- Container End -->
        </div>
      <jsp:include page="footer.jsp"></jsp:include>
       
