<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Xác nhận xóa người dùng | Admin System</title>
  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link rel="stylesheet" type="text/css" href="styles/confirm-delete.css">
</head>
<body>
<!-- Background Animation -->
<div class="bg-animation">
  <div class="circle circle-1"></div>
  <div class="circle circle-2"></div>
  <div class="circle circle-3"></div>
</div>

<!-- Main Confirmation Container -->
<div class="confirmation-container">
  <!-- Warning Icon Animation -->
  <div class="warning-animation">
    <div class="warning-icon">
      <i class="fas fa-exclamation-triangle"></i>
    </div>
    <div class="pulse-ring ring-1"></div>
    <div class="pulse-ring ring-2"></div>
    <div class="pulse-ring ring-3"></div>
  </div>

  <!-- Header -->
  <header class="confirmation-header">
    <h1><i class="fas fa-user-slash"></i> Xác nhận xóa người dùng</h1>
    <p class="subtitle">Hành động này không thể hoàn tác. Vui lòng xác nhận thông tin bên dưới.</p>
  </header>

  <!-- Warning Message -->
  <div class="warning-message">
    <div class="warning-content">
      <i class="fas fa-radiation-alt"></i>
      <div class="warning-text">
        <h3>Hành động nguy hiểm!</h3>
        <p>Thao tác xóa sẽ loại bỏ vĩnh viễn người dùng khỏi hệ thống và không thể khôi phục.</p>
      </div>
    </div>
  </div>

  <!-- User Information Card -->
  <div class="user-card">
    <div class="card-header">
      <div class="user-avatar">
        <i class="fas fa-user"></i>
      </div>
      <div class="user-title">
        <h2>${user.firstName} ${user.lastName}</h2>
        <p class="user-role">Người dùng hệ thống</p>
      </div>
      <div class="user-status deleted">
        <i class="fas fa-trash"></i>
        <span>Sẽ bị xóa</span>
      </div>
    </div>

    <div class="card-body">
      <div class="info-grid">
        <div class="info-item">
          <div class="info-label">
            <i class="fas fa-envelope"></i>
            <span>Địa chỉ email</span>
          </div>
          <div class="info-value email-value">${user.email}</div>
        </div>

        <div class="info-item">
          <div class="info-label">
            <i class="fas fa-calendar-alt"></i>
            <span>Ngày sinh</span>
          </div>
          <div class="info-value">${user.dateOfBirth}</div>
        </div>

        <div class="info-item">
          <div class="info-label">
            <i class="fas fa-bell"></i>
            <span>Nhận thông báo</span>
          </div>
          <div class="info-value">
                            <span class="status-badge ${user.wantAnnouncements ? 'active' : 'inactive'}">
                              ${user.wantAnnouncements ? 'Có' : 'Không'}
                            </span>
          </div>
        </div>

        <div class="info-item">
          <div class="info-label">
            <i class="fas fa-mail-bulk"></i>
            <span>Nhận email QC</span>
          </div>
          <div class="info-value">
                            <span class="status-badge ${user.wantEmails ? 'active' : 'inactive'}">
                              ${user.wantEmails ? 'Có' : 'Không'}
                            </span>
          </div>
        </div>

        <div class="info-item">
          <div class="info-label">
            <i class="fas fa-user-clock"></i>
            <span>Tham gia từ</span>
          </div>
          <div class="info-value">15/11/2023</div>
        </div>

        <div class="info-item">
          <div class="info-label">
            <i class="fas fa-id-card"></i>
            <span>Mã người dùng</span>
          </div>
          <div class="info-value">#${user.email.hashCode().abs() % 10000}</div>
        </div>
      </div>
    </div>

    <div class="card-footer">
      <div class="delete-stats">
        <div class="stat-item">
          <i class="fas fa-database"></i>
          <span>Dữ liệu sẽ bị xóa: <strong>15 MB</strong></span>
        </div>
        <div class="stat-item">
          <i class="fas fa-history"></i>
          <span>Thao tác cuối: <strong>2 ngày trước</strong></span>
        </div>
      </div>
    </div>
  </div>

  <!-- Consequences Warning -->
  <div class="consequences-warning">
    <h3><i class="fas fa-exclamation-circle"></i> Hậu quả của việc xóa:</h3>
    <ul>
      <li>
        <i class="fas fa-times-circle"></i>
        <span>Tất cả thông tin cá nhân sẽ bị xóa vĩnh viễn</span>
      </li>
      <li>
        <i class="fas fa-chart-line"></i>
        <span>Dữ liệu thống kê liên quan sẽ bị ảnh hưởng</span>
      </li>
      <li>
        <i class="fas fa-ban"></i>
        <span>Không thể khôi phục tài khoản này sau khi xóa</span>
      </li>
      <li>
        <i class="fas fa-file-export"></i>
        <span>Xuất báo cáo trước khi xóa (khuyến nghị)</span>
      </li>
    </ul>
  </div>

  <!-- Action Buttons -->
  <div class="action-buttons">
    <form action="admin" method="post" class="delete-form">
      <input type="hidden" name="action" value="delete">
      <input type="hidden" name="email" value="${user.email}">
      <button type="submit" class="confirm-delete-btn">
        <i class="fas fa-skull-crossbones"></i>
        <span class="btn-text">Xác nhận xóa vĩnh viễn</span>
        <i class="fas fa-arrow-right btn-arrow"></i>
      </button>
      <div class="delete-confirmation">
        <label class="confirm-checkbox">
          <input type="checkbox" id="confirmDelete" required>
          <span class="checkmark danger"></span>
          <span class="confirm-text">Tôi hiểu rằng hành động này không thể hoàn tác</span>
        </label>
      </div>
    </form>

    <div class="cancel-section">
      <a href="admin?action=list" class="cancel-btn">
        <i class="fas fa-times"></i>
        <span>Hủy bỏ và quay lại</span>
      </a>
      <p class="cancel-note">
        <i class="fas fa-shield-alt"></i>
        An toàn: Không có thay đổi nào được thực hiện nếu bạn hủy
      </p>
    </div>
  </div>

  <!-- Security Footer -->
  <footer class="security-footer">
    <div class="security-info">
      <i class="fas fa-user-secret"></i>
      <div class="security-text">
        <strong>Hành động được ghi nhận</strong>
        <p>Tất cả các thao tác xóa sẽ được ghi lại trong nhật ký hệ thống với thông tin của bạn.</p>
      </div>
    </div>
    <div class="timestamp">
      <i class="fas fa-clock"></i>
      <span>Thời gian hiện tại: <span id="currentTime"></span></span>
    </div>
  </footer>
</div>

<!-- JavaScript -->
<script>
  // Update current time
  function updateTime() {
    const now = new Date();
    const dateStr = now.toLocaleDateString('vi-VN', {
      day: '2-digit',
      month: '2-digit',
      year: 'numeric'
    });
    const timeStr = now.toLocaleTimeString('vi-VN', {
      hour: '2-digit',
      minute: '2-digit',
      second: '2-digit'
    });
    document.getElementById('currentTime').textContent = `${timeStr} - ${dateStr}`;
  }

  // Update time immediately and every second
  updateTime();
  setInterval(updateTime, 1000);

  // Confirm delete validation
  const deleteForm = document.querySelector('.delete-form');
  const confirmCheckbox = document.getElementById('confirmDelete');
  const deleteButton = document.querySelector('.confirm-delete-btn');

  deleteForm.addEventListener('submit', function(e) {
    if (!confirmCheckbox.checked) {
      e.preventDefault();
      showAlert('Vui lòng xác nhận rằng bạn hiểu hành động này không thể hoàn tác', 'warning');
      confirmCheckbox.parentElement.classList.add('shake');
      setTimeout(() => {
        confirmCheckbox.parentElement.classList.remove('shake');
      }, 500);
    } else {
      // Show final confirmation
      if (!confirm('CẢNH BÁO CUỐI CÙNG: Bạn có chắc chắn muốn xóa người dùng này vĩnh viễn?')) {
        e.preventDefault();
      } else {
        // Show loading state
        deleteButton.disabled = true;
        const btnText = deleteButton.querySelector('.btn-text');
        const originalText = btnText.textContent;
        btnText.textContent = 'Đang xóa...';

        // Add processing animation
        deleteButton.classList.add('processing');
      }
    }
  });

  // Function to show alert
  function showAlert(message, type) {
    // Create alert element
    const alert = document.createElement('div');
    alert.className = `custom-alert ${type}`;
    alert.innerHTML = `
                <div class="alert-icon">
                    <i class="fas fa-exclamation-circle"></i>
                </div>
                <div class="alert-content">
                    <p>${message}</p>
                </div>
                <button class="alert-close">
                    <i class="fas fa-times"></i>
                </button>
            `;

    // Insert alert
    document.body.appendChild(alert);

    // Show with animation
    setTimeout(() => {
      alert.classList.add('show');
    }, 10);

    // Close button functionality
    alert.querySelector('.alert-close').addEventListener('click', function() {
      alert.classList.remove('show');
      setTimeout(() => {
        alert.remove();
      }, 300);
    });

    // Auto remove after 5 seconds
    setTimeout(() => {
      if (alert.parentElement) {
        alert.classList.remove('show');
        setTimeout(() => {
          alert.remove();
        }, 300);
      }
    }, 5000);
  }

  // Add shake animation to warning icon on load
  document.addEventListener('DOMContentLoaded', function() {
    const warningIcon = document.querySelector('.warning-icon');
    setTimeout(() => {
      warningIcon.classList.add('shake');
      setTimeout(() => {
        warningIcon.classList.remove('shake');
      }, 1000);
    }, 500);
  });
</script>
</body>
</html>