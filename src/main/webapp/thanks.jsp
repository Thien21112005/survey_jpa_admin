<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Murach's Java Servlets and JSP</title>
  <link rel="stylesheet" href="styles/main.css" type="text/css" />
</head>

<body>
<h1>Cảm ơn bạn đã tham gia danh sách email của chúng tôi</h1>

<c:if test="${not empty message}">
  <p style="color: green; font-weight: bold;">${message}</p>
</c:if>

<p>Đây là thông tin bạn đã nhập:</p>

<table>
  <tr>
    <td><label>Email:</label></td>
    <td><span>${user.email}</span></td>
  </tr>
  <tr>
    <td><label>Họ:</label></td>
    <td><span>${user.firstName}</span></td>
  </tr>
  <tr>
    <td><label>Tên:</label></td>
    <td><span>${user.lastName}</span></td>
  </tr>
  <tr>
    <td><label>Ngày sinh:</label></td>
    <td><span>${user.dateOfBirth}</span></td>
  </tr>
  <tr>
    <td><label>Biết đến qua:</label></td>
    <td><span>
            <c:choose>
              <c:when test="${user.hearAboutUs == 'searchEngine'}">Công cụ tìm kiếm</c:when>
              <c:when test="${user.hearAboutUs == 'wordOfMouth'}">Người giới thiệu</c:when>
              <c:when test="${user.hearAboutUs == 'socialMedia'}">Mạng xã hội</c:when>
              <c:when test="${user.hearAboutUs == 'other'}">Khác</c:when>
              <c:otherwise>${user.hearAboutUs}</c:otherwise>
            </c:choose>
        </span></td>
  </tr>
  <tr>
    <td><label>Nhận thông báo:</label></td>
    <td><span>${user.wantAnnouncements ? 'Có' : 'Không'}</span></td>
  </tr>
  <tr>
    <td><label>Nhận email:</label></td>
    <td><span>${user.wantEmails ? 'Có' : 'Không'}</span></td>
  </tr>
  <tr>
    <td><label>Phương thức liên hệ:</label></td>
    <td><span>
            <c:choose>
              <c:when test="${user.contactMethod == 'emailOnly'}">Chỉ email</c:when>
              <c:when test="${user.contactMethod == 'postalOnly'}">Chỉ thư bưu điện</c:when>
              <c:when test="${user.contactMethod == 'emailOrPostal'}">Email hoặc thư bưu điện</c:when>
              <c:otherwise>${user.contactMethod}</c:otherwise>
            </c:choose>
        </span></td>
  </tr>
</table>

<p>Để nhập một địa chỉ email khác, nhấn nút Quay lại<br>
  trong trình duyệt của bạn hoặc nút Quay lại hiển thị bên dưới.
</p>
<form action="" method="get">
  <input type="hidden" name="action" value="join">
  <input type="submit" value="Quay lại">
</form>
</body>
</html>