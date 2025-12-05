<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập Admin | Murach's Java Servlets and JSP</title>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="styles/login.css">
</head>
<body>
<!-- Background Animation -->
<div class="bg-animation">
    <div class="circle circle-1"></div>
    <div class="circle circle-2"></div>
    <div class="circle circle-3"></div>
</div>

<!-- Login Container -->
<div class="login-container">
    <!-- Decorative Header -->
    <div class="login-header">
        <div class="logo-wrapper">
            <div class="logo-circle">
                <i class="fas fa-user-shield"></i>
            </div>
            <div class="logo-text">
                <h1 class="system-name">Admin System</h1>
                <p class="system-subtitle">Murach's Java Servlets and JSP</p>
            </div>
        </div>

        <div class="security-badge">
            <i class="fas fa-shield-alt"></i>
            <span>Khu vực bảo mật</span>
        </div>
    </div>

    <!-- Login Form -->
    <div class="login-form-wrapper">
        <div class="form-header">
            <h2><i class="fas fa-sign-in-alt"></i> Đăng nhập Admin</h2>
            <p>Vui lòng nhập thông tin đăng nhập để truy cập bảng điều khiển</p>
        </div>

        <%-- Hiển thị thông báo lỗi nếu có --%>
        <c:if test="${not empty error}">
            <div class="error-alert">
                <div class="alert-icon">
                    <i class="fas fa-exclamation-triangle"></i>
                </div>
                <div class="alert-content">
                    <strong>Đăng nhập thất bại</strong>
                    <p>${error}</p>
                </div>
                <button type="button" class="alert-close">
                    <i class="fas fa-times"></i>
                </button>
            </div>
        </c:if>

        <form action="admin" method="post" class="login-form" id="loginForm">
            <input type="hidden" name="action" value="login">

            <div class="input-group">
                <div class="input-icon">
                    <i class="fas fa-user"></i>
                </div>
                <div class="input-wrapper">
                    <label for="username">Tên đăng nhập</label>
                    <input type="text" id="username" name="username" required
                           placeholder="Nhập tên đăng nhập của bạn" value="admin">
                    <div class="input-focus-line"></div>
                </div>
            </div>

            <div class="input-group">
                <div class="input-icon">
                    <i class="fas fa-lock"></i>
                </div>
                <div class="input-wrapper">
                    <label for="password">Mật khẩu</label>
                    <div class="password-wrapper">
                        <input type="password" id="password" name="password" required
                               placeholder="Nhập mật khẩu của bạn" value="admin">
                        <button type="button" class="toggle-password" id="togglePassword">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                    <div class="input-focus-line"></div>
                </div>
            </div>

            <div class="form-options">
                <label class="remember-me">
                    <input type="checkbox" name="remember" id="remember">
                    <span class="checkmark"></span>
                    <span class="remember-text">Ghi nhớ đăng nhập</span>
                </label>
                <a href="#" class="forgot-password">
                    <i class="fas fa-key"></i>
                    Quên mật khẩu?
                </a>
            </div>

            <button type="submit" class="login-button" id="loginButton">
                <span class="button-text">Đăng nhập</span>
                <i class="fas fa-arrow-right button-icon"></i>
            </button>

            <div class="login-divider">
                <span class="divider-line"></span>
                <span class="divider-text">Hoặc</span>
                <span class="divider-line"></span>
            </div>

            <div class="alternative-login">
                <p>Đăng nhập bằng cách khác</p>
                <div class="social-login">
                    <button type="button" class="social-btn google">
                        <i class="fab fa-google"></i>
                        Google
                    </button>
                    <button type="button" class="social-btn microsoft">
                        <i class="fab fa-microsoft"></i>
                        Microsoft
                    </button>
                </div>
            </div>
        </form>

        <div class="login-footer">
            <a href="index.html" class="back-home">
                <i class="fas fa-arrow-left"></i>
                <span>Quay lại trang chủ</span>
            </a>

            <div class="security-info">
                <p>
                    <i class="fas fa-info-circle"></i>
                    Đây là khu vực quản trị. Chỉ nhân viên được ủy quyền mới được truy cập.
                </p>
            </div>
        </div>
    </div>

    <!-- Security Tips -->
    <div class="security-tips">
        <h3><i class="fas fa-lightbulb"></i> Mẹo bảo mật</h3>
        <ul>
            <li>
                <i class="fas fa-check-circle"></i>
                <span>Không chia sẻ thông tin đăng nhập của bạn</span>
            </li>
            <li>
                <i class="fas fa-check-circle"></i>
                <span>Đăng xuất sau khi hoàn thành công việc</span>
            </li>
            <li>
                <i class="fas fa-check-circle"></i>
                <span>Sử dụng mật khẩu mạnh và thay đổi thường xuyên</span>
            </li>
            <li>
                <i class="fas fa-check-circle"></i>
                <span>Báo cáo ngay nếu phát hiện hoạt động đáng ngờ</span>
            </li>
        </ul>
    </div>
</div>

<!-- JavaScript -->
<script>
    // Toggle password visibility
    const togglePassword = document.getElementById('togglePassword');
    const password = document.getElementById('password');

    togglePassword.addEventListener('click', function() {
        const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
        password.setAttribute('type', type);

        // Toggle icon
        const icon = this.querySelector('i');
        if (type === 'password') {
            icon.className = 'fas fa-eye';
            this.setAttribute('title', 'Hiển thị mật khẩu');
        } else {
            icon.className = 'fas fa-eye-slash';
            this.setAttribute('title', 'Ẩn mật khẩu');
        }
    });

    // Close error alert
    const closeAlert = document.querySelector('.alert-close');
    if (closeAlert) {
        closeAlert.addEventListener('click', function() {
            this.closest('.error-alert').style.display = 'none';
        });
    }

    // Form validation and focus effects
    const inputs = document.querySelectorAll('input');
    inputs.forEach(input => {
        // Add focus effect
        input.addEventListener('focus', function() {
            this.parentElement.parentElement.classList.add('focused');
        });

        input.addEventListener('blur', function() {
            if (this.value === '') {
                this.parentElement.parentElement.classList.remove('focused');
            }
        });

        // Check if input has value on page load
        if (input.value !== '') {
            input.parentElement.parentElement.classList.add('focused');
        }
    });

    // Form submission
    const loginForm = document.getElementById('loginForm');
    const loginButton = document.getElementById('loginButton');

    loginForm.addEventListener('submit', function(e) {
        // Prevent default only if we want to handle it manually
        // e.preventDefault(); // Comment this line to allow normal form submission

        // Show loading state
        const buttonText = loginButton.querySelector('.button-text');
        const originalText = buttonText.textContent;

        // Only show loading if form is valid
        if (loginForm.checkValidity()) {
            buttonText.textContent = 'Đang xác thực...';
            loginButton.disabled = true;
            loginButton.classList.add('loading');

            // Allow form to submit normally
            // Remove setTimeout that was preventing form submission
            // The form will submit and page will reload/redirect

            // If you want to see if the form is actually submitting, add a console log
            console.log('Form is submitting...');
        } else {
            // If form is invalid, prevent submission and show validation messages
            e.preventDefault();
        }
    });

    // Debug: Log form submission
    loginForm.addEventListener('submit', function() {
        console.log('Form submitted!');
    });
</script>
</body>
</html>