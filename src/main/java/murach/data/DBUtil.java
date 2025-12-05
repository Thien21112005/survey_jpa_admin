package murach.data;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.HashMap;
import java.util.Map;

public class DBUtil {
    private static EntityManagerFactory emf;

    // Tạo EMF với override từ env vars
    public static EntityManagerFactory getEmf() {
        if (emf == null) {
            Map<String, String> properties = new HashMap<>();
            // Lấy từ env vars (set ở hệ thống hoặc IntelliJ/Tomcat)
            properties.put("javax.persistence.jdbc.url", System.getenv("DB_URL"));
            properties.put("javax.persistence.jdbc.user", System.getenv("DB_USER"));
            properties.put("javax.persistence.jdbc.password", System.getenv("DB_PASSWORD"));
            // Có thể thêm các prop khác nếu cần

            if (properties.get("javax.persistence.jdbc.url") == null ||
                    properties.get("javax.persistence.jdbc.user") == null ||
                    properties.get("javax.persistence.jdbc.password") == null) {
                throw new RuntimeException("Missing DB env vars: DB_URL, DB_USER, DB_PASSWORD");
            }

            emf = Persistence.createEntityManagerFactory("emailListPU", properties);
        }
        
        return emf;
    }
}