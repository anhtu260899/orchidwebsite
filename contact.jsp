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
				<sf:form modelAttribute="contact" action="${base }/contact"
					method="post">

					<div style="margin-left: 50px; width: 90%">
						<c:if test="${ not empty TB}">
							<div class="alert alert-success" role="alert">${TB }</div>
						</c:if>
						<div class="card card-success">
							<div class="card-header">
								<h3 class="card-title">Contact</h3>
							</div>

							<div class="card-body">
								<div class="form-group">
									<label for="exampleInputEmail1">First Name</label> <input
										type="text" class="form-control" id="name" name="firstName"
										path="firstName" placeholder="Enter FirstName">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Last Name</label> <input
										type="text" class="form-control" id="name" name="lastName"
										path="lastName" placeholder="Enter LastName">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Email</label> <input
										type="email" class="form-control" id="email" name="email"
										path="email" placeholder="Enter Email">
								</div>

								<div class="form-group">
									<label for="exampleInputEmail1">Message</label>
									<textarea class="form-control" id="name" name="message"
										path="message" placeholder="Enter Message" rows="3"></textarea>
								</div>

							</div>
							<div class="card-footer">
								<button type="submit" class="btn btn-block btn-success btn-lg">Contact</button>
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