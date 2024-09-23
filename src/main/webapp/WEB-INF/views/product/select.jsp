<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<%@include file="../include/header.jsp"%>
<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">
		<!-- Main Header -->
		<%@include file="../include/main_header.jsp"%>

		<!-- Left side column. contains the logo and sidebar -->
		<%@include file="../include/left.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>상품 상세보기</h1>
				<ol class="breadcrumb">
					<li>
						<a href="#">
							<i class="fa fa-dashboard"></i>
							Level
						</a>
					</li>
					<li class="active">Here</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content container-fluid">

				<!--------------------------
		        | Your Page Content Here |
		        -------------------------->

				<!-- 하위 카테고리 목록 -->
				<%@ include file="../include/subCategory.jsp"%>

				<form class="form-horizontal center-block">
					<%-- <div class="form-group">
						<label class="col-xs-3 control-label">상위 카테고리</label>
						<div class="col-xs-2">
							<c:forEach items="${categoryListAll}" var="category">
								<c:if test="${category.cate_code == productVO.cate_prtcode}">
									<p class="form-control-static">${category.cate_name}</p>
								</c:if>
							</c:forEach>
						</div>

						<label class="col-xs-2 control-label">하위 카테고리</label>
						<div class="col-xs-2">
							<c:forEach items="${subCategories}" var="subcategory">
								<c:if test="${subcategory.cate_code == productVO.cate_code}">
									<p class="form-control-static">${subcategory.cate_name}</p>
								</c:if>
							</c:forEach>
						</div>
					</div> --%>
					<div class="form-group">
						<label class="col-xs-4 control-label">상품명</label>
						<div class="col-xs-6">
							<%-- <input type="text" class="form-control" name="pro_name" id="pro_name" value="${productVO.pro_name}" readonly="readonly"> --%>
							<p class="form-control-static">${productVO.pro_name}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-4 control-label">상품 가격</label>
						<div class="col-xs-6">
							<%-- <input type="text" class="form-control" name="pro_price" id="pro_price" value="${productVO.pro_price}" readonly="readonly"> --%>
							<p class="form-control-static">${productVO.pro_price}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-4 control-label">브랜드명</label>
						<div class="col-xs-6">
							<%-- <input type="text" class="form-control" name="pro_company" id="pro_company" value="${productVO.pro_company}" readonly="readonly"> --%>
							<p class="form-control-static">${productVO.pro_company}</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-4 control-label">수량</label>
						<div class="col-xs-2">
							<input type="text" class="form-control" name="pro_amount" id="inputAmount">
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-4 control-label">상품 설명</label>
						<div class="col-xs-6">
							<%-- <textarea class="form-control" rows="5" cols="50" name="pro_content" id="pro_content" readonly="readonly">${productVO.pro_content}</textarea> --%>
							<p class="form-control-static">${productVO.pro_content}</p>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12 text-center">
							<button type="button" class="btn btn-primary" id="btnCart">담기</button>
							<button type="button" class="btn btn-primary" id="btnBuy">구매</button>
							<button type="button" class="btn btn-default" onClick="history.back()">목록</button>
						</div>
					</div>
				</form>
				<br><br>
				
				
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@include file="../include/footer.jsp"%>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li class="active">
					<a href="#control-sidebar-home-tab" data-toggle="tab">
						<i class="fa fa-home"></i>
					</a>
				</li>
				<li>
					<a href="#control-sidebar-settings-tab" data-toggle="tab">
						<i class="fa fa-gears"></i>
					</a>
				</li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane active" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li>
							<a href="javascript:;">
								<i class="menu-icon fa fa-birthday-cake bg-red"></i>

								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

									<p>Will be 23 on April 24th</p>
								</div>
							</a>
						</li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li>
							<a href="javascript:;">
								<h4 class="control-sidebar-subheading">
									Custom Template Design
									<span class="pull-right-container">
										<span class="label label-danger pull-right">70%</span>
									</span>
								</h4>

								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
								</div>
							</a>
						</li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading">
								Report panel usage
								<input type="checkbox" class="pull-right" checked>
							</label>

							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>	
	<script>
		$(function() {
			$("#btnCart").on("click", function() {
				var pro_code = ${productVO.pro_code};
				//var pro_amount = ${productVO.pro_amount};
				var amount = $("#inputAmount").val();
				
				if(amount == null || amount == "") {
					alert("수량을 입력하세요");
					$("#inputAmount").focus();
					
					return;
				}
				
				if(confirm("장바구니에 추가하시겠습니까?"))
					self.location = "/cart/insert?pro_code="+pro_code+"&cart_amount="+amount;
			});

			$("#btnBuy").on("click", function() {
				
			});
		});
	</script>

	<%@include file="../include/plugin_js.jsp"%>
</body>
</html>