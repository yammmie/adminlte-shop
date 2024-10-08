<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">

		<!-- Sidebar user panel (optional) -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>Alexander Pierce</p>
				<!-- Status -->
				<a href="#">
					<i class="fa fa-circle text-success"></i>
					Online
				</a>
			</div>
		</div>

		<!-- search form (Optional) -->
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control" placeholder="Search...">
				<span class="input-group-btn">
					<button type="submit" name="search" id="search-btn" class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!-- /.search form -->

		<!-- Sidebar Menu -->
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">MENU</li>
			<!-- <li class="active">
				<a href="#">
					<i class="fa fa-link"></i>
					<span>Link</span>
				</a>
			</li>
			<li>
				<a href="#">
					<i class="fa fa-link"></i>
					<span>Another Link</span>
				</a>
			</li> -->
			<c:choose>
				<c:when test="${sessionScope.member_id == null}"> <!-- 로그인 X -->
					<li>
						<a href="/member/join">회원 가입</a>
					</li>
					<li>
						<a href="/member/login">로그인</a>
					</li>		
				</c:when>
				<c:when test="${sessionScope.member_id == 'admin'}"> <!-- 관리자 -->
					<li class="treeview">
						<a href="#">
							<i class="fa fa-link"></i>
							<span>카테고리 관리</span>
							<span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
							</span>
						</a>
						<ul class="treeview-menu">
							<li>
								<a href="#">카테고리 등록</a>
							</li>
							<li>
								<a href="#">카테고리 수정</a>
							</li>
						</ul>
					</li>
					<li class="treeview">
						<a href="#">
							<i class="fa fa-link"></i>
							<span>상품 관리</span>
							<span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
							</span>
						</a>
						<ul class="treeview-menu">
							<li>
								<a href="/admin/product/insert">상품 등록</a>
							</li>
							<li>
								<a href="/admin/product/list">상품 목록</a>
							</li>
						</ul>
					</li>
					<li class="treeview">
						<a href="#">
							<i class="fa fa-link"></i>
							<span>회원 관리</span>
							<span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
							</span>
						</a>
						<ul class="treeview-menu">
							<li>
								<a href="/member/logout">로그아웃</a>
							</li>
							<li>
								<a href="#">회원 목록</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="/admin/orderList">주문조회</a>
					</li>
				</c:when>
				<c:otherwise> <!-- 일반 회원 -->
					<li>
						<a href="/member/logout">로그아웃</a>
					</li>
					<li>
						<a href="/member/modify">회원 정보 수정</a>
					</li>
					<li>
						<a href="/cart/list">장바구니</a>
					</li>
					<li>
						<a href="/order/list">주문조회</a>
					</li>
					
					<li class="treeview">
						<a href="/list">
							<i class="fa fa-link"></i>
							<span>상위 카테고리 목록</span>
							<span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
							</span>
						</a>
						<ul class="treeview-menu">
							<c:forEach items="${userCategoryList}" var="category">
								<li>
									<a href="/?cate_prtcode=${category.cate_code}">${category.cate_name}</a>
								</li>
							</c:forEach>
						</ul>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>
		<!-- /.sidebar-menu -->
	</section>
	<!-- /.sidebar -->
</aside>