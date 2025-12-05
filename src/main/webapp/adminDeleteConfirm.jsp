<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Xác nhận xóa</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background-color: #f5f5f5;
    }
    .confirmation-container {
      background-color: white;
      padding: 40px;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      text-align: center;
      max-width: 400px;
    }
    h2 {
      color: #333;
      margin-bottom: 20px;
    }
    .user-info {
      background-color: #f9f9f9;
      padding: 15px;
      border-radius: 4px;
      margin: 20px 0;
      text-align: left;
    }
    .button-group {
      display: flex;
      justify-content: space-between;
      margin-top: 30px;
    }
    .delete-btn,
    .cancel-btn {
      padding: 12px 30px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      text-decoration: none;
      font-size: 16px;
    }
    .delete-btn {
      background-color: #f44336;
      color: white;
    }
    .delete-btn:hover {
      background-color: #d32f2f;
    }
    .cancel-btn {
      background-color: #757575;
      color: white;
    }
    .cancel-btn:hover {
      background-color: #616161;
    }
    form {
      display: inline;
    }
  </style>
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