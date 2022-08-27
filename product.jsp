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
							<h1 class="m-0">Product</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="/admin">Home</a></li>
								<li class="breadcrumb-item active">Add Product</li>
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
							<h3 class="card-title">Add product</h3>
						</div>
						<!-- form start -->
						<sf:form modelAttribute="product" action="${base }/admin_product"
							method="post" enctype="multipart/form-data">
							<sf:hidden path="id" />
							<div class="card-body" style="">
							
								<div class="form-group mb-2">
									<label for="category">Category (required)</label>
									<sf:select path="categories.id" class="form-control"
										id="categories">
										<sf:options items="${categories }" itemValue="id"
											itemLabel="name" />
									</sf:select>
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Product name</label> <input
										value="${product.title }" type="text"
										class="form-control form-controlll" path="title" id="title"
										name="title" field-name="Product name"
										placeholder="Enter product's name">
								</div>

								<div class="form-group">
									<label for="exampleInputPassword1">Price</label> <input
										value="${product.price }" type="number" path="price" min="0"
										class="form-control form-controlll" id="price" name="price"
										placeholder="Enter product's price" field-name="Price">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Status</label> <input
										type="number" min="0" max="1" path="status"
										class="form-control" id="status" name="status" value="1"
										placeholder="Enter product's status/ Choose 1: active status/ Choose 0: inactive status.">
								</div>

								<div class="form-group ">
									<label for="exampleInputEmail1">Short description</label> <input
										value="${product.shortDes }" type="text"
										class="form-control form-controlll" path="shortDes"
										id="shortDes" name="shortDes" field-name="Short description"
										placeholder="Enter short description">
								</div>

								<div class="form-group mb-2">
									<label for="detail_description">Detailed description</label>
									<sf:textarea autocomplete="off" path="details"
										class="form-control form-controlll summernote"
										id="detail_description" rows="3" required="required"
										field-name="Detailed description" value="${product.details }"></sf:textarea>
								</div>

								<div class="form-group mb-2">
									<label for="fileProductAvatar">Avatar</label> <input
										value="${product.avatar }" id="fileProductAvatar"
										name="productAvatar" type="file" class="form-control" style="">
								</div>

								<div id="pic" class="form-group d-flex">
									<div id="picc" class="d-flex mt-3 mr-2">
										<div class="form-group mb-2">
											<label id="label" for="fileProductPictures">MultiPicture</label>
											<input id="fileProductPictures" name="productPictures"
												type="file" class="form-control" multiple="multiple">
										</div>
									</div>
								</div>
								<button class="btn btn-secondary" type="button"
									onclick="add_child()">Add picture</button>


								<div class="mt-5">
									<a href="${base }/admin_product_list" class="btn btn-secondary"
										role="button" aria-pressed="true">Back to list</a>

									<button type="button" id="btn_check"
										class="btn btn-success btn_control">Check product</button>
								</div>

							</div>
							<!-- /.card-body -->
						</sf:form>
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
	<script src="js/summernote-bs4.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#detail_description').summernote();
		});
	</script>

	<!-- DOM JAVASCRIPT -->
	<!-- https://xuanthulab.net/tao-moi-them-xoa-phan-tu-dom-javascript.html -->
	<script type="text/javascript">
		function add_child() {
			/* nhân bản thẻ div */
			var div = document.getElementById("pic");
			var divv = document.getElementById("picc");
			var coppy = divv.cloneNode(true);
			div.appendChild(coppy);
		}
	</script>

	<!-- ========== CHECK FORM ========== -->

</body>
<!-- ========== CHECK VALUE ========== -->
<script src="${base }/js/checkProduct.js"></script>
<script type="text/javascript" src="${base }/js/jquery.min.js"></script>
</html>
