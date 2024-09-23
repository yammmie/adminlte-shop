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
				<h1>주문 페이지</h1>
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
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title"></h3>
							</div>
							<!-- /.box-header -->
							
							<table class="table table-bordered text-center" id="cartList">
								<tr>
									<th>상품 이미지</th>
									<th>상품명</th>
									<th>판매가</th>
									<th>수량</th>
								</tr>
								
								<c:set var="totalPrice" value="0" />
								
								<c:if test="${!empty cartList}">
									<c:forEach items="${cartList}" var="cart" varStatus="status">
										<tr>
											<td class="col-md-2"><img src="/admin/product/displayFile?fileName=${cart.pro_img}"></td>
											<td class="col-md-6 text-left"><b>${cart.pro_name}</b></td>
											<%-- <td class="col-md-1">${cart.pro_price}</td> --%>
											<td class="col-md-2">
												${cart.pro_price*cart.cart_amount}
												<c:set var="totalPrice" value="${totalPrice+(cart.pro_price*cart.cart_amount)}" />
											</td>
											<td class="col-md-2">
												${cart.cart_amount}
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
							
							<p class="text-right" style="padding-right: 20px;">
								총 주문 금액 &nbsp;&nbsp;:&nbsp;&nbsp;<span style="/* color: red; */ font-size: 20px;"><b><c:out value="${totalPrice}" />원</b></span>
							</p><br><br>

							<form role="insertForm" action="/order/insert" method="post">
								<div class="box-body">
									<div class="form-group">
										<label for="exampleInputEmail1">이름</label>
										<input type="text" name="ord_name" class="form-control" required="required">
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">전화번호 (-포함)</label>
										<input type="text" name="ord_tel" class="form-control" required="required">
									</div>
									<div class="form-group">	
										<label for="exampleInputEmail1">우편번호</label>
										<div class="row">
											<div class="col-xs-3">
												<input type="text" name="ord_zipcode" id="zipcode" class="form-control" readonly="readonly" required="required">
											</div>
											<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary">
										</div>
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">주소</label>
										<input type="text" name="ord_addr" id="addr" class="form-control" readonly="readonly" required="required">
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">상세주소</label>
										<input type="text" name="ord_detailaddr" id="detailaddr" class="form-control" required="required">
									</div>
								</div>
								<input type="hidden" name="ord_price" value="${totalPrice}"> <!-- 총 주문 금액 -->

								<!-- /.box-body -->

								<div class="box-footer">
									<button type="submit" class="btn btn-primary center-block">주문하기</button>
								</div>
							</form>
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
	<script src="/ckeditor/ckeditor.js"></script>
	
	<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
	<div id="layer" style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
	<script>
		// 우편번호 찾기 화면을 넣을 element
		var element_layer = document.getElementById("layer");

		function closeDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_layer.style.display = "none";
		}

		function sample2_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백("")값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ""; // 주소 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === "R") { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById("zipcode").value = data.zonecode;
					document.getElementById("addr").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("detailaddr").focus();

					// iframe을 넣은 element를 안보이게 한다.
					// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
					element_layer.style.display = "none";
				},
				width : "100%",
				height : "100%",
				maxSuggestItems : 5
			}).embed(element_layer);

			// iframe을 넣은 element를 보이게 한다.
			element_layer.style.display = "block";

			// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
			initLayerPosition();
		}

		// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
		// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
		// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
		function initLayerPosition() {
			var width = 300; //우편번호서비스가 들어갈 element의 width
			var height = 400; //우편번호서비스가 들어갈 element의 height
			var borderWidth = 5; //샘플에서 사용하는 border의 두께

			// 위에서 선언한 값들을 실제 element에 넣는다.
			element_layer.style.width = width + "px";
			element_layer.style.height = height + "px";
			element_layer.style.border = borderWidth + "px solid";
			// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
			element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth)-width)/2-borderWidth)+"px";
			element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight)-height)/2-borderWidth)+"px";
		}
	</script>

	<%@include file="../include/plugin_js.jsp"%>
	
	<script>
		$(function() {
			/* $("form[role='insertForm']").submit(function() {
				
			}); */
		});
	</script>
</body>
</html>