<%--
  Created by IntelliJ IDEA.
  User: jekim
  Date: 2022-09-15
  Time: 오전 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/123" method="POST">
        제목: <input type="text" name="title"><br>
        내용: <input type="text" name="content"><br>
        작성자: <input type="text" name="user"><br>
        <button type="submit">보내기</button>
        <button type="submit" formtarget="_blank">새 창에서 열기</button>
    </form>
    <br>
    <table >
        <thead>
        <tr>
            <th>ID</th>
            <th>제목</th>
            <th>내용</th>
            <th>작성자</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="list">
            <tr>
                <td>${list.id}</td>
                <td>${list.title}</td>
                <td>${list.content}</td>
                <td>${list.user}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
