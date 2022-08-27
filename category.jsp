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
							<h1 class="m-0">Category</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="/admin">Home</a></li>
								<li class="breadcrumb-item active">Add Category</li>
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
							<h3 class="card-title">Add category</h3>
						</div>
						<%-- <c:if test="${ not empty TB}">
						<div class="alert alert-light" style="background-color: #21252"
							role="alert">${TB }</div>
					</c:if> --%>


						<!-- form start -->
						<sf:form modelAttribute="category"
							action="${base }/admin_category" method="post"
							enctype="multipart/form-data">
							<!-- <div class="alert alert-light" role="alert" id="TB_AJAX"></div> -->
							<sf:hidden path="id" />
							<div class="card-body" style="">

								<div class="form-group">
									<label for="exampleInputEmail1">Category Name</label> <input
										value="${category.name }" type="text" class="form-control"
										path="name" id="name" name="name"
										placeholder="Enter category name">
								</div>

								<div class="form-group">
									<label for="exampleInputPassword1">Description</label> <input
										value="${category.description }" type="text"
										path="description" class="form-control" id="description"
										name="description" placeholder="Enter description">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Status</label> <input
										type="number" min="0" max="1" path="status"
										class="form-control" id="status" name="status" value="1"
										placeholder="Enter status/ Choose 1: active status/ Choose 0: inactive status.">
								</div>
								<a href="/admin_category_list" class="btn btn-secondary"
									role="button" aria-pressed="true">Back to list</a>
								<button type="submit" class="btn btn-success">Save
									Category</button> 
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
</body>
</html>
