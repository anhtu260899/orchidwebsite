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
				<sf:form modelAttribute="user" action="${base }/sign_up"
					method="post">

					<div style="margin-left: 50px; width: 90%">
						<c:if test="${ not empty TB}">
							<div class="alert alert-success" role="alert">${TB }</div>
						</c:if>
						<div class="card card-success">
							<div class="card-header">
								<h3 class="card-title">User</h3>
							</div>

							<div class="card-body">
								<div class="form-group">
									<label for="exampleInputEmail1">Nick name</label> <input
										type="text" class="form-control" id="userName" name="userName"
										path="userName" placeholder="Enter your nick name">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Your name</label> <input
										type="text" class="form-control" id="name" name="name"
										path="name" placeholder="Enter your name">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Phone Number</label> <input
										type="text" class="form-control" id="phone" name="phone"
										path="phone" placeholder="Enter your phone number">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Address</label> <input
										type="text" class="form-control" id="address" name="address"
										path="address" placeholder="Enter your adress">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Password</label> <input
										type="password" class="form-control" id="password"
										name="password" path="password" placeholder="Enter password">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Email</label> <input
										type="email" class="form-control" id="email" name="email"
										path="email" placeholder="Enter Email">
								</div>

							</div>
							<div class="card-footer">
								<button type="submit" class="btn btn-block btn-success btn-lg">Sign
									up</button>
							</div>
						</div>
					</div>
				</sf:form>
			</div>
		</div>
	</div>
	<!-- ========== FOOTER ========== -->
	<div class="footer">
		<jsp:include page="/WEB-INF/views/khachhang/layout/footer.jsp"></jsp:include>
	</div>
</body>
<jsp:include page="/WEB-INF/views/khachhang/layout/js.jsp"></jsp:include>
</html>