package proman;
// Generated Dec 6, 2015 9:28:16 PM by Hibernate Tools 4.3.1


import HibernateSettings.HibernateUtil;
import UserManagement.User;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * Projectuser generated by hbm2java
 */
public class Projectuser  implements java.io.Serializable {


     private Integer id;
     private Project project;
     private User user;
     private Date creationDate;
     private List list=new ArrayList();
    public Projectuser() {
    }

	
    public Projectuser(Project project, User user) {
        this.project = project;
        this.user = user;
    }
    public Projectuser(Project project, User user, Date creationDate) {
       this.project = project;
       this.user = user;
       this.creationDate = creationDate;
    }
    public List<Projectuser> getProUser(int pro_id){
    Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.getTransaction().commit();
        Transaction tx;
        tx=session.beginTransaction();
        Query query = session.createQuery("from  proman.Projectuser where project.id=:id");
        query.setParameter("id", pro_id);
        setList(query.list());
tx.commit();
session.close();
return  getList();
}
    public List<Projectuser> getProProject(int user_id){
    Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.getTransaction().commit();
        Transaction tx;
        tx=session.beginTransaction();
        Query query = session.createQuery("from  proman.Projectuser where user.id=:id");
        query.setParameter("id", user_id);
        setList(query.list());
tx.commit();
session.close();
return  getList();
}   
    public void saveProUser(Projectuser p) {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(p);
        session.getTransaction().commit();
       
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Project getProject() {
        return this.project;
    }
    
    public void setProject(Project project) {
        this.project = project;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public Date getCreationDate() {
        return this.creationDate;
    }
    
    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    /**
     * @return the list
     */
    public List getList() {
        return list;
    }

    /**
     * @param list the list to set
     */
    public void setList(List list) {
        this.list = list;
    }




}


