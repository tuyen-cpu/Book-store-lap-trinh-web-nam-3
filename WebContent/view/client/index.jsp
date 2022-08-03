<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:url value="/view/client/" var="url" />
<jsp:include page="header.jsp" flush="true"></jsp:include>
<div class="like-product-area">
	<h2 class="section-ttitle2 mb-30"><fmt:message key="BanChay" bundle="${lang}"/></h2>
	<!-- Like Product Activation Start Here -->
	<div class="like-pro-active owl-carousel">
		<!-- Single Product Start -->
		<c:forEach items="${sachBanChay}" var="sach">
			<div class="single-product">
				<!-- Product Image Start -->
				<div class="pro-img">
					<a href="${pageContext.request.contextPath}/ChiTietSach?masach=${sach.maSach}"> <img class="primary-img"
						src="${url}/img/products/${sach.anh}" alt="single-product">
						<img class="secondary-img" src="${url}/img/products/${sach.anh}"
						alt="single-product">
					</a> <a href="#" class="quick_view" data-toggle="modal"
						data-target="#myModal" title="Quick View"><i
						class="lnr lnr-magnifier"></i></a>
				</div>
				<!-- Product Image End -->
				<!-- Product Content Start -->
				<div class="pro-content">
					<div class="pro-info">
						<h4>
							<a href="${pageContext.request.contextPath}/ChiTietSach?masach=${sach.maSach}">${sach.tenSach}</a>
						</h4>
						<p>
							<span class="price"><fmt:formatNumber value="${(sach.giaBan-(sach.giaBan*(sach.giamGia/100)))*heSo}" type="currency"/></span>
						</p>
					</div>
					<div class="pro-actions">
						<div class="actions-primary">
							<a href="${pageContext.request.contextPath}/ThemGioHang?Add=${sach.maSach}" title="Add to Cart"> +<fmt:message
									key="ThemGioHang" bundle="${lang}" /></a>
						</div>
						<div class="actions-secondary">
							<!-- <a href="compare.html" title="Compare"><i
								class="lnr lnr-sync"></i> <span>Add To Compare</span></a> -->
							<a href="${pageContext.request.contextPath}/ThemYeuThich?Add=${sach.maSach}" title="WishList"><i
								class="lnr lnr-heart"></i> <span><fmt:message
										key="YeuThich" bundle="${lang}" /></span></a>
						</div>
					</div>
				</div>
				<!-- Product Content End -->
			</div>
		</c:forEach>
		<!-- Single Product End -->
	</div>
	<!-- Like Product Activation End Here -->
</div>
<jsp:include page="footer.jsp" flush="true"></jsp:include>

