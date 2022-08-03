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
							key="YeuThich" bundle="${lang}" /></a></li>
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
					<div class="table-content table-responsive mb-45">
						<table>
							<thead>
								<tr>
									<th class="product-thumbnail"><fmt:message key="Anh"
											bundle="${lang}" /></th>
									<th class="product-name"><fmt:message key="TenSach"
											bundle="${lang}" /></th>
									<th class="product-price"><fmt:message key="Gia"
											bundle="${lang}" /></th>
									<th class="product-quantity"><fmt:message key="TinhTrang"
											bundle="${lang}" /></th>
									<th class="product-subtotal"><fmt:message key="ThemGioHang"
											bundle="${lang}" /></th>
									<th class="product-remove"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${sessionScope.yeuThich.gioHang}" var="item">
									<tr>
										<td class="product-thumbnail"><a href="#"><img
												src="${url}/img/products/${item.sach.anh}" alt="cart-image"></a>
										</td>
										<td class="product-name"><a href="#">${item.sach.tenSach}</a></td>
										<td class="product-price"><span class="amount">${item.sach.giaBan}</span></td>
										<td class="product-stock-status"><span>${item.sach.trangThai eq true?'Còn hàng':'Hết hàng'}</span></td>
										<td class="product-add-to-cart"><a href="#"><fmt:message key="ThemGioHang"
											bundle="${lang}" /></a></td>
											
										<td class="product-remove"><a
											href="${pageContext.request.contextPath}/XoaGioHang?Remove=${item.sach.maSach}"><i
												class="fa fa-times" aria-hidden="true"></i></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- Table Content Start -->
					
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

</script>
<jsp:include page="footer.jsp"></jsp:include>

