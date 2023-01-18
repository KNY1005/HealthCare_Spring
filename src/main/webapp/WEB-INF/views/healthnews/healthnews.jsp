<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
	<!--파비콘-->
	<link rel="icon" type="image/png" sizes="16x16"
	href="${path }/resources/image/favicon/favicon-16x16.png" />
<link rel="manifest"
	href="${path }/resources/image/favicon/manifest.json" />
<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage"
	content="${path }/resources/image/favicon/ms-icon-144x144.png" />
<meta name="theme-color" content="#ffffff" />
<style>
      main {
        width: 1320px;
        height: 800px;
        margin: 200px auto 0;
      }
      #head h3 {
        font-weight: bold;
        font-size: 48px;
        display: inline-block;
      }

      #head {
        position: relative;
      }
      #search {
        bottom: 4px;
        font-weight: bold;
        font-size: 36px;
        vertical-align: top;
        position: absolute;
        right: 10px;
      }
      input {
        display: inline-block;
      }
      #search_n {
        position: absolute;
        left: -50px;
        top: 5px;
      }
      input::-webkit-search-decoration,
      input::-webkit-search-cancel-button,
      input::-webkit-search-results-button,
      input::-webkit-search-results-decoration {
        display: none;
      }
      input {
        height: 40px;
        font-size: 20px;
        margin-left: 20px;
        border: 1px solid #000;
        border-radius: 10px;
        padding-right: 40px;
      }
      #search div a {
        position: absolute;
        right: 5px;
        bottom: -2px;
      }
      hr {
        height: 2px;
        border: 0;
        background: #ff7373;
      }

      .content_box {
        display: flex;
        flex-direction: row;
        background: #fff;
        border: 4px solid #ff7373;
        width: 97%;
        height: 150px;
        border-radius: 15px;
      }

      .content_img {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 10px;
        margin-left: 20px;
        background: #ffdbdb;
        width: 200px;
        height: 130px;
      }

      .content_img img {
        width: 200px;
        height: 110px;
      }

      .content_text p:nth-child(1) {
        font-size: 40px;
        font-weight: bold;
      }

      .content_text p:nth-child(2) {
        font-size: 20px;
        font-weight: bold;
        margin-top: 10px;
      }

      .content_text {
        margin-top: 10px;
        margin-left: 20px;
      }

      .content_list li {
        margin-top: 20px;
      }
    </style>
  </head>
  <body>
  <%@include file="../includes/header.jsp"%>
    <main>
      <div id="head">
        <h3>건강소식</h3>
        <div id="search">
          <p id="search_n">검색</p>
          <div>
            <input type="search" name="search" />
            <a href="#" id="glass"><i class="xi-search"></i></a>
          </div>
        </div>
      </div>
      <hr />
      <ul class="content_list">
        <li>
          <div class="content_box">
            <div class="content_img">
              <img src="../image/로고2.png" />
            </div>
            <div class="content_text">
              <p>제목</p>
              <p>여기는 내용 입니다</p>
            </div>
          </div>
        </li>
        
      </ul>
    </main>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>