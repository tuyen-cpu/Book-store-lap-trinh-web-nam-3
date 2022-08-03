<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
  <!-- Start header section -->
  <jsp:include page = "./header/header.jsp" flush = "true" />
    <div class="content-wrapper">
      <div class="container-fluid">
        <!--End Row-->


        <div class="row">
 
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Chi tiết đơn hàng</h5>
                <div class="table-responsive">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                      
                       <th scope="col">Mã ctdh</th>
                        <th scope="col">Mã sách</th>
                        <th scope="col">Số lượng</th>
                        <th scope="col">Đơn giá</th>
                       
                      </tr>
                    </thead>
                    <tbody>
                  <c:forEach items="${listCTDH}" var="ctdh">
                      <tr>
                        <td scope="row">${ctdh.maDonHang}</td>
                         <td>${ctdh.maSach}</td>
                        <td>${ctdh.soLuong}</td>
                       
                         <td><fmt:formatNumber value="${ctdh.donGia*heSo}" type="currency"/></td>
                          
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