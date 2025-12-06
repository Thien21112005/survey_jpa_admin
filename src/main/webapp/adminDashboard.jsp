<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard - Quản lý Người dùng</title>
  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link rel="stylesheet" type="text/css" href="styles/admindashboard.css">
</head>
<body>
<!-- Background Animation -->
<div class="bg-animation">
  <div class="circle circle-1"></div>
  <div class="circle circle-2"></div>
  <div class="circle circle-3"></div>
</div>

<!-- Main Container -->
<div class="admin-container">
  <!-- Header -->
  <header class="admin-header">
    <div class="header-content">
      <div class="logo-section">
        <div class="admin-avatar">
          <i class="fas fa-user-shield"></i>
        </div>
        <div class="title-section">
          <h1><span class="highlight">Admin</span> Dashboard</h1>
          <p class="subtitle">Quản lý thông tin người dùng hệ thống</p>
        </div>
      </div>

      <div class="header-actions">
        <div class="stats-badge">
          <i class="fas fa-users"></i>
          <span class="count">${not empty users ? users.size() : 0}</span>
          <span class="label">Người dùng</span>
        </div>
        <a href="admin?action=logout" class="logout-btn">
          <i class="fas fa-sign-out-alt"></i>
          <span>Đăng xuất</span>
        </a>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <main class="admin-main">
    <!-- Action Bar -->
    <div class="action-bar">
      <div class="action-left">
        <a href="admin?action=add" class="add-user-btn">
          <i class="fas fa-user-plus"></i>
          <span>Thêm người dùng mới</span>
        </a>
        <div class="search-box">
          <i class="fas fa-search"></i>
          <input type="text" id="userSearch" placeholder="Tìm kiếm người dùng...">
        </div>
      </div>
      <div class="action-right">
        <a href="index.html" class="back-home-btn">
          <i class="fas fa-home"></i>
          <span>Về trang chủ</span>
        </a>
      </div>
    </div>

    <!-- User Table Section -->
    <section class="users-section">
      <div class="section-header">
        <h2>
          <i class="fas fa-table"></i>
          Danh sách người dùng
        </h2>
        <div class="section-actions">
          <button class="export-btn" id="exportExcelBtn">
            <i class="fas fa-download"></i>
            Xuất Excel
          </button>
        </div>
      </div>

      <c:if test="${empty users}">
        <div class="empty-state">
          <div class="empty-icon">
            <i class="fas fa-user-slash"></i>
          </div>
          <h3>Không có người dùng nào</h3>
          <p>Hệ thống hiện chưa có người dùng nào. Hãy thêm người dùng đầu tiên!</p>
          <a href="admin?action=add" class="add-first-btn">
            <i class="fas fa-user-plus"></i>
            Thêm người dùng đầu tiên
          </a>
        </div>
      </c:if>

      <c:if test="${not empty users}">
        <div class="table-container">
          <table class="users-table" id="usersTable">
            <thead>
            <tr>
              <th class="sortable" data-sort="email">
                <span>Email</span>
                <i class="fas fa-sort"></i>
              </th>
              <th class="sortable" data-sort="firstName">
                <span>Họ</span>
                <i class="fas fa-sort"></i>
              </th>
              <th class="sortable" data-sort="lastName">
                <span>Tên</span>
                <i class="fas fa-sort"></i>
              </th>
              <th>Ngày sinh</th>
              <th>Biết qua</th>
              <th class="text-center">Thông báo</th>
              <th class="text-center">Email QC</th>
              <th>Liên hệ</th>
              <th class="text-center">Hành động</th>
            </tr>
            </thead>
            <tbody id="tableBody">
            <c:forEach var="user" items="${users}" varStatus="status">
              <tr class="${status.index % 2 == 0 ? 'even' : 'odd'}">
                <td class="email-cell">
                  <div class="user-avatar">
                    <i class="fas fa-user"></i>
                  </div>
                  <div class="email-info">
                    <span class="email">${user.email}</span>
                    <span class="joined-date">Tham gia: 15/11/2023</span>
                  </div>
                </td>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>
                  <span class="date-badge">
                    <i class="fas fa-birthday-cake"></i>
                    ${user.dateOfBirth}
                  </span>
                </td>
                <td>
                  <c:choose>
                    <c:when test="${user.hearAboutUs == 'searchEngine'}">
                      <span class="source-badge search-engine">
                        <i class="fas fa-search"></i>
                        Tìm kiếm
                      </span>
                    </c:when>
                    <c:when test="${user.hearAboutUs == 'wordOfMouth'}">
                      <span class="source-badge word-of-mouth">
                        <i class="fas fa-comments"></i>
                        Giới thiệu
                      </span>
                    </c:when>
                    <c:when test="${user.hearAboutUs == 'socialMedia'}">
                      <span class="source-badge social-media">
                        <i class="fas fa-hashtag"></i>
                        Mạng xã hội
                      </span>
                    </c:when>
                    <c:when test="${user.hearAboutUs == 'other'}">
                      <span class="source-badge other">
                        <i class="fas fa-ellipsis-h"></i>
                        Khác
                      </span>
                    </c:when>
                  </c:choose>
                </td>
                <td class="text-center">
                  <div class="status-badge ${user.wantAnnouncements ? 'active' : 'inactive'}">
                      ${user.wantAnnouncements ? 'Có' : 'Không'}
                  </div>
                </td>
                <td class="text-center">
                  <div class="status-badge ${user.wantEmails ? 'active' : 'inactive'}">
                      ${user.wantEmails ? 'Có' : 'Không'}
                  </div>
                </td>
                <td>
                  <c:choose>
                    <c:when test="${user.contactMethod == 'emailOnly'}">
                      <span class="contact-method">
                        <i class="fas fa-envelope"></i>
                        Chỉ email
                      </span>
                    </c:when>
                    <c:when test="${user.contactMethod == 'postalOnly'}">
                      <span class="contact-method">
                        <i class="fas fa-mail-bulk"></i>
                        Chỉ thư
                      </span>
                    </c:when>
                    <c:when test="${user.contactMethod == 'emailOrPostal'}">
                      <span class="contact-method">
                        <i class="fas fa-mailbox"></i>
                        Email/Thư
                      </span>
                    </c:when>
                  </c:choose>
                </td>
                <td class="action-cell">
                  <div class="action-buttons">
                    <a href="admin?action=edit&email=${user.email}" class="edit-btn" title="Sửa thông tin">
                      <i class="fas fa-edit"></i>
                    </a>
                    <a href="admin?action=delete&email=${user.email}" class="delete-btn" title="Xóa người dùng" onclick="return confirm('Bạn có chắc chắn muốn xóa người dùng này?')">
                      <i class="fas fa-trash-alt"></i>
                    </a>
                    <button class="more-btn" title="Thêm tùy chọn">
                      <i class="fas fa-ellipsis-v"></i>
                    </button>
                  </div>
                </td>
              </tr>
            </c:forEach>
            </tbody>
          </table>

          <!-- Pagination -->
          <div class="pagination">
            <button class="pagination-btn prev" disabled>
              <i class="fas fa-chevron-left"></i>
            </button>
            <button class="pagination-btn active">1</button>
            <button class="pagination-btn">2</button>
            <button class="pagination-btn">3</button>
            <span class="pagination-ellipsis">...</span>
            <button class="pagination-btn">10</button>
            <button class="pagination-btn next">
              <i class="fas fa-chevron-right"></i>
            </button>
            <div class="pagination-info">
              Hiển thị <strong>1-10</strong> của <strong>${not empty users ? users.size() : 0}</strong> người dùng
            </div>
          </div>
        </div>
      </c:if>
    </section>

    <!-- Stats Cards -->
    <div class="stats-cards">
      <div class="stat-card">
        <div class="stat-icon total-users">
          <i class="fas fa-users"></i>
        </div>
        <div class="stat-content">
          <h3>${not empty users ? users.size() : 0}</h3>
          <p>Tổng người dùng</p>
        </div>
        <div class="stat-trend up">
          <i class="fas fa-arrow-up"></i>
          <span>12%</span>
        </div>
      </div>

      <div class="stat-card">
        <div class="stat-icon email-subscribers">
          <i class="fas fa-envelope-open-text"></i>
        </div>
        <div class="stat-content">
          <h3>
            <c:set var="emailCount" value="0" />
            <c:forEach var="user" items="${users}">
              <c:if test="${user.wantEmails}">
                <c:set var="emailCount" value="${emailCount + 1}" />
              </c:if>
            </c:forEach>
            ${emailCount}
          </h3>
          <p>Đăng ký email</p>
        </div>
        <div class="stat-trend up">
          <i class="fas fa-arrow-up"></i>
          <span>8%</span>
        </div>
      </div>

      <div class="stat-card">
        <div class="stat-icon notifications-on">
          <i class="fas fa-bell"></i>
        </div>
        <div class="stat-content">
          <h3>
            <c:set var="notificationCount" value="0" />
            <c:forEach var="user" items="${users}">
              <c:if test="${user.wantAnnouncements}">
                <c:set var="notificationCount" value="${notificationCount + 1}" />
              </c:if>
            </c:forEach>
            ${notificationCount}
          </h3>
          <p>Nhận thông báo</p>
        </div>
        <div class="stat-trend down">
          <i class="fas fa-arrow-down"></i>
          <span>3%</span>
        </div>
      </div>

      <div class="stat-card">
        <div class="stat-icon social-media">
          <i class="fas fa-share-alt"></i>
        </div>
        <div class="stat-content">
          <h3>
            <c:set var="socialCount" value="0" />
            <c:forEach var="user" items="${users}">
              <c:if test="${user.hearAboutUs == 'socialMedia'}">
                <c:set var="socialCount" value="${socialCount + 1}" />
              </c:if>
            </c:forEach>
            ${socialCount}
          </h3>
          <p>Từ mạng xã hội</p>
        </div>
        <div class="stat-trend up">
          <i class="fas fa-arrow-up"></i>
          <span>15%</span>
        </div>
      </div>
    </div>
  </main>

  <!-- Footer -->
  <footer class="admin-footer">
    <p>© 2023 Murach's Java Servlets and JSP Admin System. Phiên bản 2.1.0</p>
    <div class="footer-links">
      <a href="#"><i class="fas fa-question-circle"></i> Trợ giúp</a>
      <a href="#"><i class="fas fa-cog"></i> Cài đặt</a>
      <a href="#"><i class="fas fa-shield-alt"></i> Bảo mật</a>
    </div>
  </footer>
</div>

<!-- JavaScript for Interactive Features -->
<script>
  // Load SheetJS library dynamically
  function loadSheetJS() {
    return new Promise((resolve, reject) => {
      if (typeof XLSX !== 'undefined') {
        resolve();
        return;
      }

      const script = document.createElement('script');
      script.src = 'https://cdn.sheetjs.com/xlsx-0.20.0/package/dist/xlsx.full.min.js';
      script.onload = resolve;
      script.onerror = reject;
      document.head.appendChild(script);
    });
  }

  // Search functionality - SIMPLIFIED AND WORKING VERSION
  document.getElementById('userSearch').addEventListener('input', function(e) {
    const searchTerm = e.target.value.toLowerCase().trim();
    const rows = document.querySelectorAll('#tableBody tr');

    console.log('Searching for:', searchTerm, 'in', rows.length, 'rows');

    if (searchTerm === '') {
      // Show all rows when search is empty
      rows.forEach(row => {
        row.classList.remove('hidden-row');
      });
      return;
    }

    rows.forEach(row => {
      // Get all text content from the row
      let rowText = '';

      // Collect text from all cells
      const cells = row.querySelectorAll('td');
      cells.forEach(cell => {
        rowText += ' ' + cell.textContent.toLowerCase();
      });

      // Check if search term is in row text
      if (rowText.includes(searchTerm)) {
        row.classList.remove('hidden-row');
      } else {
        row.classList.add('hidden-row');
      }
    });
  });

  // Sort table columns
  document.querySelectorAll('.sortable').forEach(header => {
    header.addEventListener('click', function() {
      const table = this.closest('table');
      const tbody = table.querySelector('tbody');
      const columnIndex = Array.from(this.parentNode.children).indexOf(this);
      const rows = Array.from(tbody.querySelectorAll('tr:not(.hidden-row)'));
      const isAsc = this.classList.contains('asc');

      // Remove sort classes from all headers
      table.querySelectorAll('.sortable').forEach(h => {
        h.classList.remove('asc', 'desc');
      });

      // Sort rows
      rows.sort((a, b) => {
        let aText, bText;

        // Lấy text từ cột tương ứng
        if (columnIndex === 0) { // Cột Email
          aText = a.querySelector('.email').textContent.trim();
          bText = b.querySelector('.email').textContent.trim();
        } else if (columnIndex === 1 || columnIndex === 2) { // Cột Họ và Tên
          aText = a.cells[columnIndex].textContent.trim();
          bText = b.cells[columnIndex].textContent.trim();
        } else {
          aText = a.cells[columnIndex].textContent.trim();
          bText = b.cells[columnIndex].textContent.trim();
        }

        if (!isAsc) {
          return aText.localeCompare(bText, 'vi', { sensitivity: 'base' });
        } else {
          return bText.localeCompare(aText, 'vi', { sensitivity: 'base' });
        }
      });

      // Reorder rows
      rows.forEach(row => tbody.appendChild(row));

      // Update sort indicator
      this.classList.toggle('asc', !isAsc);
      this.classList.toggle('desc', isAsc);
    });
  });

  // Pagination buttons
  document.querySelectorAll('.pagination-btn').forEach(btn => {
    btn.addEventListener('click', function() {
      if (this.classList.contains('active') || this.disabled) return;

      document.querySelectorAll('.pagination-btn').forEach(b => {
        b.classList.remove('active');
      });

      if (!this.classList.contains('prev') && !this.classList.contains('next')) {
        this.classList.add('active');
      }
    });
  });

  // Function to show notification
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

    if (type === 'success') {
      notification.style.background = 'linear-gradient(135deg, #4CAF50, #45a049)';
    } else if (type === 'error') {
      notification.style.background = 'linear-gradient(135deg, #F44336, #D32F2F)';
    }

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

  // Export to Excel functionality
  document.getElementById('exportExcelBtn').addEventListener('click', async function() {
    const btn = this;
    const originalText = btn.innerHTML;

    try {
      // Hiển thị trạng thái loading
      btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang xuất...';
      btn.disabled = true;

      // Load SheetJS nếu chưa có
      await loadSheetJS();

      // Lấy bảng
      const table = document.getElementById('usersTable');

      // Tạo workbook từ bảng
      const wb = XLSX.utils.table_to_book(table, { sheet: "Danh sách người dùng" });

      // Tạo tên file với ngày hiện tại
      const date = new Date();
      const dateStr = date.getFullYear() + '-' +
              String(date.getMonth() + 1).padStart(2, '0') + '-' +
              String(date.getDate()).padStart(2, '0');

      // Xuất file Excel
      XLSX.writeFile(wb, 'danh_sach_nguoi_dung_' + dateStr + '.xlsx');

      // Hiển thị thông báo thành công
      showNotification('Xuất Excel thành công!', 'success');

    } catch (error) {
      console.error('Lỗi khi xuất Excel:', error);
      showNotification('Có lỗi xảy ra khi xuất Excel!', 'error');
    } finally {
      // Khôi phục trạng thái nút
      btn.innerHTML = originalText;
      btn.disabled = false;
    }
  });

  // Add CSS for notifications
  const style = document.createElement('style');
  style.textContent =
          '@keyframes slideIn {' +
          '  from {' +
          '    transform: translateX(100%);' +
          '    opacity: 0;' +
          '  }' +
          '  to {' +
          '    transform: translateX(0);' +
          '    opacity: 1;' +
          '  }' +
          '}' +
          '' +
          '@keyframes slideOut {' +
          '  from {' +
          '    transform: translateX(0);' +
          '    opacity: 1;' +
          '  }' +
          '  to {' +
          '    transform: translateX(100%);' +
          '    opacity: 0;' +
          '  }' +
          '}';

  // Add CSS for hidden rows
  style.textContent +=
          '.hidden-row {' +
          '  display: none !important;' +
          '  visibility: hidden !important;' +
          '  height: 0 !important;' +
          '  opacity: 0 !important;' +
          '  overflow: hidden !important;' +
          '}';

  document.head.appendChild(style);

  // DEBUG: Kiểm tra sự kiện search
  console.log('Search input element:', document.getElementById('userSearch'));
  console.log('Total rows in table:', document.querySelectorAll('.users-table tbody tr').length);
</script>
</body>
</html>