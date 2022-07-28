<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="Path" value="${pageContext.request.contextPath}" />
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../style.css">
    <script src="https://kit.fontawesome.com/30bc34d870.js" crossorigin="anonymous"></script>
    <title>마이페이지</title>
</head>

<body>
    <div class ="wrap"> <!--전체-->
        <jsp:include page="../topNav.jsp" /> <!-- 네비바 -->
        <section class="main_section"> <!--가운데 세션-->
            <main class="main_center_screen">
                <h2>회원 정보 보기</h2>
                <form method="post" acton="https:localhost:3070/login/deliveryInfo">
                    <input type="hidden" value="${sessionScope.member.id}" name="p_user">
                    <input class="btn" type="submit" value="배송주문 현황">
                </form>
                <input class="btn" type="button" value="회원정보 수정" onclick=' location.href="${path}/login/myInfoUpdate" '>
                    <table>
                        <tr>
                            <th>username</th>
                            <td>${sessionScope.member.userName}</td>
                        </tr>
                        <tr>
                            <th>gender</th>
                            <td>${sessionScope.member.gender}</td>
                        </tr>
                        <tr>
                            <th>phone</th>
                            <td>${sessionScope.member.phone}</td>
                        </tr>
                        <tr>
                            <th>email</th>
                            <td>${sessionScope.member.email}</td>
                        </tr>
                        <tr>
                            <th>address</th>
                            <td>${sessionScope.member.address}</td>
                        </tr>
                        <tr>
                            <th>회원 가입일</th>
                            <td><fmt:formatDate value="${sessionScope.member.registerDate}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                    </table>
                </form>
            </main>
        </section>
    </div>
</body>
</html>