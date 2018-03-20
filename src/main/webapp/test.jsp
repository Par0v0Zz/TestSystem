<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Test Page</title>
    <link rel="stylesheet" href="css/catalog.css" type="text/css">
</head>
<body>

<h1>${test.getName()}</h1>
<form action="" method="POST">
<ul>
    <c:forEach items="${test.getQuest()}" var="q">
        <c:set var="correctAnswers" value="0"/><c:forEach items="${q.getAnswers()}" var="a"><c:if test="${a.getRight()}"><c:set var="correctAnswers" value="${correctAnswers+1}"/></c:if></c:forEach>
        <li>
            <p><b>${q.getText()}</b></p>
                <c:forEach items="${q.getAnswers()}" var="a">
                    <c:if test="${correctAnswers == 1}">
                        <p><input name="q${q.getId()}" type="radio" value="${a.getId()}">${a.getText()}</p>
                    </c:if>
                    <c:if test="${correctAnswers > 1}">
                        <p><input name="q${q.getId()}" type="checkbox" value="${a.getId()}">${a.getText()}</p>
                    </c:if>
                </c:forEach>
        </li>
    </c:forEach>
</ul>
<input type="hidden" name="testId" value="${test.getId()}">
<p><input type="submit" value="Отправить"></p>
</form>

</body>
</html>