<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/view/client/" var="url" />
<html class="no-js" lang="zxx">

<head>

</head>

<body>
	<jsp:include page="header.jsp" flush="true"></jsp:include>

	<!-- Main Wrapper Start Here -->

	<!-- Categorie Menu & Slider Area End Here -->
	<!-- Breadcrumb Start -->
	<div class="breadcrumb-area mt-30">
		<div class="container">
			<div class="breadcrumb">
				<ul class="d-flex align-items-center">
					<li><a href="${pageContext.request.contextPath}/TrangChu"><fmt:message key="TrangChu"
												bundle="${lang}" /></a></li>
					<li class="active"><a href="#"><fmt:message key="TimKiem"
												bundle="${lang}" /></a></li>
				</ul>
			</div>
		</div>
		<!-- Container End -->
	</div>
	<!-- Breadcrumb End -->
	<!-- Shop Page Start -->
	<div class="main-shop-page pt-100 pb-100 ptb-sm-60">
		<div class="container">
			<!-- Row End -->
			<div class="row">
				<!-- Sidebar Shopping Option Start -->
				<div class="col-lg-3 order-2 order-lg-1">
					<div class="sidebar">
						<!-- Sidebar Electronics Categorie Start -->
						<div class="electronics mb-40">
							<h3 class="sidebar-title">Electronics</h3>
							<div id="shop-cate-toggle"
								class="category-menu sidebar-menu sidbar-style">
								<ul>
									<li class="has-sub"><a href="#">Camera</a>
										<ul class="category-sub">
											<li><a href="shop.html">Cords and Cables</a></li>
											<li><a href="shop.html">gps accessories</a></li>
											<li><a href="shop.html">Microphones</a></li>
											<li><a href="shop.html">Wireless Transmitters</a></li>
										</ul> <!-- category submenu end--></li>
									<li class="has-sub"><a href="#">gamepad</a>
										<ul class="category-sub">
											<li><a href="shop.html">cube lifestyle hd</a></li>
											<li><a href="shop.html">gopro hero4</a></li>
											<li><a href="shop.html">bhandycam cx405ags</a></li>
											<li><a href="shop.html">vixia hf r600</a></li>
										</ul> <!-- category submenu end--></li>
									<li class="has-sub"><a href="#">Digital Cameras</a>
										<ul class="category-sub">
											<li><a href="shop.html">Gold eye</a></li>
											<li><a href="shop.html">Questek</a></li>
											<li><a href="shop.html">Snm</a></li>
											<li><a href="shop.html">vantech</a></li>
										</ul> <!-- category submenu end--></li>
									<li class="has-sub"><a href="#">Virtual Reality</a>
										<ul class="category-sub">
											<li><a href="shop.html">Samsung</a></li>
											<li><a href="shop.html">Toshiba</a></li>
											<li><a href="shop.html">Transcend</a></li>
											<li><a href="shop.html">Sandisk</a></li>
										</ul> <!-- category submenu end--></li>
								</ul>
							</div>
							<!-- category-menu-end -->
						</div>
						<!-- Sidebar Electronics Categorie End -->
						<!-- Price Filter Options Start -->
						<div class="search-filter mb-40">
							<h3 class="sidebar-title">filter by price</h3>
							<form action="#" class="sidbar-style">
								<div id="slider-range"></div>
								<input type="text" id="amount" class="amount-range" readonly="">
							</form>
						</div>
						<!-- Price Filter Options End -->
						<!-- Sidebar Categorie Start -->
						<div class="sidebar-categorie mb-40">
							<h3 class="sidebar-title">categories</h3>
							<ul class="sidbar-style">
								<li class="form-check"><input class="form-check-input"
									value="#" id="camera" type="checkbox"> <label
									class="form-check-label" for="camera">Cameras (8)</label></li>
								<li class="form-check"><input class="form-check-input"
									value="#" id="GamePad" type="checkbox"> <label
									class="form-check-label" for="GamePad">GamePad (8)</label></li>
								<li class="form-check"><input class="form-check-input"
									value="#" id="Digital" type="checkbox"> <label
									class="form-check-label" for="Digital">Digital Cameras
										(8)</label></li>
								<li class="form-check"><input class="form-check-input"
									value="#" id="Virtual" type="checkbox"> <label
									class="form-check-label" for="Virtual"> Virtual Reality
										(8) </label></li>
							</ul>
						</div>
						<!-- Sidebar Categorie Start -->
						<!-- Product Size Start -->
						<div class="size mb-40">
							<h3 class="sidebar-title">size</h3>
							<ul class="size-list sidbar-style">
								<li class="form-check"><input class="form-check-input"
									value="" id="small" type="checkbox"> <label
									class="form-check-label" for="small">S (6)</label></li>
								<li class="form-check"><input class="form-check-input"
									value="" id="medium" type="checkbox"> <label
									class="form-check-label" for="medium">M (9)</label></li>
								<li class="form-check"><input class="form-check-input"
									value="" id="large" type="checkbox"> <label
									class="form-check-label" for="large">L (8)</label></li>
							</ul>
						</div>
						<!-- Product Size End -->
						<!-- Product Color Start -->
						<div class="color mb-40">
							<h3 class="sidebar-title">color</h3>
							<ul class="color-option sidbar-style">
								<li><span class="white"></span> <a href="#">white (4)</a></li>
								<li><span class="orange"></span> <a href="#">Orange (2)</a>
								</li>
								<li><span class="blue"></span> <a href="#">Blue (6)</a></li>
								<li><span class="yellow"></span> <a href="#">Yellow (8)</a>
								</li>
							</ul>
						</div>
						<!-- Product Color End -->
						<!-- Product Top Start -->
						<div class="top-new mb-40">
							<h3 class="sidebar-title">Top New</h3>
							<div class="side-product-active owl-carousel">
								<!-- Side Item Start -->
								<div class="side-pro-item">
									<!-- Single Product Start -->
									<div class="single-product single-product-sidebar">
										<!-- Product Image Start -->
										<div class="pro-img">
											<a href="product.html"> <img class="primary-img"
												src="img\products\20.jpg" alt="single-product"> <img
												class="secondary-img" src="img\products\19.jpg"
												alt="single-product">
											</a>
											<div class="label-product l_sale">
												30<span class="symbol-percent">%</span>
											</div>
										</div>
										<!-- Product Image End -->
										<!-- Product Content Start -->
										<div class="pro-content">
											<h4>
												<a href="product.html">Work Lamp Silver Proin</a>
											</h4>
											<p>
												<span class="price">$130.45</span>
												<del class="prev-price">180.50</del>
											</p>
										</div>
										<!-- Product Content End -->
									</div>
									<!-- Single Product End -->
									<!-- Single Product Start -->
									<div class="single-product single-product-sidebar">
										<!-- Product Image Start -->
										<div class="pro-img">
											<a href="product.html"> <img class="primary-img"
												src="img\products\2.jpg" alt="single-product"> <img
												class="secondary-img" src="img\products\1.jpg"
												alt="single-product">
											</a>
										</div>
										<!-- Product Image End -->
										<!-- Product Content Start -->
										<div class="pro-content">
											<h4>
												<a href="product.html">Silver Work Lamp Proin</a>
											</h4>
											<p>
												<span class="price">$320.45</span>
												<del class="prev-price">$400.50</del>
											</p>
										</div>
										<!-- Product Content End -->
									</div>
									<!-- Single Product End -->
									<!-- Single Product Start -->
									<div class="single-product single-product-sidebar">
										<!-- Product Image Start -->
										<div class="pro-img">
											<a href="product.html"> <img class="primary-img"
												src="img\products\3.jpg" alt="single-product"> <img
												class="secondary-img" src="img\products\4.jpg"
												alt="single-product">
											</a>
										</div>
										<!-- Product Image End -->
										<!-- Product Content Start -->
										<div class="pro-content">
											<h4>
												<a href="product.html">Proin Work Lamp Silver </a>
											</h4>
											<p>
												<span class="price">$150.45</span>
												<del class="prev-price">$200.50</del>
											</p>
										</div>
										<!-- Product Content End -->
									</div>
									<!-- Single Product End -->
									<!-- Single Product Start -->
									<div class="single-product single-product-sidebar">
										<!-- Product Image Start -->
										<div class="pro-img">
											<a href="product.html"> <img class="primary-img"
												src="img\products\25.jpg" alt="single-product"> <img
												class="secondary-img" src="img\products\26.jpg"
												alt="single-product">
											</a>
										</div>
										<!-- Product Image End -->
										<!-- Product Content Start -->
										<div class="pro-content">
											<h4>
												<a href="product.html">Work Lamp Silver Proin</a>
											</h4>
											<p>
												<span class="price">$320.45</span>
												<del class="prev-price">$400.50</del>
											</p>
										</div>
										<!-- Product Content End -->
									</div>
									<!-- Single Product End -->
								</div>
								<!-- Side Item End -->
								<!-- Side Item Start -->
								<div class="side-pro-item">
									<!-- Single Product Start -->
									<div class="single-product single-product-sidebar">
										<!-- Product Image Start -->
										<div class="pro-img">
											<a href="product.html"> <img class="primary-img"
												src="img\products\41.jpg" alt="single-product"> <img
												class="secondary-img" src="img\products\42.jpg"
												alt="single-product">
											</a>
										</div>
										<!-- Product Image End -->
										<!-- Product Content Start -->
										<div class="pro-content">
											<h4>
												<a href="product.html">Silver Work Lamp Proin</a>
											</h4>
											<p>
												<span class="price">$80.45</span>
												<del class="prev-price">$100.50</del>
											</p>
										</div>
										<!-- Product Content End -->
									</div>
									<!-- Single Product End -->
									<!-- Single Product Start -->
									<div class="single-product single-product-sidebar">
										<!-- Product Image Start -->
										<div class="pro-img">
											<a href="product.html"> <img class="primary-img"
												src="img\products\36.jpg" alt="single-product"> <img
												class="secondary-img" src="img\products\35.jpg"
												alt="single-product">
											</a>
										</div>
										<!-- Product Image End -->
										<!-- Product Content Start -->
										<div class="pro-content">
											<h4>
												<a href="product.html">Silver Work Lamp Proin</a>
											</h4>
											<p>
												<span class="price">$320.45</span>
												<del class="prev-price">$400.50</del>
											</p>
										</div>
										<!-- Product Content End -->
									</div>
									<!-- Single Product End -->
									<!-- Single Product Start -->
									<div class="single-product single-product-sidebar">
										<!-- Product Image Start -->
										<div class="pro-img">
											<a href="product.html"> <img class="primary-img"
												src="img\products\33.jpg" alt="single-product"> <img
												class="secondary-img" src="img\products\34.jpg"
												alt="single-product">
											</a>
										</div>
										<!-- Product Image End -->
										<!-- Product Content Start -->
										<div class="pro-content">
											<h4>
												<a href="product.html">Lamp Proin Work Silver </a>
											</h4>
											<p>
												<span class="price">$120.45</span>
												<del class="prev-price">130.50</del>
											</p>
										</div>
										<!-- Product Content End -->
									</div>
									<!-- Single Product End -->
									<!-- Single Product Start -->
									<div class="single-product single-product-sidebar">
										<!-- Product Image Start -->
										<div class="pro-img">
											<a href="product.html"> <img class="primary-img"
												src="img\products\31.jpg" alt="single-product"> <img
												class="secondary-img" src="img\products\32.jpg"
												alt="single-product">
											</a>
										</div>
										<!-- Product Image End -->
										<!-- Product Content Start -->
										<div class="pro-content">
											<h4>
												<a href="product.html">Work Lamp Silver Proin</a>
											</h4>
											<p>
												<span class="price">$140.45</span>
												<del class="prev-price">$150.50</del>
											</p>
										</div>
										<!-- Product Content End -->
									</div>
									<!-- Single Product End -->
								</div>
								<!-- Side Item End -->
								<!-- Side Item Start -->
								<div class="side-pro-item">
									<!-- Single Product Start -->
									<div class="single-product single-product-sidebar">
										<!-- Product Image Start -->
										<div class="pro-img">
											<a href="product.html"> <img class="primary-img"
												src="img\products\15.jpg" alt="single-product"> <img
												class="secondary-img" src="img\products\16.jpg"
												alt="single-product">
											</a>
										</div>
										<!-- Product Image End -->
										<!-- Product Content Start -->
										<div class="pro-content">
											<h4>
												<a href="product.html">Lamp Work Silver Proin</a>
											</h4>
											<p>
												<span class="price">$320.45</span>
												<del class="prev-price">$400.50</del>
											</p>
										</div>
										<!-- Product Content End -->
									</div>
									<!-- Single Product End -->
									<!-- Single Product Start -->
									<div class="single-product single-product-sidebar">
										<!-- Product Image Start -->
										<div class="pro-img">
											<a href="product.html"> <img class="primary-img"
												src="img\products\17.jpg" alt="single-product"> <img
												class="secondary-img" src="img\products\18.jpg"
												alt="single-product">
											</a>
											<div class="label-product l_sale">
												30<span class="symbol-percent">%</span>
											</div>
										</div>
										<!-- Product Image End -->
										<!-- Product Content Start -->
										<div class="pro-content">
											<h4>
												<a href="product.html">Silver Work Lamp Proin</a>
											</h4>
											<p>
												<span class="price">$320.45</span>
												<del class="prev-price">$400.50</del>
											</p>
										</div>
										<!-- Product Content End -->
									</div>
									<!-- Single Product End -->
									<!-- Single Product Start -->
									<div class="single-product single-product-sidebar">
										<!-- Product Image Start -->
										<div class="pro-img">
											<a href="product.html"> <img class="primary-img"
												src="img\products\23.jpg" alt="single-product"> <img
												class="secondary-img" src="img\products\24.jpg"
												alt="single-product">
											</a>
										</div>
										<!-- Product Image End -->
										<!-- Product Content Start -->
										<div class="pro-content">
											<h4>
												<a href="product.html">Proin Work Lamp Silver </a>
											</h4>
											<p>
												<span class="price">$320.45</span>
												<del class="prev-price">$400.50</del>
											</p>
										</div>
										<!-- Product Content End -->
									</div>
									<!-- Single Product End -->
									<!-- Single Product Start -->
									<div class="single-product single-product-sidebar">
										<!-- Product Image Start -->
										<div class="pro-img">
											<a href="product.html"> <img class="primary-img"
												src="img\products\25.jpg" alt="single-product"> <img
												class="secondary-img" src="img\products\26.jpg"
												alt="single-product">
											</a>
										</div>
										<!-- Product Image End -->
										<!-- Product Content Start -->
										<div class="pro-content">
											<h4>
												<a href="product.html">Work Lamp Silver Proin</a>
											</h4>
											<p>
												<span class="price">$320.45</span>
												<del class="prev-price">$400.50</del>
											</p>
										</div>
										<!-- Product Content End -->
									</div>
									<!-- Single Product End -->
								</div>
								<!-- Side Item End -->
							</div>
						</div>
						<!-- Product Top End -->
						<!-- Single Banner Start -->
						<div class="col-img">
							<a href="shop.html"><img src="img\banner\banner-sidebar.jpg"
								alt="slider-banner"></a>
						</div>
						<!-- Single Banner End -->
					</div>
				</div>
				<!-- Sidebar Shopping Option End -->
				<!-- Product Categorie List Start -->
				<div class="col-lg-9 order-1 order-lg-2">
					<!-- Grid & List View Start -->
					<div
						class="grid-list-top border-default universal-padding d-md-flex justify-content-md-between align-items-center mb-30">
						<div class="grid-list-view  mb-sm-15">
							<ul class="nav tabs-area d-flex align-items-center">
								<li><a class="active" data-toggle="tab" href="#grid-view"><i
										class="fa fa-th"></i></a></li>
								<li><a data-toggle="tab" href="#list-view"><i
										class="fa fa-list-ul"></i></a></li>
							</ul>
						</div>
						<!-- Toolbar Short Area Start -->
						<div class="main-toolbar-sorter clearfix">
							<div class="toolbar-sorter d-flex align-items-center">
								<label><fmt:message key="SapXepTheo" bundle="${lang}"/></label> <select class="sorter wide">
									
									<option value="Product Name"><fmt:message key="SapXep.TenAZ" bundle="${lang}"/></option>
									<option value="Product Name"><fmt:message key="SapXep.TenZA" bundle="${lang}"/></option>
									<option value="Price"><fmt:message key="SapXep.ThapCao" bundle="${lang}"/></option>
									<option value="Price" selected=""><fmt:message key="SapXep.CaoThap" bundle="${lang}"/></option>
								</select>
							</div>
						</div>
						<!-- Toolbar Short Area End -->
						<!-- Toolbar Short Area Start -->
						<div class="main-toolbar-sorter clearfix">
							<div class="toolbar-sorter d-flex align-items-center">
								<label><fmt:message key="HienThi" bundle="${lang}"/>:</label> <select class="sorter wide">
									<option value="3">3</option>
									<option value="6">6</option>
									<option value="9">9</option>
									<option value="12">12</option>
									
								</select>
							</div>
						</div>
						<!-- Toolbar Short Area End -->
					</div>
					<!-- Grid & List View End -->
					<div class="main-categorie mb-all-40">
						<!-- Grid & List Main Area End -->
						<div class="tab-content fix">
							<div id="grid-view" class="tab-pane fade show active">
								<div class="row">
									<c:forEach items="${listSachSearch}" var="sach">
										<div class="col-lg-4 col-md-4 col-sm-6 col-6">
											<div class="single-product">
												<!-- Product Image Start -->
												
												<div class="pro-img">
													<a
														href="${pageContext.request.contextPath}/ChiTietSach?masach=${sach.maSach}">
														<img class="primary-img"
														src="${url}img/products/${sach.anh}" alt="single-product">
														<img class="secondary-img" src="img\products\2.jpg"
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
															<a href="product.html">${sach.tenSach}</a>
														</h4>
														<p>
															<span class="price"><fmt:formatNumber value="${(sach.giaBan-(sach.giaBan*(sach.giamGia/100)))*heSo}" type="currency"/></span>
															<del class="prev-price"><fmt:formatNumber value="${sach.giaBan*heSo}" type="currency"/></del>
														</p>
														<div class="label-product l_sale">${sach.giamGia }<span
																class="symbol-percent">%</span>
														</div>
													</div>
													<div class="pro-actions">
														<div class="actions-primary">
															<a href="${pageContext.request.contextPath}/ThemGioHang?Add=${sach.maSach}" title="Add to Cart"> <fmt:message key="ThemGioHang" bundle="${lang}"/></a>
														</div>
														<div class="actions-secondary">
															<a href="#" title="Compare"><i
																class="lnr lnr-sync"></i> <span>Add To Compare</span></a> <a
																href="wishlist.html" title="WishList"><i
																class="lnr lnr-heart"></i> <span><fmt:message key="ThemYeuThich" bundle="${lang}"/></span></a>
														</div>
													</div>
												</div>
												<!-- Product Content End -->
											</div>
										</div>
									</c:forEach>
									<!-- Single Product End -->
									<!-- Single Product Start -->

								</div>
								<!-- Row End -->
							</div>
							<!-- #grid view End -->
							<div id="list-view" class="tab-pane fade">
								<!-- Single Product Start -->
								<c:forEach items="${listSachTheoChuDe}" var="sach">
									<div class="single-product">
										<div class="row">
											<!-- Product Image Start -->
											<div class="col-lg-4 col-md-5 col-sm-12">
												<div class="pro-img">
													<a href="product.html"> <img class="primary-img"
														src="${url}img/products/${sach.anh}" alt="single-product">
														<img class="secondary-img" src="img\products\24.jpg"
														alt="single-product">
													</a> <a href="#" class="quick_view" data-toggle="modal"
														data-target="#myModal" title="Quick View"><i
														class="lnr lnr-magnifier"></i></a> <span class="sticker-new">new</span>
												</div>
											</div>
											<!-- Product Image End -->
											<!-- Product Content Start -->
											<div class="col-lg-8 col-md-7 col-sm-12">
												<div class="pro-content hot-product2">
													<h4>
														<a href="product.html">${sach.tenSach}</a>
													</h4>
													<p>
														<span class="price">${sach.giaBan}</span>
													</p>
													<p>Faded short sleeves t-shirt with high neckline. Soft
														and stretchy material for a comfortable fit. Accessorize
														with a straw hat and you're ready for summer!Faded short
														sleeves t-shirt with high neckline. Soft and stretchy
														material.</p>
													<div class="pro-actions">
														<div class="actions-primary">
															<a href="cart.html" title=""
																data-original-title="Add to Cart"><fmt:message key="ThemGioHang" bundle="${lang}"/></a>
														</div>
														<div class="actions-secondary">
															<a href="compare.html" title=""
																data-original-title="Compare"><i
																class="lnr lnr-sync"></i> <span>Add To Compare</span></a> <a
																href="wishlist.html" title=""
																data-original-title="WishList"><i
																class="lnr lnr-heart"></i> <span><fmt:message key="ThemYeuThich" bundle="${lang}"/></span></a>
														</div>
													</div>
												</div>
											</div>
											<!-- Product Content End -->
										</div>
									</div>
									<!-- Single Product End -->
									<!-- Single Product Start -->
								</c:forEach>
							</div>
							<!-- #list view End -->
							<div class="pro-pagination">
								<ul class="blog-pagination">
								<c:forEach begin="1" end="${trangCuoi}" var="i">  
									<!-- <li class="active"><a href="#">1</a></li> -->
									<li class="${i==index?'active':''}"><a href="${pageContext.request.contextPath}/TimKiem?index=${i}&txtSearch=${txtSearch}&danhMucSearch=${danhMucSearch}" >${i}</a></li>
									
									<!-- <li><a href="#"><i class="fa fa-angle-right"></i></a></li> -->
								</c:forEach>
								</ul>
								<div class="product-pagination">
									<span class="grid-item-list"><fmt:message key="DangHienThi"
												bundle="${lang}" /> ${index}/${trangCuoi}</span>
								</div>
							</div>
							<!-- Product Pagination Info -->
						</div>
						<!-- Grid & List Main Area End -->
					</div>
				</div>
				<!-- product Categorie List End -->
			</div>
			<!-- Row End -->
		</div>
		<!-- Container End -->
	</div>
	<!-- Shop Page End -->
	<!-- Support Area Start Here -->


	<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>