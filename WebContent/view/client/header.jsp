<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:url value="/view/client" var="url" />
<html class="no-js" lang="zxx">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Home || Truemart Responsive Html5 Ecommerce Template</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicons -->
<link rel="shortcut icon" href="${url}/img/favicon.ico">
<!-- Fontawesome css -->
<link rel="stylesheet" href="${url}/css/font-awesome.min.css">
<!-- Ionicons css -->
<link rel="stylesheet" href="${url}/css/ionicons.min.css">
<!-- linearicons css -->
<link rel="stylesheet" href="${url}/css/linearicons.css">
<!-- Nice select css -->
<link rel="stylesheet" href="${url}/css/nice-select.css">
<!-- Jquery fancybox css -->
<link rel="stylesheet" href="${url}/css/jquery.fancybox.css">
<!-- Jquery ui price slider css -->
<link rel="stylesheet" href="${url}/css/jquery-ui.min.css">
<!-- Meanmenu css -->
<link rel="stylesheet" href="${url}/css/meanmenu.min.css">
<!-- Nivo slider css -->
<link rel="stylesheet" href="${url}/css/nivo-slider.css">
<!-- Owl carousel css -->
<link rel="stylesheet" href="${url}/css/owl.carousel.min.css">
<!-- Bootstrap css -->
<link rel="stylesheet" href="${url}/css/bootstrap.min.css">
<!-- Custom css -->
<link rel="stylesheet" href="${url}/css/default.css">
<!-- Main css -->
<link rel="stylesheet" href="${url}/style.css">
<!-- Responsive css -->
<link rel="stylesheet" href="${url}/css/responsive.css">

<!-- Modernizer js -->
<script src="${url}/js/vendor/modernizr-3.5.0.min.js"></script>
</head>

<body>
	<c:set var="heSo" value="${1/23000}" scope="session" />
	<c:if test="${sessionScope.language eq 'Eng'}">
		<fmt:setLocale value="en_US" scope="session" />
		<c:set var="heSo" value="${1/23000}" scope="session" />
	</c:if>
	<c:if test="${sessionScope.language eq 'VN'}">
		<fmt:setLocale value="vi_VN" scope="session" />
		<c:set var="heSo" value="${1}" scope="session" />
	</c:if>
	<fmt:setBundle basename="messages/BookMessages" var="lang"
		scope="session"></fmt:setBundle>
	<!-- Main Header Area Start Here -->
	<header>
		<!-- Header Top Start Here -->
		<div class="header-top-area home-4">
			<div class="container">
				<!-- Header Top Start -->
				<div class="header-top">
					<ul>
						<!-- <li><a href="#">Free Shipping on order over $99</a></li> -->
						<li><a href="${pageContext.request.contextPath}/GioHang">
								<fmt:message key="GioHang" bundle="${lang}" />
						</a></li>
						<li><a href="${pageContext.request.contextPath}/ThanhToan">
								<fmt:message key="ThanhToan" bundle="${lang}" />
						</a></li>
					</ul>
					<ul>
						<li><span><fmt:message key="NgonNgu" bundle="${lang}" /></span>
							<a href="#"><fmt:message key="NgonNguHienTai"
									bundle="${lang}" /><i class="lnr lnr-chevron-down"></i></a> <!-- Dropdown Start -->
							<ul class="ht-dropdown">
								<li><a
									href="${pageContext.request.contextPath}/NgonNgu?language=Eng"><img
										src="${url}/img/header/1.jpg" alt="language-selector">English</a></li>
								<li><a
									href="${pageContext.request.contextPath}/NgonNgu?language=VN"><img
										src="${url}/img/header/1.jpg" alt="language-selector">Tiếng
										việt</a></li>
							</ul> <!-- Dropdown End --></li>
						<%-- <li><span><fmt:message key="TienTe" bundle="${lang}" /></span><a
							href="#"> USD $ <i class="lnr lnr-chevron-down"></i></a> <!-- Dropdown Start -->
							<ul class="ht-dropdown">
								<li><a href="#">&#36; USD</a></li>
								<li><a href="#"> VNĐ</a></li>
								<li><a href="#">&#163; EURO</a></li>
							</ul> <!-- Dropdown End --></li> --%>
						<c:if test="${sessionScope.user eq null}">
							<li><a href="#"><fmt:message key="TaiKhoan"
										bundle="${lang}" /><i class="lnr lnr-chevron-down"></i></a> <!-- Dropdown Start -->
								<ul class="ht-dropdown">
									<li><a href="${pageContext.request.contextPath}/DangNhap"><fmt:message
												key="DangNhap" bundle="${lang}" /></a></li>
									<li><a href="${pageContext.request.contextPath}/DangKy"><fmt:message
												key="DangKy" bundle="${lang}" /></a></li>
								</ul> <!-- Dropdown End --></li>
						</c:if>
						<c:if test="${sessionScope.user ne null}">
							<button>

								<a href="${pageContext.request.contextPath}/DangXuat"><fmt:message
										key="DangXuat" bundle="${lang}" /></a>
							</button>
						</c:if>
					</ul>
				</div>
				<!-- Header Top End -->
			</div>
			<!-- Container End -->
		</div>
		<!-- Header Top End Here -->
		<!-- Header Middle Start Here -->
		<div class="header-middle ptb-15 black-bg2 home-4">
			<div class="container">
				<div class="row align-items-center no-gutters">
					<div class="col-lg-3 col-md-12">
						<div class="logo mb-all-30">
							<a href="${pageContext.request.contextPath}/TrangChu"><img
								src="${url}/img/logo/logo2.png" alt="logo-image"></a>
						</div>
					</div>
					<!-- Categorie Search Box Start Here -->
					<div class="col-lg-5 col-md-8 ml-auto mr-auto col-10">
						<div class="categorie-search-box">
							<form action="${pageContext.request.contextPath}/TimKiem?index=1" method="get">
								<div class="form-group">
									<select class="bootstrap-select" name="danhMucSearch" >

										<option value="0"><fmt:message key="DanhMuc"
												bundle="${lang}" /></option>
										<c:forEach items="${dsDanhMuc}" var="danhMuc">
											<option value="${danhMuc.maChuDe}">${danhMuc.tenChuDe}</option>
										</c:forEach>
									</select>
								</div>
								<input type="text" name="txtSearch" value="${txtSearch}"
									placeholder="I’m shopping for...">
								<button>
									<i class="lnr lnr-magnifier"></i>
								</button>
							</form>
						</div>
					</div>
					<!-- Categorie Search Box End Here -->
					<!-- Cart Box Start Here -->
					<div class="col-lg-4 col-md-12">
						<div class="cart-box mt-all-30">
							<ul
								class="d-flex justify-content-lg-end justify-content-center align-items-center">
								<li><a href="${pageContext.request.contextPath}/GioHang"><i
										class="lnr lnr-cart"></i><span class="my-cart"><span
											class="total-pro">${sessionScope.gioHang.size}</span><span><fmt:message
													key="GioHang" bundle="${lang}" /></span></span></a> <c:if
										test="${sessionScope.gioHang.size ne 0}">
										<ul class="ht-dropdown cart-box-width">
											<li><c:forEach items="${sessionScope.gioHang.gioHang}"
													var="item" varStatus="i">
												
                                                Sách ${i.count}
                                                <div
														class="single-cart-box">
														<div class="cart-img">
															<a href="#"><img
																src="${url}/img/products/${item.sach.anh}"
																alt="cart-image"></a> <span class="pro-quantity">${item.soLuong}</span>
														</div>
														<div class="cart-content">
															<h6>
																<a href="${pageContext.request.contextPath}/ChiTietSach">${item.sach.tenSach}</a>
															</h6>
															<span class="cart-price">${item.tongGia}</span>

														</div>
														<a class="del-icone"
															href="${pageContext.request.contextPath}/XoaGioHang?Remove=${item.sach.maSach}"><i
															class="ion-close"></i></a>
													</div>
												</c:forEach>
												<div class="cart-footer">
													<ul class="price-content">
														<li><fmt:message key="TongGia" bundle="${lang}" /> <span>${sessionScope.gioHang.tongGia}
																VNĐ</span></li>
														<!-- <li>Shipping <span>$7.00</span></li>
													<li>Taxes <span>$0.00</span></li>
													<li>Total <span>$64.95</span></li> -->
													</ul>
													<div class="cart-actions text-center">
														<a class="cart-checkout" href="${pageContext.request.contextPath}/ThanhToan"><fmt:message
																key="ThanhToan" bundle="${lang}" /></a>
													</div>

												</div></li>
										</ul>
									</c:if></li>
								<li><a href="${pageContext.request.contextPath}/YeuThich"><i class="lnr lnr-heart"></i><span
										class="my-cart"><span><fmt:message
													key="YeuThich" bundle="${lang}" /></span><span>list (${sessionScope.yeuThich eq null ?'0':sessionScope.yeuThich.size})</span></span></a></li>
								<c:if test="${sessionScope.user eq null}">
									<li><a href="#"><i class="lnr lnr-user"></i><span
											class="my-cart"><span> <strong>Sign in</strong>
													Or
											</span><span> Join My Site</span></span></a></li>
								</c:if>
								<c:if test="${sessionScope.user ne null}">
									<li><a href="#"><i class="lnr lnr-user"></i><strong>${sessionScope.user.userName}</strong><span
											class="my-cart"><span> </span></span></a></li>

								</c:if>
							</ul>
						</div>
					</div>
					<!-- Cart Box End Here -->
				</div>
				<!-- Row End -->
			</div>
			<!-- Container End -->
		</div>
		<!-- Header Middle End Here -->
		<!-- Header Bottom Start Here -->
		<div class="header-bottom  header-sticky black-bg2 home-4">
			<div class="container">
				<div class="row align-items-center">
					<div
						class="col-xl-3 col-lg-4 col-md-6 vertical-menu d-none d-lg-block">
						<span class="categorie-title"><fmt:message key="DanhMuc"
								bundle="${lang}" /></span>
					</div>
					<div class="col-xl-9 col-lg-8 col-md-12 ">
						<nav class="d-none d-lg-block">
							<ul class="header-bottom-list d-flex">
								<li class="active"><a href="${pageContext.request.contextPath}/TrangChu"><fmt:message
											key="TrangChu" bundle="${lang}" /></a> <!-- Home Version Dropdown Start --></li>
							<%-- 	<li><a
									href="${pageContext.request.contextPath}/DanhSachSanPham">shop<i
										class="fa fa-angle-down"></i></a> <!-- Home Version Dropdown Start -->
									<ul class="ht-dropdown dropdown-style-two">
										<li><a href="${url}/product.jsp">product details</a></li>
										<li><a href="${url}/compare.html">compare</a></li>
										<li><a href="${pageContext.request.contextPath}/GioHang">Giỏ
												hàng</a></li>
										<li><a
											href="${pageContext.request.contextPath}/ThanhToan">Thanh
												Toán</a></li>
										<li><a href="${url}/wishlist.html"><fmt:message
													key="YeuThich" bundle="${lang}" /></a></li>
									</ul></li> --%>
								<!-- Home Version Dropdown End -->
								<li><a href="${url}/xacthuc.jsp">blog</a> <!-- Home Version Dropdown Start -->
									<ul class="ht-dropdown dropdown-style-two">
										<li><a href="single-blog.html">blog details</a></li>
									</ul> <!-- Home Version Dropdown End --></li>
							
								<li><a href="about.html"><fmt:message key="VeChungToi"
											bundle="${lang}" /></a></li>
								<li><a href="contact.html"><fmt:message key="LienHe"
											bundle="${lang}" /></a></li>
							</ul>
						</nav>
						<div class="mobile-menu d-block d-lg-none">
							<nav>
								<ul>
									<li><a href="${pageContext.request.contextPath}/TrangChu"><fmt:message key="TrangChu"
											bundle="${lang}" /></a> <!-- Home Version Dropdown Start -->
									</li>
									<li><a href="shop.html">shop</a> <!-- Mobile Menu Dropdown Start -->
										<ul>
											<li><a href="product.html">product details</a></li>
											<li><a href="compare.html">compare</a></li>
											<li><a href="cart.html">cart</a></li>
											<li><a href="checkout.html">checkout</a></li>
											<li><a href="wishlist.html">wishlist</a></li>
										</ul> <!-- Mobile Menu Dropdown End --></li>
									<li><a href="blog.html">Blog</a> <!-- Mobile Menu Dropdown Start -->
										<ul>
											<li><a href="single-blog.html">blog details</a></li>
										</ul> <!-- Mobile Menu Dropdown End --></li>
									<li><a href="#">pages</a> <!-- Mobile Menu Dropdown Start -->
										<ul>
											<li><a href="register.html">register</a></li>
											<li><a href="login.html">sign in</a></li>
											<li><a href="forgot-password.html">forgot password</a></li>
											<li><a href="404.html">404</a></li>
										</ul> <!-- Mobile Menu Dropdown End --></li>
									<li><a href="about.html"><fmt:message key="VeChungToi"
											bundle="${lang}" /></a></li>
									<li><a href="contact.html"><fmt:message key="LienHe"
											bundle="${lang}" /></a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
				<!-- Row End -->
			</div>
			<!-- Container End -->
		</div>
		<!-- Header Bottom End Here -->
		<!-- Mobile Vertical Menu Start Here -->
		<div class="container d-block d-lg-none">
			<div class="vertical-menu mt-30">
				<span class="categorie-title mobile-categorei-menu"><fmt:message
						key="DanhMuc" bundle="${lang}" /> </span>
				<nav>
					<div id="cate-mobile-toggle"
						class="category-menu sidebar-menu sidbar-style mobile-categorei-menu-list menu-hidden ">
						<ul>
							<c:forEach items="${dsDanhMuc}" var="danhMuc">
								<li><a
									href="${pageContext.request.contextPath}/DanhSachSach?danhmuc=${danhMuc.maChuDe}">${danhMuc.tenChuDe}</a></li>
							</c:forEach>

						</ul>
					</div>
					<!-- category-menu-end -->
				</nav>
			</div>
		</div>
		<!-- Mobile Vertical Menu Start End -->
	</header>
	<!-- Main Header Area End Here -->
	<!-- Categorie Menu & Slider Area Start Here -->
	<div class="main-page-banner black-bg2 home-3">
		<div class="container">
			<div class="row">
				<!-- Vertical Menu Start Here -->
				<div class="col-xl-3 col-lg-4 d-none d-lg-block">
					<div class="vertical-menu mb-all-30">
						<nav>
							<ul class="vertical-menu-list">

								<c:forEach items="${dsDanhMuc}" var="danhMuc">
									<li><a
										href="${pageContext.request.contextPath}/DanhSachSach?danhmuc=${danhMuc.maChuDe}">${danhMuc.tenChuDe}</a></li>
								</c:forEach>
							</ul>
						</nav>
					</div>
				</div>
				<!-- Vertical Menu End Here -->
			</div>
			<!-- Row End -->
		</div>
		<!-- Container End -->

	</div>