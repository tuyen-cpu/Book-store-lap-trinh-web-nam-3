<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!-- Start header section -->
  <jsp:include page = "./header/header.jsp" flush = "true" />

    <div class="content-wrapper">
      <div class="container-fluid">
        <div class="row mt-3">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <div class="card-title">Thêm sản phẩm</div>
                <hr>
                <form method="post" action="${pageContext.request.contextPath}/admin/sach/actionAdd" enctype="multipart/form-data">
                
               
                  <div class="form-group">
                    <label for="input-1">Tên sản phẩm</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Tên sách" name="ten-sach" required="required">
                  </div>
                  
        
                  <div class="form-group">
	                  <label for="input-2">Chủ đề</label>
	                  <div>
	                    <select class="form-control valid" id="input-6" name="chu-de" aria-invalid="false">
	                    <c:forEach items="${dsChuDe}" var="chuDe">
	                        <option value="${chuDe.maChuDe}">${chuDe.tenChuDe}</option>
	                    </c:forEach>
	                    </select>
	                  </div>
	                </div>
	               <%--  <div class="form-group">
	                  <label for="input-2">NXB</label>
	                  <div>
	                    <select class="form-control valid" id="input-6" name="nxb" aria-invalid="false">
	                    <c:forEach items="${catelist}" var="cate">
	                        <option value="${cate.id }">${cate.name }</option>
	                    </c:forEach>
	                    </select>
	                  </div>
	                </div> --%>
	                 <div class="form-group">
                    <label for="input-1">Ngày</label> 
                    <input type="date" class="form-control" id="the-date" placeholder="Ngày đăng" name="ngay-dang">
                  </div>
	                <div class="form-group">
                    <label for="input-1">Giá</label>
                    <input type="number" class="form-control" id="input-1" placeholder="Giá" name="gia-ban" required="required">
                  </div>
                   
	                <div class="form-group">
                    <label for="input-1">Số lượng</label>
                    <input type="number" class="form-control" id="input-1" placeholder="Số lượng" name="so-luong" required="required">
                  </div>
                    <div class="form-group">
	                  <label for="input-2">Trạng thái</label>
	                  <div>
	                    <select class="form-control valid" id="input-6" name="trang-thai" required aria-invalid="false">
	                        <option value="true">Còn hàng</option>
	                        <option value="false">Hết hàng</option>
	                    </select>
	                  </div>
	                </div>
	                 <div class="form-group">
		                <label for="input-2">Giảm giá</label>
		                <div class="input-group">
		                <input type="number" class="form-control" placeholder="Giảm ... %" name="giam-gia" required="required">
		                <div class="input-group-append">
		                <button class="btn btn-light" type="button">%</button>
		                </div>
		                </div>
	              </div>
                 <div class="form-group">
                  <label for="input-2" class="col-form-label">Mô tả</label>
                  <div>
                    <textarea class="form-control" rows="4" id="input-17" name="mo-ta" required="required"></textarea>
                  </div>
                </div>
                
                
                
                 <div class="form-group">
                    <label for="input-1">Ảnh đại diện</label>
                    <input type="file" class="form-control" id="input-1" name="file" size="60">
                 
                  </div>
               <div class="form-footer">
               
                    <button class="btn btn-danger"><i class="fa fa-times"></i><a href="${pageContext.request.contextPath}/admin/sach">Hủy</a></button>
                 <button type="submit" class="btn btn-success"><i class="fa fa-check-square-o"> Thêm</i></button> 
                 <div>${loiAdd}</div>
                   <%--  <button type="submit" class="btn btn-success"><i class="fa fa-check-square-o"><a href="${pageContext.request.contextPath}/admin/sach/actionAdd"> Thêm</a></i></button>  --%>
                </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="overlay toggle-menu"></div>
      </div>
    </div>
<script>
		var date = new Date();
		
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		
		if (month < 10) month = "0" + month;
		if (day < 10) day = "0" + day;
		
		var today = year + "-" + month + "-" + day;
		
		
		document.getElementById('the-date').value = today;
</script>
    <jsp:include page = "./footer/footer.jsp" flush = "true" />