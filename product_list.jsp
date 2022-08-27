<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin | WonderOrchid</title>
<!-- ========== CSS ========== -->
<jsp:include page="/WEB-INF/views/quantrivien/layout/css.jsp"></jsp:include>

<!-- ========== import SPRING-FORM ========== -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- ========== Import JSTL ========== -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</head>
<body class="hold-transition sidebar-mini">
	<jsp:include page="/WEB-INF/views/common/valiable.jsp"></jsp:include>
	<div class="wrapper">
		<!-- ========== Navbar ========== -->
		<jsp:include page="/WEB-INF/views/quantrivien/layout/navbar.jsp"></jsp:include>
		<!-- /.navbar -->

		<!-- ========== Main Sidebar Container ========== -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<jsp:include page="/WEB-INF/views/quantrivien/layout/logo.jsp"></jsp:include>
			<!-- Sidebar -->
			<jsp:include page="/WEB-INF/views/quantrivien/layout/newsidebar.jsp"></jsp:include>
			<!-- /.sidebar -->
		</aside>

		<!-- ========== Content Wrapper. Contains page content ========== -->
		<div class="content-wrapper">
			<!-- ========== Content Header (Page header) ========== -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">Product list</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="/admin">Home</a></li>
								<li class="breadcrumb-item active">Product list</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- ========== Main content ========== -->
			<div class="content">
				<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" style="">
					<!-- general form elements -->
					<div class="card card-secondary" style="margin-left: 30px;">

						<div class="card-header">
							<h3 class="card-title">Product List</h3>

						</div>

						<!-- form start -->
						<form class="form-inline" action="${base }/admin_product_list"
							method="get">
							<div class="d-flex flex-row justify-content-between mt-2 mb-2">
								<!-- ========== SEARCH ========== -->
								<div class="d-flex flex-row ml-1">
									<input type="hidden" id="page" name="page" class="form-control">
									<input type="text" id="keyword" name="keyword"
										class="form-control" placeholder="Search"
										value="${searchModel.keyword }" style="margin-right: 5px;">
									<select class="form-control" name="categoryId" id="categoryId"
										style="margin-right: 5px;">
										<option value="0">Tất cả</option>
										<c:forEach items="${categories}" var="category">
											<option value="${category.id }">${category.name }</option>
										</c:forEach>
									</select>
									<button type="submit" id="btnSearch" name="btnSearch"
										value="Search"
										class="form-control btn btn-block btn-secondary">Search</button>
									<div class="" style="">
										<a class=" btn btn-block btn-secondary ml-1"
											href="${base }/admin_product" role="button">Add New</a>
									</div>
								</div>
							</div>
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">Stt</th>
										<th scope="col">Avatar</th>
										<th scope="col">Title</th>
										<th scope="col">Category</th>
										<th scope="col">Price</th>
										<th scope="col">Status</th>
										<th scope="col">Action</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${productsWithPaging.data}" var="product"
										varStatus="loop">
										<tr>
											<th scope="row">${loop.index + 1}</th>

											<td><img src="${base }/upload/${product.avatar}"
												width="75" height="80"></td>

											<td><i class="fas fa-barcode mr-2"></i>${product.title }</td>

											<td>${product.categories.name}</td>

											<td><fmt:formatNumber type="number"
													maxFractionDigits="3" value="${product.price }" /> VNĐ</td>

											<td><span style="font-size: 15px"
												id="status_${product.id }"> <c:choose>
														<c:when test="${product.status }">
															<input type="checkbox" checked="checked"
																readonly="readonly">
														</c:when>
														<c:otherwise>
															<input type="checkbox" readonly="readonly">
														</c:otherwise>
													</c:choose>
											</span>
												<button class="btn bg-gradient-success mr-1"
													style="padding: 3px 6px 3px 6px; font-size: 12px"
													type="button"
													onclick="activeStatusPro('${base }', ${product.id })">on</button>

												<button class="btn btn-danger mr-1"
													style="padding: 3px 6px 3px 6px; font-size: 12px"
													type="button"
													onclick="inActiveStatusPro('${base }', ${product.id })">off</button></td>

											<!-- Edit -->
											<td>
												<div>
													<a class="btn bg-gradient-success"
														href="${base }/admin_product_${product.id}" role="button"><i
														class="fas fa-edit"></i></a>
													<!-- Delete -->
													<button class="btn btn-danger" role="button" type="button"
														onclick="deletePro('${base }', ${product.id })">
														<i class="far fa-trash-alt"></i>
													</button>
													<span id="statusDelete_${product.id }"></span>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="row ml-1">
								<div class="col-12 d-flex justify-content-center">
									<div id="paging"></div>
								</div>
							</div>
						</form>
					</div>
					<!-- /.card -->
				</div>
				<!-- ========== </Main content> ========== -->
			</div>
		</div>

		<!-- ========== Control Sidebar ========== -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>

		<!-- ========== Main Footer ========== -->
		<jsp:include page="/WEB-INF/views/quantrivien/layout/footer.jsp"></jsp:include>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->
	<jsp:include page="/WEB-INF/views/quantrivien/layout/js.jsp"></jsp:include>
	<script type="text/javascript">
			$( document ).ready(function() {
				
				$("#paging").pagination({
					currentPage: ${productsWithPaging.currentPage},
			        items: ${productsWithPaging.totalItems},
			        itemsOnPage: 8,
			        cssStyle: 'dark-theme',
			        onPageClick: function(pageNumber, event) {
			        	$('#page').val(pageNumber);
			        	$('#btnSearch').trigger('click');
					},
			    });
			});
	</script>
</body>
</html>
