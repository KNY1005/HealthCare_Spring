<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>시작하기</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
  </head>
  <body>
   <div>
        <table>
            <thead>
            <tr>
                <th>#</th>
                <th>이름</th>
                <th>아이디</th>
            </tr>
            </thead>
            <tbody>
        <!--thymeleaf 식 for 문-->
        <!--MemberController 로 넘어가는 members-->
            <tr th:each="mname : ${mid}">
                <td th:text="${vo.midx}"></td>
                <td th:text="${member.name}"></td>
                <td th:text="${member.id}"></td>
            </tr>
            </tbody>
        </table>
    </div>
  </body>
</html>
