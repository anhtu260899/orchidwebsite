<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wonder Orchid</title>

<jsp:include page="/WEB-INF/views/khachhang/layout/0css.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/common/valiable.jsp"></jsp:include>

</head>
<body>
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
				<!-- ========== BODY1 ========== -->
				<jsp:include page="/WEB-INF/views/khachhang/layout/body1_.jsp"></jsp:include>

				<!-- ========== BODY2 ========== -->
				<jsp:include
					page="/WEB-INF/views/khachhang/layout/body2_trienLam.jsp"></jsp:include>

				<!-- ========== BODY3 ========== -->
				<jsp:include
					page="/WEB-INF/views/khachhang/layout/body3_sanPham.jsp"></jsp:include>
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