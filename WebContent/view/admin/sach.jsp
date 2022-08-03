<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!-- Start header section -->
  <jsp:include page = "./header/header.jsp" flush = "true" />
    <div class="content-wrapper">
      <div class="container-fluid">

        <div class="row mt-3">
          <div class="col-lg-12">
            <button class="add-catalog"><a href="${pageContext.request.contextPath}/admin/sach/add">Thêm sách</a></button>
          </div>
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Danh sách sản phẩm</h5>
                <div class="table-responsive">
                  <table class="table table-striped">
                    <thead>
                      <tr><th scope="col">STT</th>
                        <th scope="col">#</th>
                        <th scope="col">Tên sản phẩm</th>
                        <th scope="col">Hình ảnh</th>
                        <th scope="col">Giá</th>
                       
                        <th scope="col">ID danh mục</th>
                        <th scope="col">ID NXB</th>
                        <th scope="col">Số lượng</th>
                        <th scope="col">Giảm giá</th>
                        <th scope="col">Trạng Thái</th>
                        <th scope="col">Hành động</th>
                      </tr>
                    </thead>
                    <tbody>
                     <c:forEach items="${dsSach}" var="sach" varStatus="i">
                      <tr>
                       <th scope="row">${i.count}</th>
                        <th scope="row">${sach.maSach}</th>
                        <td>${sach.tenSach}</td>
                        <td><img style="    width: 50px;height: 80px; object-fit: cover;border: 1px solid #fff;" src="${pageContext.request.contextPath}/view/client/img/products/${sach.anh}" alt="${sach.tenSach}"></td>
                          <td>${sach.giaBan}</td>
                        
                        <td>${sach.maChuDe}</td>
                        <td>${sach.maNXB}</td>
                        <td>${sach.soLuong}</td>
                        <td>${sach.giamGia}%</td>
                        <td>
                        
                        <c:choose>
	                        <c:when test="${sach.trangThai eq true}"> 
	                        	<c:out value="Còn hàng"/>
	                       	</c:when>
	                       	<c:otherwise>
						        <c:out value="Hết hàng"/>
						    </c:otherwise>
                       	</c:choose>
                        </td>
                        <td>
                            <button class="btn btn-danger"><a href="#">Xóa</a></button>
                         
                          <button class="btn btn-success"><a href="#">Sửa</a></button>
                        </td>
                      </tr>
                      </c:forEach>
                     
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="overlay toggle-menu"></div>
      </div>
    </div>

  
    <jsp:include page = "./footer/footer.jsp" flush = "true" />