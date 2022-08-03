<%@page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:url value="/view/client" var="url" />
<jsp:include page="header.jsp" flush="true"></jsp:include>
    <!--[if lte IE 9]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
    <![endif]-->

   
        <!-- Main Header Area End Here -->
        <!-- Categorie Menu & Slider Area Start Here -->
       
        <!-- Breadcrumb Start -->
        <div class="breadcrumb-area mt-30">
            <div class="container">
                <div class="breadcrumb">
                    <ul class="d-flex align-items-center">
                        <li><a href="index.html"><fmt:message key="TrangChu" bundle="${lang}"/></a></li>
                        <li class="active"><a href="checkout.html"><fmt:message key="ThanhToan" bundle="${lang}"/></a></li>
                    </ul>
                </div>
            </div>
            <!-- Container End -->
        </div>
        <!-- Breadcrumb End -->
        <!-- coupon-area start -->
       
        <!-- coupon-area end -->
        <!-- checkout-area start -->
        <div class="checkout-area pb-100 pt-15 pb-sm-60">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="checkbox-form mb-sm-40">
                            <h3><fmt:message key="ChiTietThanhToan" bundle="${lang}"/></h3>
                            <div class="row">
                               
                              
                                <div class="col-md-12">
                                    <div class="checkout-form-list mb-30">
                                        <label><fmt:message key="HoTen" bundle="${lang}"/></label>
                                        <input type="text" placeholder="" value="${sessionScope.kh.hoTen}">
                                    </div>
                                </div>
                                   <div class="col-md-12">
                                    <div class="checkout-form-list mb-30">
                                        <label><fmt:message key="DiaChi" bundle="${lang}"/></label>
                                        <input type="text" placeholder="" value="${sessionScope.kh.diaChi}">
                                    </div>
                                </div>
                               
                               
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-30">
                                        <label>Email <span class="required">*</span></label>
                                        <input type="email" placeholder="" value="${sessionScope.kh.email}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="checkout-form-list mb-30">
                                        <label><fmt:message key="SDT" bundle="${lang}"/> <span class="required">*</span></label>
                                        <input type="text" placeholder="" value="${sessionScope.kh.sDT}">
                                    </div>
                                </div>
                               
                            </div>
                            <div class="different-address">
                                <div class="ship-different-title">
                                  
                                </div>
                                
                                <div class="order-notes">
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="your-order">
                            <h3><fmt:message key="HoaDonCuaBan" bundle="${lang}"/> </h3>
                            <div class="your-order-table table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="product-name"><fmt:message key="TenSach" bundle="${lang}"/></th>
                                            <th class="product-total"><fmt:message key="Tong" bundle="${lang}"/></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${sessionScope.gioHang.gioHang}" var="item">
                                        <tr class="cart_item">
                                            <td class="product-name">
                                                ${item.sach.tenSach} <span class="product-quantity"> x ${item.soLuong}</span>
                                            </td>
                                            <td class="product-total">
                                                <span class="amount"><fmt:formatNumber value="${item.tongGia*heSo}" type="currency"/></span>
                                            </td>
                                        </tr>
                                       </c:forEach>
                                    </tbody>
                                    <tfoot>
                                       <%--  <tr class="cart-subtotal">
                                            <th>Cart Subtotal</th>
                                            <td><span class="amount"><fmt:formatNumber value="${sessionScope.gioHang.tongGia*heSo}" type="currency"/></span></td>
                                        </tr> --%>
                                        <tr class="order-total">
                                            <th><fmt:message key="Tong" bundle="${lang}"/></th>
                                            <td><span class=" total amount"><fmt:formatNumber value="${sessionScope.gioHang.tongGia*heSo}" type="currency"/></span>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                           <div class="col-md-8 col-sm-12">
                                    <div class="buttons-cart">
                                       
                                        <a href="${pageContext.request.contextPath}/XuLyThanhToan"><fmt:message key="ThanhToan" bundle="${lang}"/></a>
                                    </div>
                                </div>
                    </div>
                </div>
            </div>
        </div>
       </div>
        <jsp:include page="footer.jsp"></jsp:include>
   
