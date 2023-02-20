<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>회원관리</title>
<!-- Required meta tags -->
<meta charset="utf-8" />

<!-- 부트스트랩 -->
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- 부트스트랩 -->

<!--파비콘sss-->
<link rel="icon" type="image/png" sizes="16x16"
	href="${path}/resources/image/favicon/android-icon-144x144.png" />
<link rel="manifest"
	href="${path}/resources/image/favicon/manifest.json" />
<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage"
	content="${path}/resources/image/favicon/ms-icon-144x144.png" />
<meta name="theme-color" content="#ffffff" />

<!-- 제이쿼리 라이브러리 연결 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 리셋 css 연결 -->
<link href="${path}/resources/css/reset.css" rel="stylesheet" />
</head>
<style>
    .rwd-table {
      margin: auto;
      width: 95%;
      border-collapse: collapse;
    }

    .rwd-table tr:first-child {
      background: #5b86ef;
      color: #fff;
    }

    .rwd-table tr {
      border-top: 1px solid #ddd;
      border-bottom: 1px solid #ddd;
      background-color: white;
    }

    /*.rwd-table tr:nth-child(odd):not(:first-child) {*/
    /*    background-color: #ebf3f9;*/
    /*}*/

    .rwd-table th {
      display: none;
    }

    .rwd-table td {
      display: block;
    }

    .rwd-table td:first-child {
      margin-top: 0.5em;
    }

    .rwd-table td:last-child {
      margin-bottom: 0.5em;
    }

    .rwd-table td:before {
      /*content: attr(data-th) ": ";*/
      font-weight: bold;
      width: 120px;
      display: inline-block;
      color: #000;
    }

    .rwd-table th,
    .rwd-table td {
      text-align: left;
    }

    .rwd-table {
      color: #333;
      border-radius: 0.4em;
      overflow: hidden;
    }

    .rwd-table tr {
      border-color: #5b86ef;
    }

    .rwd-table th,
    .rwd-table td {
      padding: 0.5em 1em;
    }
    @media screen and (max-width: 601px) {
      .rwd-table tr:nth-child(2) {
        border-top: none;
      }
      .rwd-table th:first-child,
      .rwd-table td:first-child {
        font-weight: bold;
        color: black;
      }
      .rwd-table td a {
        text-decoration: none;
        color: black;
      }
    }
    @media screen and (min-width: 600px) {
      .rwd-table tr:hover:not(:first-child) {
        background-color: rgba(131, 244, 180, 0.3);
        /*background-color: #83F4B4;과 동일 opacity*/
      }
      .rwd-table td:before {
        display: none;
      }
      .rwd-table td a {
        text-decoration: none;
        color: black;
      }
      .rwd-table th,
      .rwd-table td {
        display: table-cell;
        padding: 0.25em 0.5em;
      }
      .rwd-table th:first-child,
      .rwd-table td:first-child {
        font-weight: bold;
        padding-left: 0;
      }
      .rwd-table th:last-child,
      .rwd-table td:last-child {
        padding-right: 0;
      }
      .rwd-table th,
      .rwd-table td {
        padding: 1em !important;
      }
    }
  </style>
<body>
    <table border="1" class="rwd-table">
      <tr>
        <td>아이디</td>
        <td>이름</td>
        <td>이메일</td>
        <td>등급</td>
        <td>상태</td>
      </tr>
      <c:forEach var="mb" items="${list}">
        <tr>
          <td><c:out value="${mb.mid}"></c:out></td>
          <td><c:out value="${mb.mname}"></c:out></td>
          <td><c:out value="${mb.memail}"></c:out></td>
          <td>
          <form method="post" action="/controller/admin/changeStotus.do">
          <input type="hidden" name="mid" value="${mb.mid}">
            <select 
            	name="mgrade"
                class="form-select form-select-sm"
                aria-label=".form-select-sm example"
                style="width: 150px"
              >
                <option selected> <c:out value="${mb.mgrade}"></c:out></option>
                <option value="G">G(일반회원)</option>
                <option value="D">D(전문의회원)</option>
                <option value="A">A(관리자)</option></select
              >
              <input
              type="submit"
              value="변경"
              class="btn btn-primary"
           		 />
            
            </form>
          </td>
          <td>
          <form method="post" action="/controller/admin/changedelyn.do">
          <input type="hidden" name="mid" value="${mb.mid}">
              <select name="mdelyn"
                class="form-select form-select-sm"
                aria-label=".form-select-sm example"
                style="width: 150px"
              >
                <option selected> <c:out value="${mb.mdelyn}"></c:out></option>
                <option value="N">정상(Y)</option>
                <option value="Y">탈퇴(N)</option></select>
                <input
                type="submit"
                value="변경"
                class="btn btn-primary"
              />
              </form>
          </td>
        </tr>
      </c:forEach>
    </table>
    <input
      type="button"
      value="메인으로"
      class="btn btn-primary"
      href="<%=request.getContextPath() %>/"
    />
</body>
</html>
