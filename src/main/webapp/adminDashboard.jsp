<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      background-color: #f5f5f5;
    }
    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 30px;
      padding-bottom: 15px;
      border-bottom: 2px solid #4CAF50;
    }
    h1 {
      color: #333;
      margin: 0;
    }
    .logout-btn {
      background-color: #f44336;
      color: white;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 4px;
    }
    .logout-btn:hover {
      background-color: #d32f2f;
    }
    .add-btn {
      background-color: #4CAF50;
      color: white;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 4px;
      margin-bottom: 20px;
      display: inline-block;
    }
    .add-btn:hover {
      background-color: #45a049;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      background-color: white;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    th, td {
      border: 1px solid #ddd;
      padding: 12px;
      text-align: left;
    }
    th {
      background-color: #f2f2f2;
      font-weight: bold;
    }
    tr:hover {
      background-color: #f9f9f9;
    }
    .action-links a {
      margin-right: 10px;
      text-decoration: none;
      padding: 5px 10px;
      border-radius: 3px;
    }
    .edit-btn {
      background-color: #2196F3;
      color: white;
    }
    .edit-btn:hover {
      background-color: #0b7dda;
    }
    .delete-btn {
      background-color: #f44336;
      color: white;
    }
    .delete-btn:hover {
      background-color: #d32f2f;
    }
    .back-link {
      display: inline-block;
      margin-top: 20px;
      color: #666;
      text-decoration: none;
    }
    .back-link:hover {
      color: #333;
    }
  </style>
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