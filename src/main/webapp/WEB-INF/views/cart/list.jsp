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
				<h1>장바구니</h1>
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
						<div class="box" style="border: none;">
							<div class="box-body">
								<%-- <c:set var="totalPrice" value="0" /> --%>
								
								<table class="table table-striped text-center" id="cartList">
									<tr>
										<th>상품 이미지</th>
										<th>상품명</th>
										<th>판매가</th>
										<th>수량</th>
										<th>비고</th>
									</tr>
									<c:if test="${empty cartList}">
										<!-- <p class="center-block">장바구니가 비었습니다</p> -->
										<tr height="70">
											<td colspan="5" align="center">
												<p style="line-height: 70px;">장바구니가 비었습니다</p>
											</td>
										</tr>
									</c:if>
									<c:if test="${!empty cartList}">
										<c:forEach items="${cartList}" var="cart" varStatus="status">
											<tr>
												<td class="col-md-2"><img src="/admin/product/displayFile?fileName=${cart.pro_img}"></td>
												<td class="col-md-4"><b>${cart.pro_name}</b></td>
												<%-- <td class="col-md-1">${cart.pro_price}</td> --%>
												<td class="col-md-1">
													<span class="price">${cart.pro_price*cart.cart_amount}</span>
													<%-- <c:set var="totalPrice" value="${totalPrice+(cart.pro_price*cart.cart_amount)}" /> --%>
													<input type="hidden" name="pro_price" value="${cart.pro_price}">
												</td>
												<td class="col-md-1">
													<input type="text" name="cart_amount" value="${cart.cart_amount}" size="5">
												</td>
												<td class="col-md-4">
													<input type="hidden" name="cart_code" value="${cart.cart_code}">
													<!-- 수정 : ajax를 이용해 목록 전체를 다시 가져옴, 수정2 : 수정한 row의 수량 값만 -->
													<button class="btn btn-default modBtn" data-role-index="${status.index}">수정</button> <!-- cart_code, cart_amount -->
													<button class="btn btn-default modBtn2" data-role-index="${status.index}">수정2</button> <!-- cart_code, cart_amount -->
													<button class="btn btn-danger delBtn" data-role-index="${status.index}">삭제</button> <!-- cart_code -->
												</td>
											</tr>
										</c:forEach>
									</c:if>
									<%-- <c:forEach items="${list}" var="productVO">
										<tr>
											<td>${productVO.pro_code}</td>
											<td>
												<img src="/admin/product/displayFile?fileName=${productVO.pro_img}">
												<a href='/admin/product/select${pm.makeSearch(pm.cri.page)}&pro_code=${productVO.pro_code}'>
													${productVO.pro_name}
												</a>
											</td>
											<td>${productVO.pro_price}</td>
											<td>${productVO.pro_discount}</td>
											<td>${productVO.pro_company}</td>
											<td>
												<form name="deleteForm" method="post" action="/admin/product/delete${pm.makeSearch(pm.cri.page)}">
													<input type="hidden" name="pro_code" value="${productVO.pro_code}"> <!-- 상품 코드 -->
													<input type="hidden" name="fileName" value="${productVO.pro_img}"> <!-- 파일 이미지명 -->
													
													<button type="button" class="btn btn-primary" onClick="location.href='/admin/product/modify${pm.makeSearch(pm.cri.page)}&pro_code=${productVO.pro_code}'">수정</button>
													<button type="submit" class="btn btn-primary">삭제</button>
												</form>
											</td>
										</tr>
									</c:forEach> --%>
								</table><br>
								<%-- <p class="text-right" style="padding-right: 20px;">
									총 주문 금액 &nbsp;&nbsp;:&nbsp;&nbsp;<span style="/* color: red; */ font-size: 20px;"><b><c:out value="${totalPrice}" />원</b></span>
								</p><br><br> --%>
								<div class="row text-center">
									<button id="delAllBtn" class="btn btn-danger">장바구니 비우기</button>
									<button id="buyAllBtn" class="btn btn-primary">모두 구매</button>
									<button id="listBtn" class="btn btn-default" onClick="location.href='/'">목록으로</button>
								</div><br>
							</div>
							<!-- /.box-body -->

							<%-- <div class="box-footer">
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
							</div> --%>
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
	
	<%@include file="../include/plugin_js.jsp"%>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	
	<script>
		$(function() {
			$(".modBtn").on("click", function() {
				/* if(confirm("수정하시겠습니까?")) {
					form.action = "";
					form.submit();
				} */
				
				if(!confirm("수정하시겠습니까?"))
					return false;
				
				var index = $(this).attr("data-role-index");
				var cart_code = document.getElementsByName("cart_code")[index].value;
				var cart_amount = document.getElementsByName("cart_amount")[index].value;
				
				//alert("cart_code : " + cart_code + ", index : " + index);
				
				var reqUrl = "/cart/"+cart_code+"/"+cart_amount;
				
				//alert(reqUrl);
				
				$.getJSON(reqUrl, function(data) {
					//alert(data[0].pro_code);
					
					var template = Handlebars.compile($("#template").html());
					var html = template(data);
					
					//$("#cartList").children().remove();
					$("#cartList tr:not(:first)").remove(); // 첫번째 행이 아닌 tr을 모두 삭제
					$("#cartList").append(html);
				});
				
				/* $.ajax({
					url: "",
					data: ,
					type: get,
					success: function(data) {
						
					}
				}); */
			});
			
			var index;
			var price;
			var cart_amount;
			
			$(".modBtn2").on("click", function() {
				if(!confirm("수정하시겠습니까?"))
					return false;
				
				index = $(this).attr("data-role-index");
				var cart_code = document.getElementsByName("cart_code")[index].value;
				cart_amount = document.getElementsByName("cart_amount")[index].value;
				
				price = document.getElementsByName("pro_price")[index].value;
				
				//location.href = "/cart/"+cart_code+"/"+cart_amount;
				
				$.ajax({
					url: "/cart/",
					data: {"cart_code":cart_code, "cart_amount":cart_amount},
					type: "get",
					success: function(data) {
						if(data == "SUCCESS") {
							alert("수정되었습니다");
							
							document.getElementsByClassName("price")[index].innerText = price * cart_amount; 
						}
					}
				});
			});
			
			var now;

			$(".delBtn").on("click", function() {
				if(!confirm("삭제하시겠습니까?"))
					return false;
				
				var index = $(this).attr("data-role-index");
				var cart_code = document.getElementsByName("cart_code")[index].value;
				
				cur_tr = $(this); // 삭제 버튼이 속한 행
								
				$.ajax({
					url: "/cart/delete",
					data: {"cart_code":cart_code},
					type: "get",
					success: function(data) {
						if(data == "SUCCESS")
							cur_tr.parent().parent().remove(); // 현재 row를 동적으로 제거
					}
				});
			});
			
			$("#delAllBtn").on("click", function() {
				if(!confirm("장바구니를 모두 삭제하시겠습니까?"))
					return false;
				
				location.href = "/cart/deleteAll";
			});
			
			$("#buyAllBtn").on("click", function() {
				if(!confirm("모두 구매하시겠습니까?"))
					return false;
				
				var msg = '${msg}';
				var size = ${size};
				
				if(msg == "empty" || size == 0) {
					alert("장바구니가 비어있습니다");
					
					return false;
				}
				
				location.href = "/order/insert";
			});
		});
		
		// 동적으로 추가한 소스는 정적으로 추가한 것과 다름
		// 그래서 스타일이나 기능이 실행되지 않기 때문에 새로 만들어줌
		function fn_cartEdit(index) {
			var cart_code = document.getElementsByName("cart_code")[index].value;
			var cart_amount = document.getElementsByName("cart_amount")[index].value;
			
			//alert("cart_code : " + cart_code + ", index : " + index);
			
			var reqUrl = "/cart/"+cart_code+"/"+cart_amount;
			
			//alert(reqUrl);
			
			$.getJSON(reqUrl, function(data) {
				//alert(data[0].pro_code);
				
				var template = Handlebars.compile($("#template").html());
				var html = template(data);
				
				//$("#cartList").children().remove();
				$("#cartList tr:not(:first)").remove(); // 첫번째 행이 아닌 tr을 모두 삭제
				$("#cartList").append(html);
			});
		}
	</script>
	
	<script id="template" type="text/x-handlebars-template">
	{{#each .}}
	<tr>
		<td><img src="/admin/product/displayFile?fileName={{pro_img}}"></td>
		<td><b>{{pro_name}}</b></td>
		<td>{{pro_price}}</td>
		<td>
		<input type="text" name="cart_amount" value="{{cart_amount}}" size="10">
		</td>
		<td>
		<input type="hidden" name="cart_code" value="{{cart_code}}">
		<button class="btn btn-default modBtn" onClick="fn_cartEdit({{index}});">수정</button>
		<button class="btn btn-danger delBtn">삭제</button>
		</td>
	</tr>
	{{/each}}
	</script>
	<script>
		var i = 0;
		
		Handlebars.registerHelper("index", function() { // 함수명 : index, 매개변수가 필요한 경우 function() 안에 넣어줌
			return i++;
		});
	</script>
</body>
</html>