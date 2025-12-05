package murach.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import murach.business.User;

public class UserDB {

    // Hàm thêm User vào Database
    public static void insert(User user) {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(user); // Lưu object vào DB
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    // Hàm tìm User theo Email (Ví dụ)
    public static User selectUser(String email) {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        String qString = "SELECT u FROM User u WHERE u.email = :email";
        TypedQuery<User> q = em.createQuery(qString, User.class);
        q.setParameter("email", email);
        try {
            return q.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }
    public static boolean emailExists(String email) {
        // Tạo EntityManager từ DBUtil
        EntityManager em = DBUtil.getEmf().createEntityManager();

        // Câu lệnh truy vấn tìm User theo email
        String qString = "SELECT u FROM User u " +
                "WHERE u.email = :email";

        TypedQuery<User> q = em.createQuery(qString, User.class);
        q.setParameter("email", email);

        try {
            // Nếu tìm thấy User, nghĩa là email đã tồn tại -> trả về true
            User user = q.getSingleResult();
            return true;
        } catch (NoResultException e) {
            // Nếu không tìm thấy (NoResultException), nghĩa là email chưa có -> trả về false
            return false;
        } finally {
            em.close();
        }
    }
}