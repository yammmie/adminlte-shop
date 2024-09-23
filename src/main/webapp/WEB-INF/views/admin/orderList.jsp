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
				<h1>주문 조회</h1>
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
						<!-- general form elements -->
						<div class="box" style="border: none;">
							<div class="box-header"></div>

							<div class="row text-center">
								<select name="searchType">
									<option value="null" <c:out value="${cri.searchType == null?'selected':''}"/>>-</option>
									<option value="code" <c:out value="${cri.searchType eq 'code'?'selected':''}"/>>주문번호</option>
									<option value="name" <c:out value="${cri.searchType eq 'name'?'selected':''}"/>>상품명</option>
									<option value="content" <c:out value="${cri.searchType eq 'content'?'selected':''}"/>>내용</option>
									<option value="company" <c:out value="${cri.searchType eq 'company'?'selected':''}"/>>제조사</option>
								</select>
								<input type="text" name='keyword' id="keywordInput" value='${cri.keyword}'>
								<button id="searchBtn" class="btn btn-default">검색</button>
								<button class="btn btn-primary" onClick="location.href='/admin/product/insert'">상품 등록</button>
							</div><br>

							<div class="box text-right" style="border: none; box-shadow: none; padding-right: 20px;">
								<button type="button" id="ChkDelBtn" class="btn btn-danger">선택 삭제</button>
							</div>
							<table class="table table-striped text-center">
								<tr>
									<th>
										<input type="checkbox" id="AllChkBtn">
									</th>
									<th>주문번호</th>
									<th>상품 이미지</th>
									<th>상품명</th>
									<th>주문 수량</th>
									<th>주문 금액</th>
									<th>주문일자</th>
								</tr>
								<c:if test="${empty orderList}">
									<tr height="70">
										<td colspan="7" align="center">주문 내역이 없습니다</td>
									</tr>
								</c:if>

								<c:if test="${!empty orderList}">
									<c:forEach items="${orderList}" var="ord">
										<tr>
											<td class="chkrow">
												<input type="checkbox" class="chkArr" name="chkArr" value="${ord.ord_code}">
											</td>
											<td class="col-md-1 ordrow">${ord.ord_code}</td>
											<td class="col-md-2">
												<img src="/admin/product/displayFile?fileName=${ord.pro_img}">
											</td>
											<td class="col-md-4">
												<b>${ord.pro_name}</b>
											</td>
											<td class="col-md-1">${ord.ordtl_amount}</td>
											<td class="col-md-2">${ord.ordtl_price}원</td>
											<td class="col-md-2">${ord.ord_regdate}</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>
						<!-- /.box -->
					</div>
					<!--/.col (left) -->

				</div>

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
									<h4 class="control-sidebar-subheading">Langdon"s Birthday</h4>

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
		<!-- Add the sidebar"s background. This div must be placed immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


	<%@include file="../include/plugin_js.jsp"%>

	<script>
		$(function() {
			rowSpan(".ordrow");
			rowSpan("input[name='chkArr']");

			// 모두 선택 클릭 시
			$("#AllChkBtn").click(function() {
				var chk = $("#AllChkBtn").prop("checked");

				if (chk)
					$(".chkArr").prop("checked", true); // 전체 선택
				else
					$(".chkArr").prop("checked", false); // 전체 해제
			});

			// 개별 체크박스 선택 시 전체 선택 해제
			$(".chkArr").click(function() {
				$("#AllChkBtn").prop("checked", false);
			})

			// 선택 삭제 버튼 클릭 시
			$("#ChkDelBtn").click(function() {
				if (confirm("선택한 주문을 삭제하시겠습니까?")) {
					var chkArr = []; // var chkArr = new Array();

					$("input[name='chkArr']:checked").each(function() {
						chkArr.push($(this).val());
					});

					$.ajax({
						url : "/admin/delete",
						type : "post",
						data : {"chkArr" : chkArr},
						success : function(data) {
							if (data == "SUCCESS")
								location.href = "/admin/orderList";
						}
					});
				}
			});
		});

		function rowSpan(className) {
			$(className).each(function(index) {
				var rows;

				if (className == '.ordrow') // checkbox는 value에 ord_code가 있음
					rows = $(className+":contains('"+$(this).text()+"')"); // $(this).text() : ord_code, rows : td를 가리킴
				else
					rows = $(className+"[value='"+$(this).val()+"']"); // input[value='번호'], checkbox row는 input을 가리킴

				if (rows.length > 1) { // 주문 번호가 중복되면
					if (className != '.ordrow')  // checkbox는 value에 ord_code가 있음
						rows = rows.parent(); // row가 input이기 때문에 td를 가리키기 위해 rows.parent() 사용

					rows.eq(0).attr("rowspan", rows.length);
					rows.not(":eq(0)").remove(); // 첫번째가 아닌 것은 다 지우기
				}
			});
		}
	</script>
</body>
</html>