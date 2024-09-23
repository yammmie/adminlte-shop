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
					상품 목록
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

				<div class="row">
					<!-- left column -->

					<div class="col-md-12">
						<div class="row text-center">
							<select name="searchType">
								<option value="null" <c:out value="${cri.searchType == null?'selected':''}"/>>-</option>
								<option value="code" <c:out value="${cri.searchType eq 'code'?'selected':''}"/>>상품코드</option>
								<option value="name" <c:out value="${cri.searchType eq 'name'?'selected':''}"/>>상품명</option>
								<option value="content" <c:out value="${cri.searchType eq 'content'?'selected':''}"/>>내용</option>
								<option value="company" <c:out value="${cri.searchType eq 'company'?'selected':''}"/>>제조사</option>
							</select>
							<input type="text" name='keyword' id="keywordInput" value='${cri.keyword}'>
							<button id="searchBtn" class="btn btn-default">검색</button>
							<button class="btn btn-primary" onClick="location.href='/admin/product/insert'">상품 등록</button>
						</div><br>

						<div class="box" style="border: none;">
							<div class="box-body">
								<table class="table table-striped text-center">
									<tr>
										<th>상품 코드</th>
										<th>상품 이미지</th>
										<th>상품명</th>
										<th>판매가</th>
										<th>할인가</th>
										<th>제조사</th>
										<th>비고</th>
									</tr>
									<c:forEach items="${list}" var="productVO">
										<tr>
											<td class="col-md-1">${productVO.pro_code}</td>
											<td class="col-md-2">
												<img src="/admin/product/displayFile?fileName=${productVO.pro_img}">
											</td>
											<td class="col-md-4">
												<a href='/admin/product/select${pm.makeSearch(pm.cri.page)}&pro_code=${productVO.pro_code}' style="color: black;">
													${productVO.pro_name}
												</a>
											</td>
											<td class="col-md-1">${productVO.pro_price}</td>
											<td class="col-md-1">${productVO.pro_discount}</td>
											<td class="col-md-1">${productVO.pro_company}</td>
											<td class="col-md-2">
												<form name="deleteForm" method="post" action="/admin/product/delete${pm.makeSearch(pm.cri.page)}">
													<input type="hidden" name="pro_code" value="${productVO.pro_code}"> <!-- 상품 코드 -->
													<input type="hidden" name="fileName" value="${productVO.pro_img}"> <!-- 파일 이미지명 -->
													
													<button type="button" class="btn btn-default" onClick="location.href='/admin/product/modify${pm.makeSearch(pm.cri.page)}&pro_code=${productVO.pro_code}'">수정</button>
													<button type="submit" class="btn btn-danger">삭제</button>
												</form>
											</td>
										</tr>

									</c:forEach>
								</table>
							</div>
							<!-- /.box-body -->


							<div class="box-footer">

								<div class="text-center">
									<ul class="pagination">

										<c:if test="${pm.prev}">
											<li>
												<a href="list${pm.makeSearch(pm.startPage-1)}">&laquo;</a>
											</li>
										</c:if>

										<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="idx">
											<li <c:out value="${pm.cri.page == idx?'class =active':''}"/>>
												<a href="list${pm.makeSearch(idx)}">${idx}</a>
											</li>
										</c:forEach>

										<c:if test="${pm.next && pm.endPage > 0}">
											<li>
												<a href="list${pm.makeSearch(pm.endPage +1)}">&raquo;</a>
											</li>
										</c:if>

									</ul>
								</div>

							</div>
							<!-- /.box-footer-->
						</div>
					</div>
					<!--/.col (left) -->

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
	<script>
		$(function() {
			var ckeditor_config = {
				resize_enable : false,
				enterMode : CKEDITOR.ENTER_BR,
				shiftEnterMode : CKEDITOR.ENTER_P,
				filebrowserUploadUrl : '/admin/product/imgUpload' // editor에서 이미지 업로드 하고 서버로 전송을 누르면 이 링크로 전송됨
			};

			CKEDITOR.replace('pro_content', ckeditor_config);
			
			$('#searchBtn').on("click", function(event) {
				self.location = "list"
						+ '${pm.makeQuery(1)}'
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&keyword=" + $('#keywordInput').val();
			});
			
			$("form[name='deleteForm'] button[type='submit']").on("click", function(e) {
				var form=$("form[name='deleteForm']");
				
				if(!confirm("삭제하시겠습니까?")) {
					return false;
				}
			});
		});
	</script>

	<%@include file="../../include/plugin_js.jsp"%>
</body>
</html>