package murach.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(
        filterName = "CharacterEncodingFilter",
        urlPatterns = "/*",
        asyncSupported = true  // Tùy chọn: hỗ trợ async request
)
public class CharacterEncodingFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("✅ CharacterEncodingFilter đã được khởi tạo");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String requestURI = httpRequest.getRequestURI();

        // Skip static resources (optional)
        if (requestURI.endsWith(".css") || requestURI.endsWith(".js")
                || requestURI.endsWith(".png") || requestURI.endsWith(".jpg")
                || requestURI.endsWith(".gif") || requestURI.endsWith(".ico")) {
            chain.doFilter(request, response);
            return;
        }

        // Thiết lập encoding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        System.out.println("❌ CharacterEncodingFilter đã bị hủy");
    }
}