<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!-- Start header section -->
  <jsp:include page = "./header/header.jsp" flush = "true" />
    <div class="content-wrapper">
      <div class="container-fluid">
        <!--End Row-->


        <div class="row">
 
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Danh sách đơn hàng</h5>
                <div class="table-responsive">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                   
                       <th scope="col">Mã đơn hàng</th>
                        <th scope="col">Đã thanh toán</th>
                        <th scope="col">Tình trạng đơn hàng</th>
                        <th scope="col">Ngày đặt</th>
                         <th scope="col">Ngày giao</th>
                         <th scope="col">Mã khach hàng</th>
                           <th scope="col">Hành động</th>
                        
                      </tr>
                    </thead>
                    <tbody>
                  <c:forEach items="${listDH}" var="dh">
                      <tr>
                        <td scope="row">${dh.maDonHang}</td>
                         <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>${dh.maKH}</td>
      
        				 <td>
                         <button class="btn btn-danger"><a href="${pageContext.request.contextPath}/admin/order/delete?id=${order.id}">Xóa</a></button>
                         
                          <button class="btn btn-success"><a href="${pageContext.request.contextPath}/admin/order/edit?id=${order.id}">Sửa</a></button>
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