package LoginManagement;

///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package LoginManagement;
//
//import UserManagement.User;
//import HibernateSettings.HibernateUtil;
//import java.util.List;
//import javax.persistence.Entity;
//import javax.persistence.Id;
//import org.hibernate.Query;
//import org.hibernate.Session;
//import org.hibernate.Transaction;
//
///**
// *
// * @author LinkTera
// */
//@Entity
//public class login implements java.io.Serializable{
//    @Id
//    private Long id;
//   private List list;
//    public void login(String name, String password){
//        Session session = HibernateUtil.getSessionFactory().openSession();
//        session.beginTransaction();
//        session.save(this);
//        session.getTransaction().commit();
//        Transaction tx;
//        tx=session.beginTransaction();
//        Query query = session.createQuery("from UserManagement.User where name= :namee and password= :pwrd");
//        query.setParameter("namee", name);
//        query.setParameter("pwrd", password);
//
//        setList(query.list());
//tx.commit();
//session.close();
//         
//
//
//    }
//
//    /**
//     * @return the list
//     */
//    public List getList() {
//        return list;
//    }
//
//    /**
//     * @param list the list to set
//     */
//    public void setList(List list) {
//        this.list = list;
//    }
//
//    public Long getId() {
//        return id;
//    }
//
//    public void setId(Long id) {
//        this.id = id;
//    }
//    
//}
