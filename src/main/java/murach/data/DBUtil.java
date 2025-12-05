package murach.data;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

public class DBUtil {
    private static EntityManagerFactory emf;
    private static HikariDataSource dataSource;

    public static EntityManagerFactory getEmf() {
        if (emf == null) {
            Map<String, Object> properties = new HashMap<>();

            // Tạo DataSource với HikariCP
            properties.put("javax.persistence.nonJtaDataSource", createDataSource());

            emf = Persistence.createEntityManagerFactory("emailListPU", properties);
        }
        return emf;
    }

    private static DataSource createDataSource() {
        if (dataSource == null) {
            try {
                // Load driver trước khi tạo DataSource
                Class.forName("com.mysql.cj.jdbc.Driver");

                HikariConfig config = new HikariConfig();

                // Lấy từ env vars
                config.setJdbcUrl(System.getenv("DB_URL"));
                config.setUsername(System.getenv("DB_USER"));
                config.setPassword(System.getenv("DB_PASSWORD"));

                // ĐẶT DRIVER CLASS NAME Ở ĐÂY
                config.setDriverClassName("com.mysql.cj.jdbc.Driver");

                // Pool settings
                config.setPoolName("EmailListPool");
                config.setMinimumIdle(5);
                config.setMaximumPoolSize(20);
                config.setConnectionTimeout(30000); // 30 seconds
                config.setIdleTimeout(300000); // 5 minutes
                config.setMaxLifetime(1800000); // 30 minutes
                config.setConnectionTestQuery("SELECT 1");

                // MySQL optimizations
                config.addDataSourceProperty("cachePrepStmts", "true");
                config.addDataSourceProperty("prepStmtCacheSize", "250");
                config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
                config.addDataSourceProperty("useServerPrepStmts", "true");
                config.addDataSourceProperty("useLocalSessionState", "true");
                config.addDataSourceProperty("rewriteBatchedStatements", "true");
                config.addDataSourceProperty("cacheResultSetMetadata", "true");
                config.addDataSourceProperty("cacheServerConfiguration", "true");
                config.addDataSourceProperty("elideSetAutoCommits", "true");
                config.addDataSourceProperty("maintainTimeStats", "false");

                dataSource = new HikariDataSource(config);

            } catch (ClassNotFoundException e) {
                throw new RuntimeException("MySQL Driver not found. Make sure mysql-connector-java is in classpath.", e);
            }
        }
        return dataSource;
    }

    public static void close() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
        if (dataSource != null && !dataSource.isClosed()) {
            dataSource.close();
        }
    }
}