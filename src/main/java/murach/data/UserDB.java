package murach.data;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import murach.business.User;

import java.util.ArrayList;
import java.util.List;

public class UserDB {

    // Hàm thêm User vào Database (chỉ insert mới)
    public static void insert(User user) {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(user);
            trans.commit();
        } catch (Exception e) {
            System.out.println("Error in insert: " + e.getMessage());
            if (trans.isActive()) {
                trans.rollback();
            }
        } finally {
            em.close();
        }
    }

    // Hàm cập nhật User đã tồn tại
    public static void update(User user) {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();

            // Tìm user hiện tại theo email
            User existingUser = selectUser(user.getEmail());

            if (existingUser != null) {
                // Cập nhật thông tin
                existingUser.setFirstName(user.getFirstName());
                existingUser.setLastName(user.getLastName());
                existingUser.setDateOfBirth(user.getDateOfBirth());
                existingUser.setHearAboutUs(user.getHearAboutUs());
                existingUser.setWantAnnouncements(user.isWantAnnouncements());
                existingUser.setWantEmails(user.isWantEmails());
                existingUser.setContactMethod(user.getContactMethod());

                em.merge(existingUser);
                System.out.println("Updated user with email: " + user.getEmail());
            } else {
                // Nếu không tìm thấy, thêm mới
                em.persist(user);
                System.out.println("Inserted new user with email: " + user.getEmail());
            }

            trans.commit();
        } catch (Exception e) {
            System.out.println("Error in update: " + e.getMessage());
            if (trans.isActive()) {
                trans.rollback();
            }
        } finally {
            em.close();
        }
    }

    // Hàm thêm mới hoặc cập nhật
    public static void save(User user) {
        if (emailExists(user.getEmail())) {
            update(user);
        } else {
            insert(user);
        }
    }

    // Hàm tìm User theo Email
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
        EntityManager em = DBUtil.getEmf().createEntityManager();
        String qString = "SELECT u FROM User u WHERE u.email = :email";
        TypedQuery<User> q = em.createQuery(qString, User.class);
        q.setParameter("email", email);
        try {
            q.getSingleResult();
            return true;
        } catch (NoResultException e) {
            return false;
        } finally {
            em.close();
        }
    }

    // Thêm vào UserDB.java - CHỈ GIỮ LẠI 1 LẦN
    public static List<User> getAllUsers() {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        try {
            TypedQuery<User> query = em.createQuery("SELECT u FROM User u", User.class);
            return query.getResultList();
        } catch (Exception e) {
            System.out.println("Error getting all users: " + e.getMessage());
            return new ArrayList<>();
        } finally {
            em.close();
        }
    }

    public static boolean delete(String email) {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            User user = em.find(User.class, email);
            if (user != null) {
                em.remove(user);
                trans.commit();
                System.out.println("Deleted user with email: " + email);
                return true;
            }
            return false;
        } catch (Exception e) {
            System.out.println("Error in delete: " + e.getMessage());
            if (trans.isActive()) {
                trans.rollback();
            }
            return false;
        } finally {
            em.close();
        }
    }

    // XÓA các phương thức trùng lặp bên dưới - CHỈ GIỮ 1 BẢN Ở TRÊN
    // KHÔNG cần phần này nữa vì đã có ở trên
}