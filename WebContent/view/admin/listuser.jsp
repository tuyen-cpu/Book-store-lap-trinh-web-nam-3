<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!-- Start header section -->
  <jsp:include page = "./header/header.jsp" flush = "true" />
    <div class="content-wrapper">
      <div class="container-fluid">

        <div class="row mt-3">
          <!--<div class="col-lg-12">
            <button class="add-catalog"><a href="${pageContext.request.contextPath}/admin/user/add">Thêm User</a></button>
          </div>  -->
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Danh sách User</h5>
                <div class="table-responsive">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th scope="col">UserName</th>
                        <th scope="col">Mật Khẩu</th>
                        <th scope="col">Quyền</th>
                        <th scope="col">Trạng thái</th>
                       
             
                      </tr>
                    </thead>
                    <tbody>
                  <c:forEach items="${dsUser}" var="user">
                 
                      <tr>
                        <td scope="row">${user.userName}</td>
                        <td>${user.matKhau}</td>
        				<td>${user.quyen}</td>
        				<c:if test="${user.trangThai eq true}">
        				<td>Bình thường</td>
        				</c:if>
        				<c:if test="${user.trangThai eq false}">
        				<td>Khóa</td>
        				</c:if>
        				 <td>
                          <button class="btn btn-danger"><a href="${pageContext.request.contextPath}/admin/deleteUser?maKH=${user.userName}">Xóa</a></button>
                         
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