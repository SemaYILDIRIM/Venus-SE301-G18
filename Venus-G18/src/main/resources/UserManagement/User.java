package UserManagement;
// Generated Nov 16, 2015 9:40:26 AM by Hibernate Tools 4.3.1


import HibernateSettings.HibernateUtil;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 * User generated by hbm2java
 */
public class User  implements java.io.Serializable {


     private Integer id;
     private String name;
     private String surname;
     private String role;
     private Date creationDate;
     private Date updateDate;
     private Integer status;
     private String photoPath;
     private String email;
     private String password;
     private Set projectusers = new HashSet(0);
     private Set issuehistories = new HashSet(0);
     private Set projects = new HashSet(0);
     private Set issuesForAssignee = new HashSet(0);
     private Set issuesForCreatoruserId = new HashSet(0);
     private List list=new ArrayList();
     private HttpSession sessionl;
    public User() {
        
        list.add("Thing1");
        list.add("Thing2");
        list.add("Thing3");
    }

    public User(String name, String surname, String role, Date creationDate, Date updateDate, Integer status, String photoPath, String email, Set projectusers, Set issuehistories, Set projects, Set issuesForAssignee, Set issuesForCreatoruserId) {
       this.name = name;
       this.surname = surname;
       this.role = role;
       this.creationDate = creationDate;
       this.updateDate = updateDate;
       this.status = status;
       this.photoPath = photoPath;
       this.email = email;
       this.projectusers = projectusers;
       this.issuehistories = issuehistories;
       this.projects = projects;
       this.issuesForAssignee = issuesForAssignee;
       this.issuesForCreatoruserId = issuesForCreatoruserId;
        list.add("Thing4");
        list.add("Thing5");
        list.add("Thing6");
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getSurname() {
        return this.surname;
    }
    
    public void setSurname(String surname) {
        this.surname = surname;
    }
    public String getRole() {
        return this.role;
    }
    
    public void setRole(String role) {
        this.role = role;
    }
    public Date getCreationDate() {
        return this.creationDate;
    }
    
    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }
    public Date getUpdateDate() {
        return this.updateDate;
    }
    
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }
    public String getPhotoPath() {
        return this.photoPath;
    }
    
    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public Set getProjectusers() {
        return this.projectusers;
    }
    
    public void setProjectusers(Set projectusers) {
        this.projectusers = projectusers;
    }
    public Set getIssuehistories() {
        return this.issuehistories;
    }
    
    public void setIssuehistories(Set issuehistories) {
        this.issuehistories = issuehistories;
    }
    public Set getProjects() {
        return this.projects;
    }
    
    public void setProjects(Set projects) {
        this.projects = projects;
    }
    public Set getIssuesForAssignee() {
        return this.issuesForAssignee;
    }
    
    public void setIssuesForAssignee(Set issuesForAssignee) {
        this.issuesForAssignee = issuesForAssignee;
    }
    public Set getIssuesForCreatoruserId() {
        return this.issuesForCreatoruserId;
    }
    
    public void setIssuesForCreatoruserId(Set issuesForCreatoruserId) {
        this.issuesForCreatoruserId = issuesForCreatoruserId;
    }
    public void login(String name, String password){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        //session.save(this);
        session.getTransaction().commit();
        Transaction tx;
        tx=session.beginTransaction();
        Query query = session.createQuery("from UserManagement.User where email= :namee and password= :pwrd");
        query.setParameter("namee", name);
        query.setParameter("pwrd", password);
        list=query.list();
        tx.commit();
        session.close();
         


    }
    public boolean checkvalid(String ss){
        if(ss.equals("Logout")){
            return true;
        }return false;
    }
    public String getpicture(String name){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
//        session.save(this);
        session.getTransaction().commit();
        Transaction tx;
        tx=session.beginTransaction();
        Query query = session.createQuery("select photoPath from UserManagement.User where email= :namee");
        query.setParameter("namee", name);
        List photo=query.list();
        if(!photo.get(0).toString().equals("sema"))
        return photo.get(0).toString();
        else return "https://cdn0.iconfinder.com/data/icons/thin-users-people/57/thin-191_user_profile_avatar-512.png";
    }
     public int getId(String name){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
//        session.save(this);
        session.getTransaction().commit();
        Transaction tx;
        tx=session.beginTransaction();
        Query query = session.createQuery("select id from UserManagement.User where email= :namee");
        query.setParameter("namee", name);
        List photo=query.list();
        
        return Integer.parseInt(photo.get(0).toString());
    }

public void createUser(String name){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction(); 
//        User u=new User();
//        this.setName(name);
//        this.setEmail("s@gmail.com");
//        session.save(this);
        session.getTransaction().commit();
        Transaction tx;
        tx=session.beginTransaction();
        Query query = session.createQuery("from UserManagement.User where password='123'");

list = query.list();
tx.commit();
session.close();
}

    /**
     * @return the list
     */
    public List getList() {
        return list;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the sessionl
     */
    public HttpSession getSessionl() {
        return sessionl;
    }

    /**
     * @param sessionl the sessionl to set
     */
    public void setSessionl(HttpSession sessionl) {
        this.sessionl = sessionl;
    }


}


