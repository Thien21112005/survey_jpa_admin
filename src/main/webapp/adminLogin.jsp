<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập Admin</title>
    <link rel="stylesheet" type="text/css" href="styles/login.css">
</head>
<body>
<div class="login-container">
    <h2>Đăng nhập Admin</h2>

    <%-- Hiển thị thông báo lỗi nếu có --%>
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <form action="admin" method="post">
        <input type="hidden" name="action" value="login">

        <label for="username">Tên đăng nhập:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Mật khẩu:</label>
        <input type="password" id="password" name="password" required>

        <input type="submit" value="Đăng nhập">
    </form>

    <a href="index.html" class="back-link">← Quay lại trang chủ</a>
</div>
</body>
</html>