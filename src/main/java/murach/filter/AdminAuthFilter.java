package murach.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(
    filterName = "AdminAuthFilter",
    urlPatterns = {"/admin", "/adminDashboard.jsp", "/adminUserForm.jsp", "/adminDeleteConfirm.jsp"}
)
public class AdminAuthFilter implements Filter {
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("✅ AdminAuthFilter initialized");
    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, 
                         FilterChain chain) throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        // Bỏ qua trang login
        if (httpRequest.getRequestURI().endsWith("adminLogin.jsp") ||
            httpRequest.getRequestURI().endsWith("/admin") && 
            "login".equals(httpRequest.getParameter("action"))) {
            chain.doFilter(request, response);
            return;
        }
        
        // Kiểm tra đăng nhập
        HttpSession session = httpRequest.getSession(false);
        Boolean isLoggedIn = (session != null) ? 
            (Boolean) session.getAttribute("adminLoggedIn") : false;
        
        if (isLoggedIn == null || !isLoggedIn) {
            // Chuyển hướng đến trang login
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/adminLogin.jsp");
            return;
        }
        
        chain.doFilter(request, response);
    }
    
    @Override
    public void destroy() {
        System.out.println("❌ AdminAuthFilter destroyed");
    }
}