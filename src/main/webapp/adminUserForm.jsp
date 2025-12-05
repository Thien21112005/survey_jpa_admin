<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${action == 'add' ? 'Thêm người dùng' : 'Sửa người dùng'} | Admin System</title>
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="styles/user-form.css">
</head>
<body>
<!-- Background Animation -->
<div class="bg-animation">
    <div class="circle circle-1"></div>
    <div class="circle circle-2"></div>
    <div class="circle circle-3"></div>
</div>

<!-- Main Form Container -->
<div class="form-container">
    <!-- Header Section -->
    <header class="form-header">
        <div class="header-icon">
            <i class="fas ${action == 'add' ? 'fa-user-plus' : 'fa-user-edit'}"></i>
        </div>
        <div class="header-content">
            <h1>${action == 'add' ? 'Thêm người dùng mới' : 'Sửa thông tin người dùng'}</h1>
            <p class="subtitle">
                ${action == 'add' ?
                        'Điền thông tin để thêm người dùng mới vào hệ thống' :
                        'Cập nhật thông tin người dùng hiện tại'}
            </p>
        </div>
        <div class="form-step">
            <div class="step-indicator active">1</div>
            <div class="step-indicator ${action == 'update' ? 'active' : ''}">2</div>
            <div class="step-indicator">3</div>
        </div>
    </header>

    <!-- Main Form -->
    <form action="admin" method="post" class="user-form" id="userForm">
        <input type="hidden" name="action" value="${action}">

        <c:if test="${action == 'update'}">
            <input type="hidden" name="originalEmail" value="${user.email}">
        </c:if>

        <!-- Basic Information Section -->
        <section class="form-section">
            <div class="section-header">
                <i class="fas fa-id-card"></i>
                <h2>Thông tin cơ bản</h2>
            </div>

            <div class="form-grid">
                <!-- Email Input -->
                <div class="input-group floating-label">
                    <div class="input-icon">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <div class="input-wrapper">
                        <input type="email" id="email" name="email"
                               value="${user.email}"
                        ${action == 'update' ? 'readonly' : ''}
                               required
                               class="form-control"
                               placeholder=" ">
                        <label for="email">Địa chỉ email</label>
                        <div class="input-focus-line"></div>
                    </div>
                    <c:if test="${action == 'update'}">
                        <div class="input-note">
                            <i class="fas fa-info-circle"></i>
                            Email không thể thay đổi
                        </div>
                    </c:if>
                </div>

                <!-- First Name Input -->
                <div class="input-group floating-label">
                    <div class="input-icon">
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="input-wrapper">
                        <input type="text" id="firstName" name="firstName"
                               value="${user.firstName}"
                               required
                               class="form-control"
                               placeholder=" ">
                        <label for="firstName">Họ</label>
                        <div class="input-focus-line"></div>
                    </div>
                </div>

                <!-- Last Name Input -->
                <div class="input-group floating-label">
                    <div class="input-icon">
                        <i class="fas fa-signature"></i>
                    </div>
                    <div class="input-wrapper">
                        <input type="text" id="lastName" name="lastName"
                               value="${user.lastName}"
                               required
                               class="form-control"
                               placeholder=" ">
                        <label for="lastName">Tên</label>
                        <div class="input-focus-line"></div>
                    </div>
                </div>

                <!-- Date of Birth Input -->
                <div class="input-group floating-label">
                    <div class="input-icon">
                        <i class="fas fa-calendar-alt"></i>
                    </div>
                    <div class="input-wrapper">
                        <input type="text" id="dateOfBirth" name="dateOfBirth"
                               value="${user.dateOfBirth}"
                               required
                               class="form-control date-input"
                               placeholder=" "
                               pattern="\d{2}/\d{2}/\d{4}"
                               title="Định dạng ngày: dd/mm/yyyy">
                        <label for="dateOfBirth">Ngày sinh (dd/mm/yyyy)</label>
                        <div class="input-focus-line"></div>
                    </div>
                    <div class="input-note">
                        <i class="fas fa-calendar-check"></i>
                        Ví dụ: 25/12/1990
                    </div>
                </div>
            </div>
        </section>

        <!-- Preferences Section -->
        <section class="form-section">
            <div class="section-header">
                <i class="fas fa-sliders-h"></i>
                <h2>Tùy chọn và sở thích</h2>
            </div>

            <!-- How did you hear about us -->
            <div class="input-group">
                <div class="input-label">
                    <i class="fas fa-bullhorn"></i>
                    <label for="hearAboutUs">Biết đến chúng tôi qua</label>
                </div>
                <div class="select-wrapper">
                    <select id="hearAboutUs" name="hearAboutUs" class="form-control select-box">
                        <option value="searchEngine" ${user.hearAboutUs == 'searchEngine' ? 'selected' : ''}>
                            <i class="fas fa-search"></i> Công cụ tìm kiếm
                        </option>
                        <option value="wordOfMouth" ${user.hearAboutUs == 'wordOfMouth' ? 'selected' : ''}>
                            <i class="fas fa-comments"></i> Người giới thiệu
                        </option>
                        <option value="socialMedia" ${user.hearAboutUs == 'socialMedia' ? 'selected' : ''}>
                            <i class="fas fa-hashtag"></i> Mạng xã hội
                        </option>
                        <option value="other" ${user.hearAboutUs == 'other' ? 'selected' : ''}>
                            <i class="fas fa-ellipsis-h"></i> Khác
                        </option>
                    </select>
                    <div class="select-arrow">
                        <i class="fas fa-chevron-down"></i>
                    </div>
                </div>
            </div>

            <!-- Notification Preferences -->
            <div class="preferences-group">
                <div class="preferences-label">
                    <i class="fas fa-bell"></i>
                    <span>Tùy chọn thông báo</span>
                </div>

                <div class="checkbox-options">
                    <div class="checkbox-option">
                        <input type="checkbox" id="wantAnnouncements" name="wantAnnouncements"
                               value="yes" ${user.wantAnnouncements ? 'checked' : ''}
                               class="checkbox-input">
                        <label for="wantAnnouncements" class="checkbox-label">
                            <div class="checkbox-box">
                                <i class="fas fa-check"></i>
                            </div>
                            <div class="checkbox-content">
                                <span class="checkbox-title">Nhận thông báo</span>
                                <span class="checkbox-description">Thông báo về CD mới và ưu đãi đặc biệt</span>
                            </div>
                        </label>
                    </div>

                    <div class="checkbox-option">
                        <input type="checkbox" id="wantEmails" name="wantEmails"
                               value="yes" ${user.wantEmails ? 'checked' : ''}
                               class="checkbox-input">
                        <label for="wantEmails" class="checkbox-label">
                            <div class="checkbox-box">
                                <i class="fas fa-check"></i>
                            </div>
                            <div class="checkbox-content">
                                <span class="checkbox-title">Nhận email quảng cáo</span>
                                <span class="checkbox-description">Email về sản phẩm và khuyến mãi</span>
                            </div>
                        </label>
                    </div>
                </div>
            </div>

            <!-- Contact Method -->
            <div class="input-group">
                <div class="input-label">
                    <i class="fas fa-address-book"></i>
                    <label for="contactMethod">Phương thức liên hệ ưa thích</label>
                </div>
                <div class="select-wrapper">
                    <select id="contactMethod" name="contactMethod" class="form-control select-box">
                        <option value="emailOrPostal" ${user.contactMethod == 'emailOrPostal' ? 'selected' : ''}>
                            <i class="fas fa-mailbox"></i> Email hoặc thư bưu điện
                        </option>
                        <option value="emailOnly" ${user.contactMethod == 'emailOnly' ? 'selected' : ''}>
                            <i class="fas fa-envelope"></i> Chỉ email
                        </option>
                        <option value="postalOnly" ${user.contactMethod == 'postalOnly' ? 'selected' : ''}>
                            <i class="fas fa-mail-bulk"></i> Chỉ thư bưu điện
                        </option>
                    </select>
                    <div class="select-arrow">
                        <i class="fas fa-chevron-down"></i>
                    </div>
                </div>
            </div>
        </section>

        <!-- Form Actions -->
        <div class="form-actions">
            <div class="action-buttons">
                <button type="submit" class="submit-btn">
                    <i class="fas ${action == 'add' ? 'fa-user-plus' : 'fa-save'}"></i>
                    <span class="btn-text">${action == 'add' ? 'Thêm người dùng' : 'Cập nhật thông tin'}</span>
                    <i class="fas fa-arrow-right btn-arrow"></i>
                </button>

                <a href="admin?action=list" class="cancel-btn">
                    <i class="fas fa-times"></i>
                    <span>Hủy bỏ</span>
                </a>
            </div>

            <div class="form-note">
                <i class="fas fa-shield-alt"></i>
                <span>Thông tin người dùng sẽ được bảo mật theo chính sách riêng tư của chúng tôi</span>
            </div>
        </div>

        <!-- Form Progress -->
        <div class="form-progress">
            <div class="progress-bar">
                <div class="progress-fill" id="progressFill"></div>
            </div>
            <div class="progress-text">
                <span id="progressText">Đang hoàn thành thông tin...</span>
                <span id="progressPercent">0%</span>
            </div>
        </div>
    </form>

    <!-- Form Help -->
    <div class="form-help">
        <div class="help-item">
            <i class="fas fa-question-circle"></i>
            <div class="help-content">
                <h3>Cần hỗ trợ?</h3>
                <p>Liên hệ quản trị viên nếu bạn cần trợ giúp khi điền thông tin</p>
            </div>
        </div>
        <div class="help-item">
            <i class="fas fa-clock"></i>
            <div class="help-content">
                <h3>Thời gian xử lý</h3>
                <p>Thông tin sẽ được cập nhật ngay lập tức sau khi gửi</p>
            </div>
        </div>
    </div>
</div>

<!-- JavaScript -->
<script>
    // Form Validation and Progress
    const form = document.getElementById('userForm');
    const progressFill = document.getElementById('progressFill');
    const progressText = document.getElementById('progressText');
    const progressPercent = document.getElementById('progressPercent');

    // Form fields
    const fields = [
        { id: 'email', required: true },
        { id: 'firstName', required: true },
        { id: 'lastName', required: true },
        { id: 'dateOfBirth', required: true },
        { id: 'hearAboutUs', required: false },
        { id: 'contactMethod', required: false }
    ];

    // Calculate form completion
    function calculateProgress() {
        let completed = 0;
        let totalRequired = 0;

        fields.forEach(field => {
            const element = document.getElementById(field.id);
            if (element) {
                if (field.required) {
                    totalRequired++;
                    if (element.value.trim() !== '' &&
                        (element.type !== 'checkbox' || element.checked)) {
                        completed++;
                    }
                }
            }
        });

        // Add checkboxes
        const wantAnnouncements = document.getElementById('wantAnnouncements');
        const wantEmails = document.getElementById('wantEmails');

        // Checkboxes are optional, so we don't count them in required total
        // But we can count them as bonus completion if filled

        const progress = totalRequired > 0 ? (completed / totalRequired) * 100 : 0;

        // Update progress bar
        progressFill.style.width = `${progress}%`;
        progressPercent.textContent = `${Math.round(progress)}%`;

        // Update progress text
        if (progress === 0) {
            progressText.textContent = 'Bắt đầu điền thông tin...';
        } else if (progress < 50) {
            progressText.textContent = 'Đang hoàn thành thông tin cơ bản...';
        } else if (progress < 100) {
            progressText.textContent = 'Gần hoàn tất...';
        } else {
            progressText.textContent = 'Thông tin đã đầy đủ!';
        }

        return progress;
    }

    // Update progress on input
    fields.forEach(field => {
        const element = document.getElementById(field.id);
        if (element) {
            element.addEventListener('input', calculateProgress);
            element.addEventListener('change', calculateProgress);
        }
    });

    // Initialize progress
    document.addEventListener('DOMContentLoaded', function() {
        calculateProgress();

        // Add date validation
        const dateInput = document.getElementById('dateOfBirth');
        if (dateInput) {
            dateInput.addEventListener('blur', function() {
                validateDate(this);
            });
        }

        // Add floating label effect
        const floatingInputs = document.querySelectorAll('.floating-label .form-control');
        floatingInputs.forEach(input => {
            // Check initial value
            if (input.value.trim() !== '') {
                input.parentElement.classList.add('has-value');
            }

            input.addEventListener('focus', function() {
                this.parentElement.classList.add('focused');
            });

            input.addEventListener('blur', function() {
                this.parentElement.classList.remove('focused');
                if (this.value.trim() !== '') {
                    this.parentElement.classList.add('has-value');
                } else {
                    this.parentElement.classList.remove('has-value');
                }
            });
        });
    });

    // Date validation
    function validateDate(input) {
        const datePattern = /^(\d{2})\/(\d{2})\/(\d{4})$/;
        const match = input.value.match(datePattern);

        if (!match) {
            showError(input, 'Định dạng ngày không hợp lệ. Vui lòng nhập theo định dạng dd/mm/yyyy');
            return false;
        }

        const day = parseInt(match[1], 10);
        const month = parseInt(match[2], 10);
        const year = parseInt(match[3], 10);

        // Check date validity
        const date = new Date(year, month - 1, day);
        if (date.getFullYear() !== year ||
            date.getMonth() !== month - 1 ||
            date.getDate() !== day) {
            showError(input, 'Ngày không hợp lệ');
            return false;
        }

        // Check if date is in the future
        const today = new Date();
        if (date > today) {
            showError(input, 'Ngày sinh không thể ở tương lai');
            return false;
        }

        // Check if age is reasonable (e.g., between 10 and 120 years)
        const age = today.getFullYear() - year;
        if (age < 10 || age > 120) {
            showError(input, 'Tuổi không hợp lệ (phải từ 10 đến 120 tuổi)');
            return false;
        }

        clearError(input);
        return true;
    }

    // Error handling
    function showError(input, message) {
        clearError(input);

        const error = document.createElement('div');
        error.className = 'input-error';
        error.innerHTML = `<i class="fas fa-exclamation-circle"></i> ${message}`;

        input.parentElement.appendChild(error);
        input.classList.add('error');
    }

    function clearError(input) {
        const error = input.parentElement.querySelector('.input-error');
        if (error) {
            error.remove();
        }
        input.classList.remove('error');
    }

    // Form submission
    form.addEventListener('submit', function(e) {
        let isValid = true;

        // Validate all required fields
        fields.forEach(field => {
            if (field.required) {
                const element = document.getElementById(field.id);
                if (element && element.value.trim() === '') {
                    isValid = false;
                    showError(element, 'Trường này là bắt buộc');
                }
            }
        });

        // Validate date
        const dateInput = document.getElementById('dateOfBirth');
        if (dateInput && !validateDate(dateInput)) {
            isValid = false;
        }

        // Validate email format
        const emailInput = document.getElementById('email');
        if (emailInput && emailInput.value.trim() !== '') {
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(emailInput.value)) {
                isValid = false;
                showError(emailInput, 'Địa chỉ email không hợp lệ');
            }
        }

        if (!isValid) {
            e.preventDefault();

            // Show error message
            const submitBtn = form.querySelector('.submit-btn');
            const originalText = submitBtn.querySelector('.btn-text').textContent;
            submitBtn.querySelector('.btn-text').textContent = 'Vui lòng kiểm tra lại thông tin';
            submitBtn.classList.add('error');

            setTimeout(() => {
                submitBtn.querySelector('.btn-text').textContent = originalText;
                submitBtn.classList.remove('error');
            }, 2000);

            // Scroll to first error
            const firstError = form.querySelector('.error');
            if (firstError) {
                firstError.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }
        } else {
            // Show loading state
            const submitBtn = form.querySelector('.submit-btn');
            const originalText = submitBtn.querySelector('.btn-text').textContent;
            submitBtn.querySelector('.btn-text').textContent = 'Đang xử lý...';
            submitBtn.disabled = true;
            submitBtn.classList.add('loading');
        }
    });

    // Add date picker hint
    const dateInput = document.getElementById('dateOfBirth');
    if (dateInput) {
        dateInput.addEventListener('focus', function() {
            if (!this.value) {
                this.value = '__/__/____';
                this.setSelectionRange(0, 2);
            }
        });

        dateInput.addEventListener('keydown', function(e) {
            // Auto-format date as user types
            const key = e.key;
            const value = this.value;

            if (key >= '0' && key <= '9') {
                // Get cursor position
                const cursorPos = this.selectionStart;

                // If at slash position, move forward
                if (value[cursorPos] === '/') {
                    this.setSelectionRange(cursorPos + 1, cursorPos + 1);
                }

                // Auto-insert slashes
                if (cursorPos === 2 || cursorPos === 5) {
                    setTimeout(() => {
                        if (this.value.length === 2 || this.value.length === 5) {
                            this.value += '/';
                        }
                    }, 10);
                }
            }
        });
    }
</script>
</body>
</html>