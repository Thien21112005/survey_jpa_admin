<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${action == 'add' ? 'Thêm Người Dùng Mới' : 'Chỉnh Sửa Người Dùng'} | Admin System</title>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="styles/adminuserform.css">
</head>
<body>
<!-- Particle Background -->
<div class="particle-container">
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
</div>

<!-- Floating Elements -->
<div class="floating-element">
    <i class="fas fa-user-cog"></i>
</div>
<div class="floating-element">
    <i class="fas fa-database"></i>
</div>

<!-- Main Form Container -->
<div class="glass-form">
    <!-- Header -->
    <header class="form-header">
        <div class="header-shapes">
            <div class="shape"></div>
            <div class="shape"></div>
            <div class="shape"></div>
        </div>
        <div class="header-content">
            <div class="header-main">
                <div class="header-icon">
                    <i class="fas fa-user-${action == 'add' ? 'plus' : 'edit'}"></i>
                </div>
                <div class="header-text">
                    <h1><span>${action == 'add' ? 'Thêm' : 'Chỉnh Sửa'}</span> Người Dùng</h1>
                    <p>Quản lý thông tin chi tiết người dùng hệ thống</p>
                </div>
            </div>
            <div class="back-action">
                <a href="admin?action=list" class="back-btn">
                    <i class="fas fa-arrow-left"></i>
                    <span>Quay lại danh sách</span>
                </a>
            </div>
        </div>
    </header>

    <!-- Form -->
    <form action="admin" method="post" accept-charset="UTF-8" class="user-form">
        <input type="hidden" name="action" value="${action == 'add' ? 'add' : 'update'}">
        <c:if test="${action != 'add'}">
            <input type="hidden" name="email" value="${user.email}">
        </c:if>

        <!-- Personal Information -->
        <section class="form-section">
            <div class="section-header">
                <div class="section-icon">
                    <i class="fas fa-user-circle"></i>
                </div>
                <h2>Thông tin cá nhân</h2>
            </div>
            <div class="form-grid">
                <div class="form-group">
                    <label>
                        <i class="fas fa-user label-icon"></i>
                        Họ
                    </label>
                    <div class="input-wrapper">
                        <input type="text" name="firstName" value="${user.firstName}" required>
                        <div class="input-focus-border"></div>
                    </div>
                </div>

                <div class="form-group">
                    <label>
                        <i class="fas fa-signature label-icon"></i>
                        Tên
                    </label>
                    <div class="input-wrapper">
                        <input type="text" name="lastName" value="${user.lastName}" required>
                        <div class="input-focus-border"></div>
                    </div>
                </div>

                <div class="form-group">
                    <label>
                        <i class="fas fa-envelope label-icon"></i>
                        Địa chỉ email
                    </label>
                    <div class="input-wrapper">
                        <input type="email" name="email" value="${user.email}" ${action == 'add' ? 'required' : 'readonly'}>
                        <div class="input-focus-border"></div>
                    </div>
                </div>

                <div class="form-group">
                    <label>
                        <i class="fas fa-calendar-alt label-icon"></i>
                        Ngày sinh
                    </label>
                    <div class="input-wrapper">
                        <input type="text" name="dateOfBirth" value="${user.dateOfBirth}" required placeholder="dd/mm/yyyy">
                        <div class="input-focus-border"></div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Preferences -->
        <section class="form-section">
            <div class="section-header">
                <div class="section-icon">
                    <i class="fas fa-cog"></i>
                </div>
                <h2>Tùy chọn</h2>
            </div>
            <div class="form-grid">
                <div class="form-group full-width">
                    <label>
                        <i class="fas fa-search-location label-icon"></i>
                        Biết về chúng tôi qua
                    </label>
                    <div class="selection-group">
                        <div class="radio-group">
                            <label class="selection-item">
                                <input type="radio" name="hearAboutUs" value="searchEngine" ${user.hearAboutUs == 'searchEngine' ? 'checked' : ''}>
                                <div class="selection-card">
                                    <div class="selection-icon">
                                        <i class="fas fa-search"></i>
                                    </div>
                                    <div class="selection-content">
                                        <div class="selection-title">Tìm kiếm</div>
                                        <div class="selection-description">Google, Bing, v.v.</div>
                                    </div>
                                </div>
                            </label>
                            <label class="selection-item">
                                <input type="radio" name="hearAboutUs" value="wordOfMouth" ${user.hearAboutUs == 'wordOfMouth' ? 'checked' : ''}>
                                <div class="selection-card">
                                    <div class="selection-icon">
                                        <i class="fas fa-comment-dots"></i>
                                    </div>
                                    <div class="selection-content">
                                        <div class="selection-title">Giới thiệu</div>
                                        <div class="selection-description">Bạn bè, đồng nghiệp</div>
                                    </div>
                                </div>
                            </label>
                            <label class="selection-item">
                                <input type="radio" name="hearAboutUs" value="socialMedia" ${user.hearAboutUs == 'socialMedia' ? 'checked' : ''}>
                                <div class="selection-card">
                                    <div class="selection-icon">
                                        <i class="fas fa-hashtag"></i>
                                    </div>
                                    <div class="selection-content">
                                        <div class="selection-title">Mạng xã hội</div>
                                        <div class="selection-description">Facebook, Twitter, Instagram</div>
                                    </div>
                                </div>
                            </label>
                            <label class="selection-item">
                                <input type="radio" name="hearAboutUs" value="other" ${user.hearAboutUs == 'other' ? 'checked' : ''}>
                                <div class="selection-card">
                                    <div class="selection-icon">
                                        <i class="fas fa-ellipsis-h"></i>
                                    </div>
                                    <div class="selection-content">
                                        <div class="selection-title">Khác</div>
                                        <div class="selection-description">Phương thức khác</div>
                                    </div>
                                </div>
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group full-width">
                    <label>
                        <i class="fas fa-bell label-icon"></i>
                        Thông báo
                    </label>
                    <div class="selection-group">
                        <div class="checkbox-group">
                            <label class="selection-item">
                                <input type="checkbox" name="wantAnnouncements" ${user.wantAnnouncements ? 'checked' : ''}>
                                <div class="checkbox-card">
                                    <div class="checkbox-icon"></div>
                                    <div class="selection-content">
                                        <div class="selection-title">Muốn nhận thông báo</div>
                                        <div class="selection-description">Cập nhật và thông báo mới nhất</div>
                                    </div>
                                </div>
                            </label>
                            <label class="selection-item">
                                <input type="checkbox" name="wantEmails" ${user.wantEmails ? 'checked' : ''}>
                                <div class="checkbox-card">
                                    <div class="checkbox-icon"></div>
                                    <div class="selection-content">
                                        <div class="selection-title">Muốn nhận email quảng cáo</div>
                                        <div class="selection-description">Khuyến mãi và ưu đãi đặc biệt</div>
                                    </div>
                                </div>
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group full-width">
                    <label>
                        <i class="fas fa-envelope-open-text label-icon"></i>
                        Phương thức liên hệ
                    </label>
                    <div class="selection-group">
                        <div class="radio-group">
                            <label class="selection-item">
                                <input type="radio" name="contactMethod" value="emailOnly" ${user.contactMethod == 'emailOnly' ? 'checked' : ''}>
                                <div class="selection-card">
                                    <div class="selection-icon">
                                        <i class="fas fa-envelope"></i>
                                    </div>
                                    <div class="selection-content">
                                        <div class="selection-title">Chỉ email</div>
                                        <div class="selection-description">Nhận thông tin qua email</div>
                                    </div>
                                </div>
                            </label>
                            <label class="selection-item">
                                <input type="radio" name="contactMethod" value="postalOnly" ${user.contactMethod == 'postalOnly' ? 'checked' : ''}>
                                <div class="selection-card">
                                    <div class="selection-icon">
                                        <i class="fas fa-mail-bulk"></i>
                                    </div>
                                    <div class="selection-content">
                                        <div class="selection-title">Chỉ thư</div>
                                        <div class="selection-description">Nhận thông tin qua bưu điện</div>
                                    </div>
                                </div>
                            </label>
                            <label class="selection-item">
                                <input type="radio" name="contactMethod" value="emailOrPostal" ${user.contactMethod == 'emailOrPostal' ? 'checked' : ''}>
                                <div class="selection-card">
                                    <div class="selection-icon">
                                        <i class="fas fa-mailbox"></i>
                                    </div>
                                    <div class="selection-content">
                                        <div class="selection-title">Email hoặc thư</div>
                                        <div class="selection-description">Linh hoạt cả hai phương thức</div>
                                    </div>
                                </div>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Submit Button -->
        <div class="submit-section">
            <button type="submit" class="action-btn submit-btn">
                <i class="fas fa-save"></i>
                <span>${action == 'add' ? 'Thêm Người Dùng' : 'Cập Nhật Thông Tin'}</span>
            </button>
            <a href="admin?action=list" class="action-btn cancel-btn">
                <i class="fas fa-times"></i>
                <span>Hủy bỏ</span>
            </a>
        </div>
    </form>
</div>

<script>
    // Function to show notification - SỬA LỖI CÚ PHÁP
    function showNotification(message, type) {
        // Tạo thông báo
        const notification = document.createElement('div');
        notification.className = 'notification ' + type;
        notification.style.cssText =
            'position: fixed;' +
            'top: 20px;' +
            'right: 20px;' +
            'padding: 15px 20px;' +
            'border-radius: 8px;' +
            'color: white;' +
            'font-weight: 500;' +
            'z-index: 10000;' +
            'animation: slideIn 0.3s ease;' +
            'box-shadow: 0 4px 12px rgba(0,0,0,0.15);';

        // SỬA LẠI: Dùng JavaScript thay vì EL
        if (type === 'success') {
            notification.style.background = 'linear-gradient(135deg, #4CAF50, #45a049)';
        } else if (type === 'error') {
            notification.style.background = 'linear-gradient(135deg, #F44336, #D32F2F)';
        }

        // SỬA LẠI: Dùng JavaScript thuần
        const iconClass = type === 'success' ? 'fa-check-circle' : 'fa-exclamation-circle';
        notification.innerHTML =
            '<i class="fas ' + iconClass + '"></i>' +
            '<span style="margin-left: 10px;">' + message + '</span>';

        document.body.appendChild(notification);

        // Tự động xóa sau 3 giây
        setTimeout(() => {
            notification.style.animation = 'slideOut 0.3s ease';
            setTimeout(() => {
                if (notification.parentNode) {
                    notification.parentNode.removeChild(notification);
                }
            }, 300);
        }, 3000);
    }
</script>
</body>
</html>