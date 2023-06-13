<%@page import="dao.StoreDao"%>
<%@page import="java.util.List"%>
<%@page import="dao.StoreDaoTest"%>
<%@page import="vo.Store"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	StoreDaoTest storeDaotest = StoreDaoTest.getInstance();
	List<Store> storeList = storeDaotest.getAllStores();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>태그 맛집 베스트 순위</title>
<style type="text/css">
header,h1 {
    font-size: 100%
}
.Header {
    display: -moz-flex;
    display: -ms-flexbox;
    display: flex;
    display: -webkit-box;
    display: -webkit-flex;
    -moz-flex-direction: row;
    -ms-flex-direction: row;
    flex-direction: row;
    -webkit-flex-direction: row;
    -webkit-box-direction: normal;
    -webkit-box-orient: horizontal;
    -moz-justify-content: flex-start;
    justify-content: flex-start;
    -webkit-justify-content: flex-start;
    -webkit-box-pack: start;
    -ms-flex-pack: start;
    -moz-align-items: center;
    align-items: center;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 900;
    width: 100%;
    height: 61px;
    border-bottom: 1px solid #DBDBDB;
    box-sizing: border-box;
    box-shadow: 0 4px 11px rgba(0,0,0,0.1);
    background-color: #FFFFFF
}
.Header__SearchBox {
    display: -moz-flex;
    display: -ms-flexbox;
    display: flex;
    display: -webkit-box;
    display: -webkit-flex;
    -moz-flex-direction: row;
    -ms-flex-direction: row;
    flex-direction: row;
    -webkit-flex-direction: row;
    -webkit-box-direction: normal;
    -webkit-box-orient: horizontal;
    -moz-align-items: center;
    align-items: center;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    -moz-box-flex: 1;
    -moz-flex: 1;
    -ms-flex: 1;
    flex: 1;
    -webkit-box-flex: 1;
    -webkit-flex: 1;
    -moz-flex-shrink: 1;
    -ms-flex-negative: 1;
    flex-shrink: 1;
    -webkit-flex-shrink: 1;
    min-width: 0;
    padding-left: 27px
}

.Header__menu {
    display: -moz-flex;
    display: -ms-flexbox;
    display: flex;
    display: -webkit-box;
    display: -webkit-flex;
    -moz-justify-content: center;
    justify-content: center;
    -webkit-justify-content: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    -moz-flex-direction: center;
    -ms-flex-direction: center;
    flex-direction: center;
    -webkit-flex-direction: center;
    -webkit-box-direction: normal;
    -webkit-box-orient: horizontal;
    margin: 0 25px
}
.Header__MenuIcon {
    width: 30px;
    height: 40px;
    background-image: url(https://cdns.iconmonstr.com/wp-content/releases/preview/7.3.0/240/iconmonstr-menu-lined.png);
    background-size: cover;
    background-repeat: no-repeat
}
.Header[data-page=home] .Header__SearchBox {
    display: none
}
.Header[data-page=home] .Header__SearchBox--Show {
    display: -moz-flex;
    display: -ms-flexbox;
    display: flex;
    display: -webkit-box;
    display: -webkit-flex
}
.Header__SearchInputWrap {
    display: -moz-flex;
    display: -ms-flexbox;
    display: flex;
    display: -webkit-box;
    display: -webkit-flex;
    -moz-flex-direction: row;
    -ms-flex-direction: row;
    flex-direction: row;
    -webkit-flex-direction: row;
    -webkit-box-direction: normal;
    -webkit-box-orient: horizontal;
    -moz-align-items: center;
    align-items: center;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    -moz-box-flex: 1;
    -moz-flex: 1;
    -ms-flex: 1;
    flex: 1;
    -webkit-box-flex: 1;
    -webkit-flex: 1;
    -moz-flex-shrink: 1;
    -ms-flex-negative: 1;
    flex-shrink: 1;
    -webkit-flex-shrink: 1;
    min-width: 0;
    overflow: hidden
}
.Header__SearchIcon {
    background-image: url(https://mp-seoul-image-production-s3.mangoplate.com/web/resources/2018022864551sprites_desktop.png);
    background-position: -974px -159px;
    width: 24px;
    height: 25px;
    margin-right: 13px;
    background-size: auto
}
.Header__SearchInput {
    -moz-box-flex: 1;
    -moz-flex: 1;
    -ms-flex: 1;
    flex: 1;
    -webkit-box-flex: 1;
    -webkit-flex: 1;
    height: 27px;
    border: 0;
    font-size: 16px
}
.Header__SearchInput::-ms-clear {
    display: none
}
.Header__SearchInputClearButton {
    display: none;
    margin: 0 20px;
    font-size: 16px;
    line-height: 1.2;
    color: #DBDBDB
}
.Header__SearchInputClearButton--Show {
    display: block
}
.Header__Login {
    display: -moz-flex;
    display: -ms-flexbox;
    display: flex;
    display: -webkit-box;
    display: -webkit-flex;
    -moz-flex-direction: row;
    -ms-flex-direction: row;
    flex-direction: row;
    -webkit-flex-direction: row;
    -webkit-box-direction: normal;
    -webkit-box-orient: horizontal;
    height: 100%;
    margin-left: auto
}
.Header__LoginItem {
    display: -moz-flex;
    display: -ms-flexbox;
    display: flex;
    display: -webkit-box;
    display: -webkit-flex;
    -moz-justify-content: center;
    justify-content: center;
    -webkit-justify-content: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    -moz-align-items: center;
    align-items: center;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    width: 130px;
    border-left: 1px solid #dbdbdb;
    box-sizing: border-box
}

.Header__LoginLink {
    display: -moz-flex;
    display: -ms-flexbox;
    display: flex;
    display: -webkit-box;
    display: -webkit-flex;
    -moz-justify-content: center;
    justify-content: center;
    -webkit-justify-content: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    -moz-align-items: center;
    align-items: center;
    -webkit-align-items: center;
    -webkit-box-align: center;
    -ms-flex-align: center;
    -moz-box-flex: 1;
    -moz-flex: 1;
    -ms-flex: 1;
    flex: 1;
    -webkit-box-flex: 1;
    -webkit-flex: 1;
    height: 100%
}
.Header__LoginText {
    position: relative;
    font-size: 16px;
    color: #888888
}

.basic-info-list {
	padding-top: 100px;
	font-size: 16px;
	text-align: center;
}

.store_img {
    display:inline-block;
}

.textbox {
    display:inline;
 	width: 250px;
 	height: 250px;
 	border-left: 1px solid #dbdbdb;
}

.store_list {
    display:flex;
    justify-content: center;
}

</style>
</head>
<body>

<header class="Header " data-page="normal">
	 <!-- 메뉴 -->
	 <a href="/" class="Header__menu" onclick="trackEvent('CLICK_HEADER_MENU');">
	   <i class="Header__MenuIcon"></i>
	 </a>
	 <!-- 검색창  -->
	 <div class="Header__SearchBox">
	   <i class="Header__SearchIcon"></i>
	
	   <label class="Header__SearchInputWrap">
	     <input type="text" class="Header__SearchInput" placeholder="지역, 식당 또는 음식" value="" autocomplete="off" maxlength="50">
	   </label>
	
	   <button class="Header__SearchInputClearButton">CLEAR</button>
	 </div>
	 <!-- 로그인  -->
	 <ul class="Header__Login">
	     <li class="Header__LoginItem Header__LoginItem--New">
	       <a href="/loginFormPage" class="Header__LoginLink" onclick="trackEvent('CLICK_LOGIN_FORM')">
	         <span class="Header__LoginText">LOGIN</span>
	       </a>
		</li>
	 </ul>
</header>

<article class="contents">
	<header class="basic-info-list">
	    	<div class="inner" style="padding-bottom: 10px">
	      		<h1 class="title">태그 맛집 베스트 순위</h1>
	     	</div>
	</header>
<%
	for (Store store : storeList) {
%>
	<div class=store_list>
		<div class=store_img>
			<a href="/storeDetail.jsp">
				<img alt="이미지텍스트대체" src=""  width=250px height=250px; >
			</a>
		</div>
		<ol class=textbox style="text-align: left">
			<li>
				<span>
					<a href="/storeDetail.jsp"><strong><%=store.getName() %></strong></a>
				</span>
					<p><%=store.getAddress() %>></p>
					<p><%=store.getText() %></p>
					<div style="text-align: right">
						<a href="/storeDetail.jsp">리뷰 보러가기></a>
					</div>
			</li>
		</ol>
	</div>
<%
 	} 
%>		
 	
	<div class=store_list>
		<div class=store_img>
			<a href="/storeDetail.jsp">
				<img alt="이미지텍스트대체" src=""  width=250px height=250px; >
			</a>
		</div>
		<ol class=textbox style="text-align: left">
			<li>
				<span>
					<a href="/storeDetail.jsp"><strong>가게명</strong></a>
				</span>
					<p>가게주소</p>
					<p>가게소개</p>
					<div style="text-align: right">
						<a href="/storeDetail.jsp">리뷰 보러가기></a>
					</div>
			</li>
		</ol>
	</div>		
	<div class=store_list>
		<div class=store_img>
			<a href="/storeDetail.jsp">
				<img alt="이미지텍스트대체" src=""  width=250px height=250px; >
			</a>
		</div>
		<ol class=textbox style="text-align: left">
			<li>
				<span>
					<a href="/storeDetail.jsp"><strong>가게명</strong></a>
				</span>
					<p>가게주소</p>
					<p>가게소개</p>
					<div style="text-align: right">
						<a href="/storeDetail.jsp">리뷰 보러가기></a>
					</div>
			</li>
		</ol>
	</div>		
	<div class=store_list>
		<div class=store_img>
			<a href="/storeDetail.jsp">
				<img alt="이미지텍스트대체" src=""  width=250px height=250px; >
			</a>
		</div>
		<ol class=textbox style="text-align: left">
			<li>
				<span>
					<a href="/storeDetail.jsp"><strong>가게명</strong></a>
				</span>
					<p>가게주소</p>
					<p>가게소개</p>
					<div style="text-align: right">
						<a href="/storeDetail.jsp">리뷰 보러가기></a>
					</div>
			</li>
		</ol>
	</div>		
	<div class=store_list>
		<div class=store_img>
			<a href="/storeDetail.jsp">
				<img alt="이미지텍스트대체" src=""  width=250px height=250px; >
			</a>
		</div>
		<ol class=textbox style="text-align: left">
			<li>
				<span>
					<a href="/storeDetail.jsp"><strong>가게명</strong></a>
				</span>
					<p>가게주소</p>
					<p>가게소개</p>
					<div style="text-align: right">
						<a href="/storeDetail.jsp">리뷰 보러가기></a>
					</div>
			</li>
		</ol>
	</div>		
</article>
</body>
</html>