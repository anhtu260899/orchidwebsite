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
				<form action="${base }/cart_checkout" method="post">
					<c:if test="${ not empty TBCart}">
						<div class="alert alert-success d-flex align-items-center"
							role="alert">
							<i class="fas fa-check mr-2"></i>
							<div>${TBCart }</div>
						</div>
					</c:if>

					<div class="row">
						<div class="col-12">
							<!-- Table row -->
							<div class="row">
								<div class="card-header"
									style="background-color: #28a745; color: white;">
									<h3 class="card-title">Cart Table</h3>
								</div>
								<div class="col-12 table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>#</th>
												<th>Sản phẩm</th>
												<th>Đơn giá</th>
												<th>Số Lượng</th>
												<th>Toal price</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${cart.cartItems }" var="ci"
												varStatus="loop">
												<tr>
													<th scope="row">${loop.index + 1}</th>
													<td>${ci.productName }</td>
													<td><fmt:formatNumber type="number"
															maxFractionDigits="3" value="${ci.priceUnit }" /> VNĐ</td>
													<td>
														<div style="display: flex;">
															<div>
																<strong> <span id="quanlity_${ci.productId }">
																		${ci.quanlity }</span>
																</strong>
															</div>
															<div style="display: flex;">
																<button
																	style="margin: auto; margin-left: 5px; width: 20px; height: 20px; align-items: center; vertical-align: middle; font-size: 10px; text-align:"
																	type="button" class="btn btn-success"
																	onclick="plusQuanlityCart('${base }', ${ci.productId })">+</button>
																<button
																	style="margin: auto; margin-left: 5px; width: 20px; height: 20px; align-items: center; vertical-align: middle; font-size: 10px; text-align:"
																	type="button" class="btn btn-success"
																	onclick="MinusQuanlityCart('${base }', ${ci.productId })">-</button>

															</div>
														</div>
													</td>

													<td><span id="totalPriceItem_${ci.productId }"><fmt:formatNumber
																type="number" maxFractionDigits="3"
																value="${ci.totalPriceItem }" /> </span> VNĐ</td>
													<td>
														<button class="btn btn-danger btn-xs" role="button"
															type="button"
															onclick="DeleteItemCart('${base }', ${ci.productId })">
															<i class="far fa-trash-alt"></i>
														</button> <%-- <a class="btn btn-danger btn-xs"
														type="button"
														href="${base }/DeleteItemCart_${ci.productId }"> <i
															class="far fa-trash-alt"></i>
													</a> --%>
													</td>
												</tr>
												<!-- </form> -->
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->

							<div class="row" style="margin-top: 50px">
								<!-- accepted payments column -->
								<div class="col-6">
									<div class="card card-success">
										<div class="card-header">
											<h3 class="card-title">Info</h3>
										</div>
										<!-- /.card-header -->
										<!-- form start -->

										<form>
											<%-- <c:if test="${isLogined }"> --%>
											<div class="card-body">
												<div class="form-group">
													<label for="exampleInputEmail1">Your Name</label> <input
														type="text" class="form-control" id="customerFullName"
														name="customerFullName" placeholder="Enter name"
														value="${userLogined.name }">
												</div>

												<div class="form-group">
													<label for="exampleInputEmail1">Address</label> <input
														type="text" class="form-control" id="customerAdress"
														name="customerAdress" placeholder="Enter address"
														value="${userLogined.address }">
												</div>

												<div class="form-group">
													<label for="exampleInputEmail1">Email</label> <input
														type="text" class="form-control" id="customerEmail"
														name="customerEmail" placeholder="Enter email"
														value="${userLogined.email }">
												</div>

												<div class="form-group">
													<label for="exampleInputEmail1">Phone Number</label> <input
														type="number" class="form-control" id="customerPhone"
														name="customerPhone" placeholder="Enter phone"
														value="${userLogined.phone }">
												</div>
											</div>
											<%-- </c:if> --%>
											<!-- /.card-body -->

											<!-- 		<div class="card-footer">
											<button type="submit" class=" btn btn-block btn-success btn-lg" style="width: 100px">Submit</button>
										</div> -->

										</form>
									</div>
								</div>

								<!-- /.col -->
								<div class="col-6" style="">
									<div class="card-header"
										style="background-color: #28a745; color: white;">
										<h3 class="card-title">Hóa đơn</h3>
									</div>

									<div class="table-responsive">
										<table class="table">
											<tbody>
												<tr>
													<th style="width: 50%">Tổng sản phẩm:</th>
													<td><span id="totalItems">${totalItems }</span> sản
														phẩm</td>
												</tr>
												<tr>
													<th>Tax (0.0%)</th>
													<td>0 VNĐ</td>
												</tr>
												<tr>
													<th>Shipping:</th>
													<td>00.00 VNĐ</td>
												</tr>
												<tr>
													<th>Total:</th>
													<td><span name="total" id="totalll"><fmt:formatNumber
																type="number" maxFractionDigits="3"
																value="${cart.totalPrice }" /></span> VNĐ</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->

							<!-- this row will not appear when printing -->
							<div class="row no-print">
								<div class="col-12">
									<!-- <a href="invoice-print.html" rel="noopener" target="_blank"
									class="btn btn-default"><i class="fas fa-print"></i> Print</a> -->
									<button type="submit" class="btn btn-success float-right"
										style="margin-bottom: 10px">
										<i class="far fa-credit-card"></i> Mua Hàng
									</button>

									<!-- 	<a href="/cart_checkout" class="btn btn-success float-right" role="button"> <i
								class="far fa-credit-card"></i> Mua hàng
							</a> -->

								</div>
							</div>
						</div>
					</div>
				</form>
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