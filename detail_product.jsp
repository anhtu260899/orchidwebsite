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
<jsp:include page="/WEB-INF/views/quantrivien/layout/css.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/khachhang/layout/0css2.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/khachhang/layout/0css.jsp"></jsp:include>

<%-- <link rel="stylesheet" type="text/css"
	href="${base}/css/product_detail.css"> --%>
</head>

<!-- ========== import SPRING-FORM ========== -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

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
					<form action="${base }/ajax_addToCart" method="post">
						<div class="container mt-0 mb-3">
							<div class="row d-flex justify-content-center">
								<div class="card"
									style="border-bottom: 0px; border-right: 0px; border-left: 0px; border-top: 0px;">
									<div class="row">
										<div class="col-md-6">
											<div class="images p-3">
												<div class="text-center p-4">
													<img id="main-image"
														src="${base }/upload/${product.avatar}" width="350px"
														height="466px">
												</div>

												<!-- ========== Ảnh sản phẩm ========== -->

												<div class="thumbnail text-center">
													<img onclick="change_image(this)"
														src="${base }/upload/${product.avatar}" width="70">
													<c:forEach items="${productimg.data }" var="proimg">
														<img style="height: 93px; width: 70px"
															onclick="change_image(this)"
															src="${base }/upload/${proimg.path }" width="70">
													</c:forEach>
												</div>

												<%-- <c:forEach items="${img.product. }" var="category">
													<option value="${category.id }">${category.name }</option>
												</c:forEach> --%>
											</div>
										</div>
										<div class="col-md-6">
											<div class="product p-4">
												<div
													class="d-flex justify-content-between align-items-center">
													<div class="d-flex align-items-center">
														<a style="color: black;" type="button"
															href="${base }/product"><i
															class="fa fa-long-arrow-left"></i></a> <span class="ml-1">Quay
															lại</span>
													</div>
													<a type="button" href="${base }/cart_view"><i
														class="fa fa-shopping-cart text-muted"></i></a>
												</div>
												<div class="mt-4 ">
													<!-- <span class="text-uppercase text-muted brand">Hàm
															anh các </span> -->
													<div class="mb-3">
														<h4 class="text-uppercase">${product.title }</h4>
													</div>
													<div class="price d-flex flex-row align-items-center">
														<p>
															<b>Giá: </b>

															<fmt:formatNumber type="number" maxFractionDigits="3"
																value="${product.price }" />
															VNĐ/ giả hành.
														</p>
													</div>
													<div>
														<p>
															<b>Trạng thái: </b>
															<c:choose>
																<c:when test="${product.status == true}">Còn hàng.</c:when>
																<c:otherwise>Hết hàng.</c:otherwise>
															</c:choose>
														</p>
													</div>
													<div style="">
														<p class="about">
															<b>Mô tả: </b>${product.shortDes }
														</p>
													</div>
													<h6 class="text-uppercase ">Số lượng:</h6>
													<div class="d-flex"
														style="align-items: center; align-self: center;">

														<div class="buttons_added" style="">
															<button style="color: black;"
																class="minus is-form btn btn-default" type="button">-</button>
															<input aria-label="quantity" class="input-qty" max="10"
																min="1" name="" type="number" value="1">
															<button style="color: black;"
																class="plus is-form btn btn-default" type="button">+</button>
														</div>

														<div class="ml-2 d-flex" style="">
															<p style="margin: auto;">giả hành.</p>
														</div>
													</div>
												</div>

												<c:choose>
													<c:when test="${product.status == true}">
														<div class="cart mt-4 align-items-center">
															<button type="button"
																onclick="javascript:AddToCart('${base }', ${product.id}, $('input.input-qty').val())"
																class="btn btn-success text-uppercase mr-2 px-4">Thêm
																vào giỏ hàng</button>
															<i class="fa fa-heart text-muted"></i> <i
																class="fa fa-share-alt text-muted"></i>
														</div>
													</c:when>
													<c:otherwise>
														<div class="cart mt-4 align-items-center">
															<a type="button" href="${base }/product"
																class="btn btn-success text-uppercase mr-2 px-4">Danh
																sách sản phẩm </a> <i class="fa fa-heart text-muted"></i> <i
																class="fa fa-share-alt text-muted"></i>
														</div>
													</c:otherwise>
												</c:choose>



											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</form>

					<form action="">
						<div class="container mt-0 mb-3">
							<div class="row d-flex justify-content-center">
								<div class="card"
									style="border-bottom: 0px; border-right: 0px; border-left: 0px; border-top: 0px;">
									<div class="row">

										<div class="product p-4">
											<h3>${product.title }</h3>
										</div>

										<div class="mb-3">
											<h5>Thông tin sản phẩm:</h5>
											${product.details }
										</div>


									</div>
								</div>
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
<script>
	$('input.input-qty')
			.each(
					function() {
						var $this = $(this), qty = $this.parent().find(
								'.is-form'), min = Number($this.attr('min')), max = Number($this
								.attr('max'))
						var status = true
						if (min == 0 & status == true) {
							var d = 0
						} else
							d = min
						$(qty).on('click', function() {
							if ($(this).hasClass('minus')) {
								if (d > min)
									d += -1
							} else if ($(this).hasClass('plus')) {
								var x = Number($this.val()) + 1
								if (x <= max)
									d += 1
							}
							$this.attr('value', d).val(d)
						})
					})
</script>
</html>