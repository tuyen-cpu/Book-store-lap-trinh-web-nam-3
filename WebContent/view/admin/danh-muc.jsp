<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  

  <!-- Start header section -->
  <jsp:include page = "./header/header.jsp" flush = "true" />
    <div class="content-wrapper">
      <div class="container-fluid">
        <!--End Row-->


        <div class="row">
          <div class="col-lg-12">
            <button class="add-catalog"><a href="${pageContext.request.contextPath}/admin/danhmuc/add">Thêm danh mục</a></button>
          </div>
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Danh sách danh mục</h5>
                <div class="table-responsive">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        
                        <th scope="col">Mã danh mục</th>
                        <th scope="col">Tên danh muc</th>
                        <th scope="col">#</th>
                        
                      </tr>
                    </thead>
                    <tbody>
                  <c:forEach items="${listDanhMuc}" var="danhmuc">
                      <tr>
                        <td scope="row">${danhmuc.maChuDe}</td>
                        <td>${danhmuc.tenChuDe}</td>
        				
        				 <td>
                         <button class="btn btn-danger"><a href="${pageContext.request.contextPath}/admin/danhmuc/delete?id=${danhmuc.maChuDe}">Xóa</a></button>
                         
                          <button class="btn btn-success"><a href="${pageContext.request.contextPath}/admin/danhmuc/edit?id=${danhmuc.maChuDe}">Sửa</a></button>
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
      </div>
    </div>
 
    <jsp:include page = "./footer/footer.jsp" flush = "true" />