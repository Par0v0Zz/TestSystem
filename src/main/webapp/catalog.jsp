<%--
  Created by IntelliJ IDEA.
  User: dmitriy
  Date: 14.03.18
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
    <c:if test="${not empty param.language}">
        <c:set var="locale" scope="session" value="${param.language}"/>
    </c:if>
    <c:if test="${empty sessionScope.locale}">
        <fmt:setLocale value="en"/>
    </c:if>
    <c:if test="${sessionScope.locale eq 'en'}">
        <fmt:setLocale value="en"/>
    </c:if>
    <c:if test="${sessionScope.locale eq 'ru'}">
        <fmt:setLocale value="ru"/>
    </c:if>

    <fmt:setBundle basename="internationalization"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title><fmt:message key="catalog.catalog"/></title>
    <link rel="stylesheet" href="css/catalog.css" type="text/css">
    <script src="js/changeLanguage.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

</head>
<body>

<header>
    <div class="bg-dark" id="navbarHeader">
        <div class="container">
            <div class="row">
                <div class="col-md-9 py-4">
                    <h4 class="text-white"><fmt:message key="catalog.tts"/></h4>
                    <p class="text-muted"><fmt:message key="catalog.description"/></p>
                </div>
                <c:if test="${sessionScope.user.getTutor()}">
                    <div class="col-md-2">
                        <form action="addTestForm" method="get" name="createTestForm">
                            <button type="submit" class="btn btn-primary">Create test</button>
                        </form>
                    </div>
                </c:if>
                <div class="col-md-1">
                    <form action="logoutServlet" method="post" name="LogoutForm">
                        <button type="submit" class="btn btn-primary">Log out</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</header>
<form>
    <select id="lan" onchange="changeLanguage()">
        <option value="en" ${sessionScope.locale == 'en' ? 'selected' : ''}><fmt:message key="english"/></option>
        <option value="ru" ${sessionScope.locale == 'ru' ? 'selected' : ''}><fmt:message key="russian"/></option>
    </select>
</form>


<c:choose>
    <c:when test="${(requestScope.allTests ne null) && (not empty requestScope.allTests)}">
        <div class="album py-5 bg-light">
            <div class="container">
                <div class="row">
                    <c:forEach items="${requestScope.allTests}" var="test">
                        <div class="col-md-4">
                            <div class="card mb-4 box-shadow">
                                <c:choose>
                                    <c:when test="${test.getType().getName() eq 'Math'}">
                                    <c:if test="${sessionScope.user.getTutor()}">
                                        <div class="d-flex justify-content-end align-items-baseline">
                                          <a href="<c:url value="/delete?id=${test.getId()}"/>" class="btn btn-danger btn-xs">X</a>
                                        </div>
                                    </c:if>
                                        <img class="card-img-top test-img"
                                             src="images/math.png"
                                             alt="Card image cap">
                                    </c:when>
                                    <c:when test="${test.getType().getName() eq 'Physics'}">
                                    <c:if test="${sessionScope.user.getTutor()}">
                                      <div class="d-flex justify-content-end align-items-baseline">
                                          <a href="<c:url value="/delete?id=${test.getId()}"/>" class="btn btn-danger btn-xs">X</a>
                                      </div>
                                    </c:if>
                                        <img class="card-img-top test-img"
                                             src="images/physics.png"
                                             alt="Card image cap">
                                    </c:when>
                                    <c:when test="${test.getType().getName() eq 'Russian'}">
                                    <c:if test="${sessionScope.user.getTutor()}">
                                       <div class="d-flex justify-content-end align-items-baseline">
                                         <a href="<c:url value="/delete?id=${test.getId()}"/>" class="btn btn-danger btn-xs">X</a>
                                       </div>
                                    </c:if>
                                        <img class="card-img-top test-img"
                                             src="images/russian.png"
                                             alt="Card image cap">
                                    </c:when>
                                    <c:when test="${test.getType().getName() eq 'English'}">
                                    <c:if test="${sessionScope.user.getTutor()}">
                                       <div class="d-flex justify-content-end align-items-baseline">
                                         <a href="<c:url value="/delete?id=${test.getId()}"/>" class="btn btn-danger btn-xs">X</a>
                                       </div>
                                    </c:if>
                                        <img class="card-img-top test-img"
                                             src="images/english.png"
                                             alt="Card image cap">
                                    </c:when>
                                </c:choose>
                                <div class="card-body">
                                    <h5 class="card-title">${test.getName()}</h5>
                                    <p class="card-text">
                                    <c:if test="${test.getType().getName() eq 'Math'}">
                                    This is test for checking if your knowledges in Math is wide enough to become a Jedi Knight.
                                    </c:if>
                                    <c:if test="${test.getType().getName() eq 'Physics'}">
                                     This is test for checking if your knowledges in Physics is wide enough to become a Jedi Knight.
                                    </c:if>
                                    <c:if test="${test.getType().getName() eq 'Russian'}">
                                     This is test for checking if your knowledges in Russian is wide enough to become a Jedi Knight.
                                    </c:if>
                                    <c:if test="${test.getType().getName() eq 'English'}">
                                      This is test for checking if your knowledges in English is wide enough to become a Jedi Knight.
                                    </c:if>
                                    </p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <a href="<c:url value="/test?id=${test.getId()}"/>" class="btn btn-primary">Start
                                            test</a>
                                        <small class="text-muted">9 mins</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="container">
            <div class="row">
                <div class="<col-md-3"></div>
                <div class="<col-md-6">
                    <h1 class="mt-5">There is no tests yet</h1>
                    <p class="lead">We haven't created any test yet. Please come later, may be something will
                        change soon.</p>
                </div>
                <div class="<col-md-3"></div>
            </div>
        </div>
    </c:otherwise>
</c:choose>


<footer class="text-muted">
    <div class="container">
        <p class="float-right">
            <a href="#"><fmt:message key="catalog.back"/> </a>
        </p>
        <p><fmt:message key="catalog.developdescription"/></p>
        <p><fmt:message key="catalog.students"/></p>
        <p><fmt:message key="catalog.mentors"/></p>
    </div>
</footer>

</body>
</html>