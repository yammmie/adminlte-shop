<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<%@include file="../../include/header.jsp"%>
<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">
		<!-- Main Header -->
		<%@include file="../../include/main_header.jsp"%>

		<!-- Left side column. contains the logo and sidebar -->
		<%@include file="../../include/left.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					상품 등록
				</h1>
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

				<div class="container text-center">
					<form class="form-horizontal center-block" action="/admin/product/insert" method="post" enctype="multipart/form-data">
						<div class="form-group">
							<label class="col-xs-3 control-label">상위 카테고리</label>
							<div class="col-xs-2">
								<select name="cate_prtcode" id="mainCategory" class="form-control">
									<option value="">상위</option>
									<c:forEach items="${categoryListAll}" var="category">
										<option value="${category.cate_code}">${category.cate_name}</option>
									</c:forEach>
								</select>
							</div>
							<label class="col-xs-2 control-label">하위 카테고리</label>
							<div class="col-xs-2">
								<select name="cate_code" id="subCategory" class="form-control">
									<option value="">하위</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 control-label">상품명</label>
							<div class="col-xs-6">
								<input type="text" class="form-control" name="pro_name" id="pro_name" value="${productVO.pro_name}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 control-label">상품 가격</label>
							<div class="col-xs-6">
								<input type="text" class="form-control" name="pro_price" id="pro_price" value="${productVO.pro_price}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 control-label">할인율</label>
							<div class="col-xs-6">
								<input type="text" class="form-control" name="pro_discount" id="pro_discount" value="${productVO.pro_discount}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 control-label">공급처</label>
							<div class="col-xs-6">
								<input type="text" class="form-control" name="pro_company" id="pro_company" value="${productVO.pro_company}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 control-label">상품 수량</label>
							<div class="col-xs-6">
								<input type="text" class="form-control" name="pro_amount" id="pro_amount" value="${productVO.pro_amount}">
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 control-label">상품 설명</label>
							<div class="col-xs-6">
								<textarea class="form-control" rows="5" cols="50" name="pro_content" id="pro_content">${productVO.pro_content}</textarea>
							</div>
						</div>
						<div class="form-group">
							<label class="col-xs-3 control-label">상품 이미지</label>
							<div class="col-xs-6">
								<input type="file" name="file1" id="file1">
							</div>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-primary">등록</button>
							<button type="reset" class="btn btn-primary">초기화</button>
							<button type="button" class="btn btn-primary" onClick="location.href='/admin/product/list${pm.makeSearch(pm.cri.page)}'">목록</button>
						</div>
					</form>
				</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@include file="../../include/footer.jsp"%>

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
	<script src="/ckeditor/ckeditor.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script>
		$(function() {
			var ckeditor_config = {
				resize_enable : false,
				enterMode : CKEDITOR.ENTER_BR,
				shiftEnterMode : CKEDITOR.ENTER_P,
				filebrowserUploadUrl : '/admin/product/imgUpload' // editor에서 이미지 업로드 하고 서버로 전송을 누르면 이 링크로 전송됨
			};

			CKEDITOR.replace('pro_content', ckeditor_config);
			
			// 하위 카테고리 출력
			$("#mainCategory").on("change", function() {
				var cate_code = $("#mainCategory option:selected").val();
				
				//alert(cate_code);
				
				var subCateUrl = "/admin/product/categoryListAll/"+cate_code;
				
				$.getJSON(subCateUrl, function(data) {
					subCategoryList(data, $("#subCategory"), $("#template"));
				});
			});
		});
	</script>
	<script id="template" type="text/x-handlebars-template">
		<option value="">하위</option>
		{{#each .}}
			<option value="{{cate_code}}">{{cate_name}}</option>
		{{/each}}		
	</script>
	<script>
		var subCategoryList = function(subCateStr, target, templateObject) {
			var template = Handlebars.compile(templateObject.html());
			var options = template(subCateStr); // template(데이터)

			$("#subCategory option").remove(); // 기존 option을 제거해야 누적이 안된다
			target.append(options);
		}
	</script>

	<%@include file="../../include/plugin_js.jsp"%>
</body>
</html>