<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard</title>
  <link rel="stylesheet" type="text/css" href="styles/admindashboard.css">
</head>
<body>
<div class="header">
  <h1>Admin Dashboard - Quản lý Người dùng</h1>
  <a href="admin?action=logout" class="logout-btn">Đăng xuất</a>
</div>

<a href="admin?action=add" class="add-btn">+ Thêm người dùng mới</a>

<c:if test="${empty users}">
  <p>Không có người dùng nào trong hệ thống.</p>
</c:if>

<c:if test="${not empty users}">
  <table>
    <thead>
    <tr>
      <th>Email</th>
      <th>Họ</th>
      <th>Tên</th>
      <th>Ngày sinh</th>
      <th>Biết qua</th>
      <th>Thông báo</th>
      <th>Email QC</th>
      <th>Liên hệ</th>
      <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${users}">
      <tr>
        <td>${user.email}</td>
        <td>${user.firstName}</td>
        <td>${user.lastName}</td>
        <td>${user.dateOfBirth}</td>
        <td>
          <c:choose>
            <c:when test="${user.hearAboutUs == 'searchEngine'}">Tìm kiếm</c:when>
            <c:when test="${user.hearAboutUs == 'wordOfMouth'}">Giới thiệu</c:when>
            <c:when test="${user.hearAboutUs == 'socialMedia'}">Mạng xã hội</c:when>
            <c:when test="${user.hearAboutUs == 'other'}">Khác</c:when>
            <c:otherwise>${user.hearAboutUs}</c:otherwise>
          </c:choose>
        </td>
        <td>${user.wantAnnouncements ? 'Có' : 'Không'}</td>
        <td>${user.wantEmails ? 'Có' : 'Không'}</td>
        <td>
          <c:choose>
            <c:when test="${user.contactMethod == 'emailOnly'}">Chỉ email</c:when>
            <c:when test="${user.contactMethod == 'postalOnly'}">Chỉ thư</c:when>
            <c:when test="${user.contactMethod == 'emailOrPostal'}">Email/Thư</c:when>
            <c:otherwise>${user.contactMethod}</c:otherwise>
          </c:choose>
        </td>
        <td class="action-links">
          <a href="admin?action=edit&email=${user.email}" class="edit-btn">Sửa</a>
          <a href="admin?action=delete&email=${user.email}" class="delete-btn">Xóa</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</c:if>

<a href="index.html" class="back-link">← Quay lại trang chủ</a>
</body>
</html>