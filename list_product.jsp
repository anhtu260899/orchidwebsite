<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wonder Orchid</title>
<jsp:include page="/WEB-INF/views/khachhang/layout/0css3.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/khachhang/layout/0css2.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/khachhang/layout/0css.jsp"></jsp:include>

</head>

<!-- ========== import SPRING-FORM ========== -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- ========== Import JSTL ========== -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
	<jsp:include page="/WEB-INF/views/common/valiable.jsp"></jsp:include>
	<div class="container">
		<!-- ========== BANNER ========== -->
		<div>
			<jsp:include page="/WEB-INF/views/khachhang/layout/1banner.jsp"></jsp:include>
		</div>

		<!-- ========== THANH TIEU DE NGANG ========== -->
		<div class="horizontal-list">
			<jsp:include page="/WEB-INF/views/khachhang/layout/menu_ngang.jsp"></jsp:include>
		</div>

		<!-- ========== BODY ========== -->
		<div class="row">
			<!-- ========== LEFT MENU_DOC ========== -->
			<div class="col-md-3">
				<jsp:include page="/WEB-INF/views/khachhang/layout/menu_doc.jsp"></jsp:include>
			</div>

			<!-- ========== RIGHT ========== -->
			<div class="col-9">
				<div class="row">
					<form class="form-inline" action="${base }/product" method="get">
						<!-- size xl sẽ chiếm 12/3, size lg chiếm 12/4 -->
						<section class="content mb-5">
							<div class="container-fluid">

								<div class="row">
									<h4 class="text-center display-6 mb-3" style="font-weight: 400">Danh
										sách sản phẩm</h4>
									<div class="col-md-8 offset-md-2">
										<!-- ========== SEARCH FORM ========== -->
										<form>
											<div class="input-group">
												<input type="search" class="form-control form-control-lg"
													placeholder="Type your keywords here"> <input
													type="hidden" id="page" name="page" class="form-control">
												<div class="col-2 mr-3">
													<select class="form-control text-left" name="categoryId"
														id="categoryId" style="height: 48px; width: 100px">
														<option value="0">Tất cả</option>
														<c:forEach items="${categories}" var="category">
															<option value="${category.id }">${category.name }</option>
														</c:forEach>
													</select>
												</div>

												<div class="input-group-append ">
													<button type="submit" id="btnSearch" name="btnSearch"
														value="Search" class="btn btn-lg btn-default">
														<i class="fa fa-search"></i>
													</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</section>
						<c:forEach items="${productsWithPaging.data }" var="product">
							<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
								<div class="card card-sp">
									<div class="img-sp">
										<img style="width: 184px; height: 240px"
											src="${base }/upload/${product.avatar }" class="card-img-top"
											alt="card image cap">
									</div>
									<div class="card-body cardBody">
										<p class="mb-3" style="font-weight: 500; font-size: 20px">${product.title }</p>
										<div class="d-flex " style="height: 30px">
											<p class="card-text mr-1 mb-0" style="font-weight: 500;">Phân
												loài:</p>
											<p>${product.categories.name }</p>
										</div>
										<div>
											<p class="card-text mr-1 mb-0" style="font-weight: 500;">Mô
												tả:</p>
											<p class="card-text"
												style="width: 100%; -webkit-line-clamp: 8; height: 200px; overflow: hidden; white-space: pre-wrap; text-overflow: ellipsis;">${product.shortDes }</p>
										</div>

										<a href="${base }/product_detail_${product.seo}">Xem sản
											phẩm</a>
									</div>
								</div>
							</div>
						</c:forEach>
						<div class="row ml-1">
							<div class="col-12 d-flex justify-content-center">
								<div id="paging"></div>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- ========== FOOTER ========== -->
	<div class="footer">
		<jsp:include page="/WEB-INF/views/khachhang/layout/footer.jsp"></jsp:include>
	</div>
</body>
<jsp:include page="/WEB-INF/views/khachhang/layout/js.jsp"></jsp:include>
<script type="text/javascript">
			$( document ).ready(function() {
				$("#paging").pagination({
					currentPage: ${productsWithPaging.currentPage},
			        items: ${productsWithPaging.totalItems},
			        itemsOnPage: 12,
			        cssStyle: 'dark-theme',
			        onPageClick: function(pageNumber, event) {
			        	$('#page').val(pageNumber);
			        	$('#btnSearch').trigger('click');
					},
			    });
			});
	</script>
</html>