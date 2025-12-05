package murach.admin;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import murach.business.User;
import murach.data.UserDB;

@WebServlet(
        name = "AdminServlet",
        urlPatterns = {"/admin"},
        loadOnStartup = 1
)
public class AdminServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            action = "login";
        }

        switch (action) {
            case "login":
                handleLogin(request, response);
                break;
            case "logout":
                handleLogout(request, response);
                break;
            case "add":
                handleAddUser(request, response);
                break;
            case "update":
                handleUpdateUser(request, response);
                break;
            case "delete":
                handleDeleteUser(request, response);
                break;
            default:
                response.sendRedirect("adminLogin.jsp");
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Boolean isLoggedIn = (Boolean) session.getAttribute("adminLoggedIn");

        if (isLoggedIn == null || !isLoggedIn) {
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                showUserList(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteConfirmation(request, response);
                break;
            case "add":
                showAddForm(request, response);
                break;
            case "logout":
                handleLogout(request, response);
                break;
            default:
                showUserList(request, response);
                break;
        }
    }

    private void handleLogin(HttpServletRequest request,
                             HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Kiểm tra thông tin đăng nhập
        if ("admin".equals(username) && "admin".equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("adminLoggedIn", true);
            response.sendRedirect("admin?action=list");
        } else {
            request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
            request.getRequestDispatcher("/adminLogin.jsp")
                    .forward(request, response);
        }
    }

    private void handleLogout(HttpServletRequest request,
                              HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("index.html");
    }

    private void showUserList(HttpServletRequest request,
                              HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy tất cả user từ database (cần thêm phương thức getAllUsers trong UserDB)
        List<User> users = UserDB.getAllUsers();  // Gọi trực tiếp từ UserDB

        request.setAttribute("users", users);
        request.getRequestDispatcher("/adminDashboard.jsp")
                .forward(request, response);
    }

    private void showEditForm(HttpServletRequest request,
                              HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        User user = UserDB.selectUser(email);

        if (user != null) {
            request.setAttribute("user", user);
            request.setAttribute("action", "update");
            request.getRequestDispatcher("/adminUserForm.jsp")
                    .forward(request, response);
        } else {
            response.sendRedirect("admin?action=list");
        }
    }

    private void showAddForm(HttpServletRequest request,
                             HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("action", "add");
        request.getRequestDispatcher("/adminUserForm.jsp")
                .forward(request, response);
    }

    private void showDeleteConfirmation(HttpServletRequest request,
                                        HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        User user = UserDB.selectUser(email);

        if (user != null) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("/adminDeleteConfirm.jsp")
                    .forward(request, response);
        } else {
            response.sendRedirect("admin?action=list");
        }
    }

    private void handleAddUser(HttpServletRequest request,
                               HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy thông tin từ form
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String hearAboutUs = request.getParameter("hearAboutUs");
        boolean wantAnnouncements = request.getParameter("wantAnnouncements") != null;
        boolean wantEmails = request.getParameter("wantEmails") != null;
        String contactMethod = request.getParameter("contactMethod");

        // Tạo user mới
        User user = new User(firstName, lastName, email);
        user.setDateOfBirth(dateOfBirth);
        user.setHearAboutUs(hearAboutUs);
        user.setWantAnnouncements(wantAnnouncements);
        user.setWantEmails(wantEmails);
        user.setContactMethod(contactMethod);

        // Lưu vào database
        UserDB.save(user);

        response.sendRedirect("admin?action=list");
    }

    private void handleUpdateUser(HttpServletRequest request,
                                  HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy thông tin từ form
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String hearAboutUs = request.getParameter("hearAboutUs");
        boolean wantAnnouncements = request.getParameter("wantAnnouncements") != null;
        boolean wantEmails = request.getParameter("wantEmails") != null;
        String contactMethod = request.getParameter("contactMethod");

        // Cập nhật user
        User user = new User(firstName, lastName, email);
        user.setDateOfBirth(dateOfBirth);
        user.setHearAboutUs(hearAboutUs);
        user.setWantAnnouncements(wantAnnouncements);
        user.setWantEmails(wantEmails);
        user.setContactMethod(contactMethod);

        UserDB.save(user);

        response.sendRedirect("admin?action=list");
    }

    private void handleDeleteUser(HttpServletRequest request,
                                  HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        UserDB.delete(email);  // Gọi trực tiếp từ UserDB

        response.sendRedirect("admin?action=list");
    }

    // XÓA các phương thức trùng lặp bên dưới này - KHÔNG CẦN nữa vì đã gọi trực tiếp từ UserDB
    // private List<User> getAllUsersFromDB() { ... }
    // private void deleteUserFromDB(String email) { ... }
}