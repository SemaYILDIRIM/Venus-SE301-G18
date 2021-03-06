package proman;
// Generated Nov 16, 2015 9:40:26 AM by Hibernate Tools 4.3.1


import HibernateSettings.HibernateUtil;
import UserManagement.User;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * Project generated by hbm2java
 */
public class Project  implements java.io.Serializable {


     private Integer id;
     private User user;
     private String discription;
     private String name;
     private Date creationDate;
     private String type;
     private Integer priority;
     private Date dueDate;
     private Set issues = new HashSet(0);
     private Set projectusers = new HashSet(0);
    private List<Project> list;
    public Project() {
    }

	
    public Project (User user) {
        this.user = user;
    }
    public Project(User user, String discription, String name, Date creationDate, String type, Integer priority, Date dueDate, Set issues, Set projectusers) {
       this.user = user;
       this.discription = discription;
       this.name = name;
       this.creationDate = creationDate;
       this.type = type;
       this.priority = priority;
       this.dueDate = dueDate;
       this.issues = issues;
       this.projectusers = projectusers;
    }
   public void saveProject(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(this);
        session.getTransaction().commit();
   }
   public List<Project> getProjects(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction(); 
        session.getTransaction().commit();
        Transaction tx;
        tx=session.beginTransaction();
        Query query = session.createQuery("from proman.Project where manager= :id");
        query.setParameter("id", id);
        list = query.list();
        tx.commit();
        session.close();
        return list;
    }
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public String getDiscription() {
        return this.discription;
    }
    
    public void setDiscription(String discription) {
        this.discription = discription;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public Date getCreationDate() {
        return this.creationDate;
    }
    
    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }
    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
    public Integer getPriority() {
        return this.priority;
    }
    
    public void setPriority(Integer priority) {
        this.priority = priority;
    }
    public Date getDueDate() {
        return this.dueDate;
    }
    
    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }
    public Set getIssues() {
        return this.issues;
    }
    
    public void setIssues(Set issues) {
        this.issues = issues;
    }
    public Set getProjectusers() {
        return this.projectusers;
    }
    
    public void setProjectusers(Set projectusers) {
        this.projectusers = projectusers;
    }

    /**
     * @return the list
     */
    public List<Project> getList() {
        return list;
    }

    /**
     * @param list the list to set
     */
    public void setList(List<Project> list) {
        this.list = list;
    }




}


