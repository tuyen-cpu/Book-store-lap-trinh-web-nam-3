<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:url value="/view/client" var="url" />
<jsp:include page="header.jsp" flush="true"></jsp:include>

<!-- Breadcrumb Start -->
<div class="breadcrumb-area mt-30">
	<div class="container">
		<div class="breadcrumb">
			<ul class="d-flex align-items-center">
				<li><a href="index.html"><fmt:message key="TrangChu"
							bundle="${lang}" /></a></li>
				<li class="active"><a href="cart.html"><fmt:message
							key="GioHang" bundle="${lang}" /></a></li>
			</ul>
		</div>
	</div>
	<!-- Container End -->
</div>
<!-- Breadcrumb End -->
<!-- Cart Main Area Start -->
<div class="cart-main-area ptb-100 ptb-sm-60">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<!-- Form Start -->
				<form action="${pageContext.request.contextPath}/CapNhatGioHang" method="post">
					<!-- Table Content Start -->
					<div  class="table-content table-responsive mb-45">
						<table>
							<thead>
								<tr>
									<th class="product-thumbnail"><fmt:message key="Anh"
											bundle="${lang}" /></th>
									<th class="product-name"><fmt:message key="TenSach"
											bundle="${lang}" /></th>
									<th class="product-price"><fmt:message key="Gia"
											bundle="${lang}" /></th>
									<th class="product-quantity"><fmt:message key="SoLuong"
											bundle="${lang}" /></th>
									<th class="product-subtotal"><fmt:message key="Tong"
											bundle="${lang}" /></th>
									<th class="product-remove"></th>
								</tr>
							</thead>
							<tbody id="replace">
								<c:forEach items="${sessionScope.gioHang.gioHang}" var="item">
									<tr>
										<td class="product-thumbnail"><a href="#"><img
												src="${url}/img/products/${item.sach.anh}" alt="cart-image"></a>
										</td>
										<td class="product-name"><a href="#">${item.sach.tenSach}</a></td>
										<td class="product-price"><span class="amount">${item.sach.giaBan}</span></td>
										<td class="product-quantity"><input type="number"
											name="soluonggiohang" min="1" max="10" value="${item.soLuong}"></td>
										<td class="product-subtotal"><fmt:formatNumber value="${item.tongGia*heSo}" type="currency"/></td>
										<td class="product-remove"><a onclick="callJqueryAjax(${item.sach.maSach})"
											"><i
												class="fa fa-times" aria-hidden="true"></i></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- Table Content Start -->
					<div class="row">
						<!-- Cart Button Start -->
						<div class="col-md-8 col-sm-12">
							<div class="buttons-cart">
								<input type="submit"
									value="<fmt:message key="CapNhat"
												bundle="${lang}" /><fmt:message key="GioHang"
												bundle="${lang}" />">
								<a href="${pageContext.request.contextPath}/TrangChu"><fmt:message key="TiepTucMua" bundle="${lang}" /></a>
							</div>
						</div>
						<!-- Cart Button Start -->
						<!-- Cart Totals Start -->
						<div class="col-md-4 col-sm-12">
							<div class="cart_totals float-md-right text-md-right">
								<h2>
									<fmt:message key="TongGioHang" bundle="${lang}" />
								</h2>
								<br>
								<table class="float-md-right">
									<tbody>
										<!-- <tr class="cart-subtotal">
                                                    <th>Subtotal</th>
                                                    <td><span class="amount">$215.00</span></td>
                                                </tr> -->
										<tr class="order-total">
											<th><fmt:message key="Tong" bundle="${lang}" /></th>
											<td><strong><span class="amount"><fmt:formatNumber value="${sessionScope.gioHang.tongGia*heSo}" type="currency"/></span></strong>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="wc-proceed-to-checkout">
									<a href="${pageContext.request.contextPath}/ThanhToan"><fmt:message
											key="ChiTietThanhToan" bundle="${lang}" /></a>
								</div>
							</div>
						</div>
						<!-- Cart Totals End -->
					</div>
					<!-- Row End -->
				</form>
				<!-- Form End -->
			</div>
		</div>
		<!-- Row End -->
	</div>
</div>
<!-- Cart Main Area End -->
<!-- Support Area Start Here -->


<script>
function callJqueryAjax(masach){
	console.log(masach)
	$.ajax({
	url     : 'XoaGioHang',
	method     : 'POST',
	data     : {masach : masach},
	success    : function(resultText){
		console.log(resultText)
	$('#replace').html(resultText);
	},
	error : function(jqXHR, exception){
	console.log('Error occured!!');
	}
	});
	}</script>
<jsp:include page="footer.jsp"></jsp:include>

