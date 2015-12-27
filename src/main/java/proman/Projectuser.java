package proman;


import HibernateSettings.HibernateUtil;
import UserManagement.User;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;



public class Projectuser  implements java.io.Serializable {


     private Integer id;
     private Project project;
     private User user;
     private Date creationDate;
     private List list=new ArrayList();
     private List<User> userlist=new ArrayList();
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
    public List<Projectuser> getUserProject(int user_id,int pro_id){
    Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.getTransaction().commit();
        Transaction tx;
        tx=session.beginTransaction();
        Query query = session.createQuery("from  proman.Projectuser where user.id= :id and project_id= :pro_id");
        query.setParameter("id", user_id);
        query.setParameter("pro_id", pro_id);
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
    public List<User> listofresolveStatus(String role, int proid){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction(); 
        Transaction tx;
        tx=session.beginTransaction();
        List<Projectuser> l=new ArrayList<Projectuser>();
        
        Query query = session.createQuery("FROM proman.Projectuser where project_id=:id");
//           query.setParameter("stu", stu);
           query.setParameter("id", proid);
           l=query.list();
           tx.commit();
        session.close();
       if(role.contains("manager")||role.contains("developer")){
           
        for(int i=0;i<l.size();i++){
            String x=l.get(i).getUser().getId()+"";
          if(user.getUser(x).getRole().contains("developer")){
                getUserlist().add(user.getUser(x));
          }
      }
       }
       else if(role.contains("tester")){
           for(int i=0;i<l.size();i++){
                String x=l.get(i).getUser().getId()+"";
          if(user.getUser(x).getRole().contains("manager")){
                    getUserlist().add(user.getUser(x));
          }
      }
       }
      
       return getUserlist();
       
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

    /**
     * @return the userlist
     */
    public List<User> getUserlist() {
        return userlist;
    }

    /**
     * @param userlist the userlist to set
     */
    public void setUserlist(List<User> userlist) {
        this.userlist = userlist;
    }




}


