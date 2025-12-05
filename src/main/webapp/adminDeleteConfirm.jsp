<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Xác nhận xóa</title>
  <link rel="stylesheet" type="text/css" href="styles/confirm-delete.css">
</head>
<body>
<div class="confirmation-container">
  <h2>Xác nhận xóa người dùng</h2>

  <p>Bạn có chắc chắn muốn xóa người dùng này?</p>

  <div class="user-info">
    <p><strong>Email:</strong> ${user.email}</p>
    <p><strong>Họ tên:</strong> ${user.firstName} ${user.lastName}</p>
    <p><strong>Ngày sinh:</strong> ${user.dateOfBirth}</p>
  </div>

  <div class="button-group">
    <form action="admin" method="post">
      <input type="hidden" name="action" value="delete">
      <input type="hidden" name="email" value="${user.email}">
      <button type="submit" class="delete-btn">Xác nhận xóa</button>
    </form>

    <a href="admin?action=list" class="cancel-btn">Hủy</a>
  </div>
</div>
</body>
</html>