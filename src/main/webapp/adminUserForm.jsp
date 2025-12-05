<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${action == 'add' ? 'Thêm người dùng' : 'Sửa người dùng'}</title>
    <link rel="stylesheet" type="text/css" href="styles/user-form.css">
</head>
<body>
<div class="form-container">
    <h2>${action == 'add' ? 'Thêm người dùng mới' : 'Sửa thông tin người dùng'}</h2>

    <form action="admin" method="post">
        <input type="hidden" name="action" value="${action}">

        <c:if test="${action == 'update'}">
            <input type="hidden" name="email" value="${user.email}">
        </c:if>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email"
               value="${user.email}"
        ${action == 'update' ? 'readonly' : ''} required>

        <label for="firstName">Họ:</label>
        <input type="text" id="firstName" name="firstName"
               value="${user.firstName}" required>

        <label for="lastName">Tên:</label>
        <input type="text" id="lastName" name="lastName"
               value="${user.lastName}" required>

        <label for="dateOfBirth">Ngày sinh:</label>
        <input type="text" id="dateOfBirth" name="dateOfBirth"
               value="${user.dateOfBirth}" placeholder="dd/mm/yyyy" required>

        <label for="hearAboutUs">Biết đến qua:</label>
        <select id="hearAboutUs" name="hearAboutUs">
            <option value="searchEngine" ${user.hearAboutUs == 'searchEngine' ? 'selected' : ''}>
                Công cụ tìm kiếm
            </option>
            <option value="wordOfMouth" ${user.hearAboutUs == 'wordOfMouth' ? 'selected' : ''}>
                Người giới thiệu
            </option>
            <option value="socialMedia" ${user.hearAboutUs == 'socialMedia' ? 'selected' : ''}>
                Mạng xã hội
            </option>
            <option value="other" ${user.hearAboutUs == 'other' ? 'selected' : ''}>
                Khác
            </option>
        </select>

        <div class="checkbox-group">
            <input type="checkbox" id="wantAnnouncements" name="wantAnnouncements"
                   value="yes" ${user.wantAnnouncements ? 'checked' : ''}>
            <label for="wantAnnouncements">Nhận thông báo</label>
        </div>

        <div class="checkbox-group">
            <input type="checkbox" id="wantEmails" name="wantEmails"
                   value="yes" ${user.wantEmails ? 'checked' : ''}>
            <label for="wantEmails">Nhận email quảng cáo</label>
        </div>

        <label for="contactMethod">Phương thức liên hệ:</label>
        <select id="contactMethod" name="contactMethod">
            <option value="emailOrPostal" ${user.contactMethod == 'emailOrPostal' ? 'selected' : ''}>
                Email hoặc thư bưu điện
            </option>
            <option value="emailOnly" ${user.contactMethod == 'emailOnly' ? 'selected' : ''}>
                Chỉ email
            </option>
            <option value="postalOnly" ${user.contactMethod == 'postalOnly' ? 'selected' : ''}>
                Chỉ thư bưu điện
            </option>
        </select>

        <div class="button-group">
            <input type="submit" value="${action == 'add' ? 'Thêm' : 'Cập nhật'}">
            <a href="admin?action=list" class="cancel-btn">Hủy</a>
        </div>
    </form>
</div>
</body>
</html>