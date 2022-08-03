<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <!-- Start header section -->
  <jsp:include page = "./header/header.jsp" flush = "true" />
    <div class="content-wrapper">
      <div class="container-fluid">

        <div class="row mt-3">
          <div class="col-lg-8">
            <div class="card">
              <div class="card-body">
                <div class="card-title">Thêm danh mục</div>
                <hr>
                <form action="${pageContext.request.contextPath}/admin/danhmuc/add" method="post">
                
                  <div class="form-group">
                    <label for="input-1">Mã danh mục</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Mã danh mục" name="ma-danh-muc" required="required"> 
                  </div>
	               <div class="form-group">
	                  <label for="input-2">Tên danh mục</label>
	                  <input type="text" class="form-control" id="input-2" placeholder="Tên danh mục" name="ten-danh-muc" required="required">
	                </div>
                 <div class="form-footer">
                    <button type="submit" class="btn btn-danger"><i class="fa fa-times"></i> Hủy</button>
                    <button type="submit" class="btn btn-success"><i class="fa fa-check-square-o"></i> Thêm</button>
                </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="overlay toggle-menu"></div>
      </div>
    </div>
  
    <jsp:include page = "./footer/footer.jsp" flush = "true" />