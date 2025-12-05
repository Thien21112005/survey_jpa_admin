<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Xác nhận đăng ký | Murach's Java Servlets and JSP</title>
  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link rel="stylesheet" href="styles/thanks.css" type="text/css" />
</head>

<body>
<!-- Đặt biến type mặc định nếu chưa có -->
<c:if test="${empty type}">
  <c:set var="type" value="success" />
</c:if>

<!-- Background Animation -->
<div class="bg-animation">
  <div class="circle circle-1"></div>
  <div class="circle circle-2"></div>
  <div class="circle circle-3"></div>
</div>

<!-- Confirmation Container -->
<div class="confirmation-container">
  <!-- Success Header -->
  <header class="success-header">
    <div class="success-icon">
      <div class="icon-circle">
        <i class="fas fa-check"></i>
      </div>
      <div class="success-pulse ring-1"></div>
      <div class="success-pulse ring-2"></div>
      <div class="success-pulse ring-3"></div>
    </div>

    <div class="success-content">
      <h1><i class="fas fa-heart"></i> Cảm ơn bạn đã tham gia!</h1>
      <p class="subtitle">Đăng ký của bạn đã được xác nhận thành công</p>
    </div>
  </header>

  <!-- Success Message -->
  <c:if test="${not empty message}">
    <div class="success-message">
      <div class="message-icon">
        <i class="fas fa-star"></i>
      </div>
      <div class="message-content">
        <h3>Thành công!</h3>
        <p>${message}</p>
      </div>
    </div>
  </c:if>

  <!-- User Information Card -->
  <div class="user-summary">
    <div class="summary-header">
      <h2><i class="fas fa-user-check"></i> Thông tin đã đăng ký</h2>
      <p class="summary-subtitle">Dưới đây là thông tin bạn đã cung cấp cho chúng tôi</p>
    </div>

    <div class="info-card">
      <div class="card-header">
        <div class="user-avatar">
          <i class="fas fa-user-circle"></i>
        </div>
        <div class="user-title">
          <h3>${user.firstName} ${user.lastName}</h3>
          <p class="user-email">${user.email}</p>
        </div>
        <div class="user-status active">
          <i class="fas fa-badge-check"></i>
          <span>Đã xác nhận</span>
        </div>
      </div>

      <div class="card-body">
        <div class="info-grid">
          <!-- Personal Info -->
          <div class="info-section">
            <h4><i class="fas fa-id-card"></i> Thông tin cá nhân</h4>
            <div class="info-row">
              <span class="info-label">Họ và tên:</span>
              <span class="info-value">${user.firstName} ${user.lastName}</span>
            </div>
            <div class="info-row">
              <span class="info-label">Ngày sinh:</span>
              <span class="info-value">
                                    <i class="fas fa-birthday-cake"></i>
                                    ${user.dateOfBirth}
                                </span>
            </div>
          </div>

          <!-- Contact Info -->
          <div class="info-section">
            <h4><i class="fas fa-address-book"></i> Thông tin liên hệ</h4>
            <div class="info-row">
              <span class="info-label">Email:</span>
              <span class="info-value email-value">
                                    <i class="fas fa-envelope"></i>
                                    ${user.email}
                                </span>
            </div>
            <div class="info-row">
              <span class="info-label">Phương thức liên hệ:</span>
              <span class="info-value">
                                    <c:choose>
                                      <c:when test="${user.contactMethod == 'emailOnly'}">
                                        <i class="fas fa-envelope"></i> Chỉ email
                                      </c:when>
                                      <c:when test="${user.contactMethod == 'postalOnly'}">
                                        <i class="fas fa-mail-bulk"></i> Chỉ thư bưu điện
                                      </c:when>
                                      <c:when test="${user.contactMethod == 'emailOrPostal'}">
                                        <i class="fas fa-mailbox"></i> Email hoặc thư bưu điện
                                      </c:when>
                                    </c:choose>
                                </span>
            </div>
          </div>

          <!-- Preferences -->
          <div class="info-section">
            <h4><i class="fas fa-sliders-h"></i> Tùy chọn của bạn</h4>
            <div class="info-row">
              <span class="info-label">Biết đến qua:</span>
              <span class="info-value">
                                    <c:choose>
                                      <c:when test="${user.hearAboutUs == 'searchEngine'}">
                                            <span class="source-badge search">
                                                <i class="fas fa-search"></i> Công cụ tìm kiếm
                                            </span>
                                      </c:when>
                                      <c:when test="${user.hearAboutUs == 'wordOfMouth'}">
                                            <span class="source-badge word">
                                                <i class="fas fa-comments"></i> Người giới thiệu
                                            </span>
                                      </c:when>
                                      <c:when test="${user.hearAboutUs == 'socialMedia'}">
                                            <span class="source-badge social">
                                                <i class="fas fa-hashtag"></i> Mạng xã hội
                                            </span>
                                      </c:when>
                                      <c:when test="${user.hearAboutUs == 'other'}">
                                            <span class="source-badge other">
                                                <i class="fas fa-ellipsis-h"></i> Khác
                                            </span>
                                      </c:when>
                                    </c:choose>
                                </span>
            </div>
            <div class="info-row">
              <span class="info-label">Nhận thông báo:</span>
              <span class="info-value">
                                    <span class="status-badge ${user.wantAnnouncements ? 'active' : 'inactive'}">
                                      ${user.wantAnnouncements ? 'Có' : 'Không'}
                                    </span>
                                </span>
            </div>
            <div class="info-row">
              <span class="info-label">Nhận email QC:</span>
              <span class="info-value">
                                    <span class="status-badge ${user.wantEmails ? 'active' : 'inactive'}">
                                      ${user.wantEmails ? 'Có' : 'Không'}
                                    </span>
                                </span>
            </div>
          </div>

          <!-- Membership Info -->
          <div class="info-section">
            <h4><i class="fas fa-award"></i> Thông tin thành viên</h4>
            <div class="info-row">
              <span class="info-label">Mã thành viên:</span>
              <span class="info-value">#${Math.abs(user.email.hashCode()) % 10000}</span>
            </div>
            <div class="info-row">
              <span class="info-label">Ngày tham gia:</span>
              <span class="info-value" id="joinDate"></span>
            </div>
            <div class="info-row">
              <span class="info-label">Trạng thái:</span>
              <span class="info-value">
                                    <span class="status-badge active">
                                        <i class="fas fa-check-circle"></i> Hoạt động
                                    </span>
                                </span>
            </div>
          </div>
        </div>
      </div>

      <div class="card-footer">
        <div class="welcome-message">
          <i class="fas fa-gift"></i>
          <div class="message-content">
            <h4>Chào mừng bạn đến với cộng đồng của chúng tôi!</h4>
            <p>Bạn sẽ nhận được ưu đãi đặc biệt dành cho thành viên mới trong vòng 24 giờ.</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Next Steps -->
  <div class="next-steps">
    <h3><i class="fas fa-road"></i> Bước tiếp theo</h3>
    <div class="steps-grid">
      <div class="step">
        <div class="step-icon">
          <div class="step-number">1</div>
          <i class="fas fa-envelope-open-text"></i>
        </div>
        <div class="step-content">
          <h4>Kiểm tra email</h4>
          <p>Chúng tôi đã gửi email xác nhận đến ${user.email}</p>
        </div>
      </div>
      <div class="step">
        <div class="step-icon">
          <div class="step-number">2</div>
          <i class="fas fa-bell"></i>
        </div>
        <div class="step-content">
          <h4>Nhận thông báo</h4>
          <p>Bạn sẽ nhận được thông báo về ưu đãi và tin tức mới nhất</p>
        </div>
      </div>
      <div class="step">
        <div class="step-icon">
          <div class="step-number">3</div>
          <i class="fas fa-headset"></i>
        </div>
        <div class="step-content">
          <h4>Hỗ trợ 24/7</h4>
          <p>Đội ngũ hỗ trợ của chúng tôi luôn sẵn sàng giúp đỡ bạn</p>
        </div>
      </div>
    </div>
  </div>

  <!-- Action Buttons -->
  <div class="action-section">
    <div class="instructions">
      <h4><i class="fas fa-info-circle"></i> Hướng dẫn thêm</h4>
      <p>Để nhập một địa chỉ email khác, nhấn nút "Quay lại trang khảo sát" hoặc sử dụng nút "Trang chủ" để quay về trang chính.</p>
    </div>

    <div class="action-buttons">
      <form action="" method="get" class="back-form">
        <input type="hidden" name="action" value="join">
        <button type="submit" class="back-btn">
          <i class="fas fa-redo"></i>
          <span class="btn-text">Quay lại trang khảo sát</span>
        </button>
      </form>

      <a href="index.html" class="home-btn">
        <i class="fas fa-home"></i>
        <span>Quay về trang chủ</span>
      </a>
    </div>
  </div>

  <!-- Download Section -->
  <div class="download-section">
    <div class="download-card">
      <div class="download-icon">
        <i class="fas fa-file-pdf"></i>
      </div>
      <div class="download-content">
        <h4>Tải về thông tin đăng ký</h4>
        <p>Lưu lại thông tin đăng ký của bạn dưới dạng PDF để tiện theo dõi</p>
      </div>
      <button class="download-btn">
        <i class="fas fa-download"></i>
        <span>Tải PDF</span>
      </button>
    </div>
  </div>

  <!-- Footer -->
  <footer class="confirmation-footer">
    <div class="footer-content">
      <div class="contact-info">
        <h5><i class="fas fa-headset"></i> Cần hỗ trợ?</h5>
        <p>Liên hệ với chúng tôi qua email: support@murach.com hoặc gọi 1800-123-456</p>
      </div>
      <div class="social-links">
        <h5>Theo dõi chúng tôi</h5>
        <div class="social-icons">
          <a href="#" class="social-icon facebook">
            <i class="fab fa-facebook-f"></i>
          </a>
          <a href="#" class="social-icon twitter">
            <i class="fab fa-twitter"></i>
          </a>
          <a href="#" class="social-icon instagram">
            <i class="fab fa-instagram"></i>
          </a>
          <a href="#" class="social-icon youtube">
            <i class="fab fa-youtube"></i>
          </a>
        </div>
      </div>
    </div>
    <div class="copyright">
      <p>© 2023 Murach's Java Servlets and JSP. Mọi quyền được bảo lưu.</p>
      <p class="confirmation-id">Mã xác nhận: CONFIRM-${Math.abs(user.email.hashCode()) % 1000000}</p>
    </div>
  </footer>
</div>

<!-- Confetti Animation -->
<div class="confetti-container"></div>

<!-- JavaScript -->
<script>
  // Set current date as join date
  document.addEventListener('DOMContentLoaded', function() {
    const now = new Date();
    const dateStr = now.toLocaleDateString('vi-VN', {
      day: '2-digit',
      month: '2-digit',
      year: 'numeric'
    });
    document.getElementById('joinDate').textContent = dateStr;

    // Trigger confetti animation
    triggerConfetti();

    // Add success animation to icon
    const successIcon = document.querySelector('.success-icon');
    setTimeout(() => {
      successIcon.classList.add('animated');
    }, 500);
  });

  // Confetti animation
  function triggerConfetti() {
    const container = document.querySelector('.confetti-container');
    const colors = ['#5D8BF4', '#4ECDC4', '#FF9A8B', '#FFD166', '#06D6A0'];

    for (let i = 0; i < 150; i++) {
      const confetti = document.createElement('div');
      confetti.className = 'confetti';
      confetti.style.left = Math.random() * 100 + 'vw';
      confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
      confetti.style.width = Math.random() * 10 + 5 + 'px';
      confetti.style.height = Math.random() * 10 + 5 + 'px';
      confetti.style.opacity = Math.random() * 0.5 + 0.5;

      // Animation
      confetti.style.animation = `confetti-fall ${Math.random() * 3 + 2}s linear forwards`;
      confetti.style.animationDelay = Math.random() * 2 + 's';

      container.appendChild(confetti);

      // Remove after animation
      setTimeout(() => {
        confetti.remove();
      }, 5000);
    }
  }

  // Download button functionality
  document.querySelector('.download-btn').addEventListener('click', function() {
    const btn = this;
    const originalText = btn.querySelector('span').textContent;

    // Show loading state
    btn.querySelector('span').textContent = 'Đang tạo file...';
    btn.disabled = true;
    btn.classList.add('loading');

    // Simulate download
    setTimeout(() => {
      btn.querySelector('span').textContent = 'Đã tải xong!';
      btn.classList.remove('loading');
      btn.classList.add('success');

      // Show success message
      showToast('File PDF đã được tải xuống thành công!', 'success');

      // Reset button after 3 seconds
      setTimeout(() => {
        btn.querySelector('span').textContent = originalText;
        btn.disabled = false;
        btn.classList.remove('success');
      }, 3000);
    }, 2000);
  });

  // Toast notification function
  function showToast(message, type) {
    const toast = document.createElement('div');
    toast.className = `toast-notification ${type}`;
    toast.innerHTML = `
                <div class="toast-icon">
                    <i class="fas fa-${type == 'success' ? 'check-circle' : 'info-circle'}"></i>
                </div>
                <div class="toast-content">
                    <p>${message}</p>
                </div>
                <button class="toast-close">
                    <i class="fas fa-times"></i>
                </button>
            `;

    document.body.appendChild(toast);

    // Show toast
    setTimeout(() => {
      toast.classList.add('show');
    }, 10);

    // Close button
    toast.querySelector('.toast-close').addEventListener('click', function() {
      toast.classList.remove('show');
      setTimeout(() => {
        toast.remove();
      }, 300);
    });

    // Auto remove after 5 seconds
    setTimeout(() => {
      if (toast.parentElement) {
        toast.classList.remove('show');
        setTimeout(() => {
          toast.remove();
        }, 300);
      }
    }, 5000);
  }

  // Add hover effects to info card
  const infoCard = document.querySelector('.info-card');
  infoCard.addEventListener('mouseenter', function() {
    this.classList.add('hovered');
  });

  infoCard.addEventListener('mouseleave', function() {
    this.classList.remove('hovered');
  });

  // Add animation to steps on scroll
  const observerOptions = {
    threshold: 0.2,
    rootMargin: '0px 0px -50px 0px'
  };

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('animated');
      }
    });
  }, observerOptions);

  // Observe steps
  document.querySelectorAll('.step').forEach(step => {
    observer.observe(step);
  });
</script>
</body>
</html>