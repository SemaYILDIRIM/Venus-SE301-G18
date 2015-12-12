package UserManagement;
// Generated Dec 6, 2015 9:28:16 PM by Hibernate Tools 4.3.1


import HibernateSettings.HibernateUtil;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
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
     private Set comments = new HashSet(0);
     private Set projectusers = new HashSet(0);
     private Set issuehistories = new HashSet(0);
     private Set projects = new HashSet(0);
     private Set issuesForAssignee = new HashSet(0);
     private Set issuesForCreatoruserId = new HashSet(0);
     private List list=new ArrayList();
    public User() {
    }

    public User(String name, String surname, String role, Date creationDate, Date updateDate, Integer status, String photoPath, String email, String password, Set comments, Set projectusers, Set issuehistories, Set projects, Set issuesForAssignee, Set issuesForCreatoruserId) {
       this.name = name;
       this.surname = surname;
       this.role = role;
       this.creationDate = creationDate;
       this.updateDate = updateDate;
       this.status = status;
       this.photoPath = photoPath;
       this.email = email;
       this.password = password;
       this.comments = comments;
       this.projectusers = projectusers;
       this.issuehistories = issuehistories;
       this.projects = projects;
       this.issuesForAssignee = issuesForAssignee;
       this.issuesForCreatoruserId = issuesForCreatoruserId;
    }
    /**
     * This method check the user from database
     * context User inv:
     * @inv self.name=name
     * @inv self.password=password
     * @pre session.createQuery()
     * @return void
     */
   public void login(String name, String password){
        Session session = HibernateSettings.HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        //session.save(this);
        session.getTransaction().commit();
        Transaction tx;
        tx=session.beginTransaction();
        Query query = session.createQuery("from UserManagement.User where email= :namee and password= :pwrd");
        query.setParameter("namee", name);
        query.setParameter("pwrd", password);
        setList(query.list());
        tx.commit();
        session.close();
    }
   /**
     * This method saves the user
     * context User inv:
     * @pre session.save()
     * @return void
     */
   public void save(){
        Session session = HibernateSettings.HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(this);
        session.getTransaction().commit();
        session.close();
    }
   /**
     * This method deletes the user
     * context User inv:
     * @pre session.delete()
     * @return void
     */
   public void delete(){
        Session session = HibernateSettings.HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(this);
        session.getTransaction().commit();
        session.close();
    }
    public boolean checkvalid(String ss){
        if(ss.equals("Logout")){
            return true;
        }return false;
    }
    /**
     * @param name the name to set
     * context User inv:
     * @inv self.photoPath= getPicture()
     * @pre session.createQuery()
     * @return the photopath
     */
    public String getpicture(String name){
        Session session = HibernateSettings.HibernateUtil.getSessionFactory().openSession();
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
    
    /**
     * @param name the name to set
     * context User inv:
     * @inv self.Userid=id
     * @pre session.createQuery()
     * @return the User id
     */
     public int getId(String name){
        Session session = HibernateSettings.HibernateUtil.getSessionFactory().openSession();
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
     /**
     * @param id the id to set
     * context User inv:
     * @inv self.Userid=id
     * @pre session.createQuery()
     * @return the User
     */
     public User getUser(String id){
       Session session = HibernateSettings.HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
//        session.save(this);
        session.getTransaction().commit();
        Transaction tx;
        tx=session.beginTransaction();
        Query query = session.createQuery("from UserManagement.User where id= :idd");
        query.setParameter("idd", Integer.parseInt(id));
        List<User> user=query.list();
        tx.commit();
        session.close();
        return user.get(0);  
    
    }
    public void createUser(String name){
            Session session = HibernateSettings.HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction(); 
    //        User u=new User();
    //        this.setName(name);
    //        this.setEmail("s@gmail.com");
    //        session.save(this);
            session.getTransaction().commit();
            Transaction tx;
            tx=session.beginTransaction();
            Query query = session.createQuery("from UserManagement.User where password='123'");

        setList(query.list());
    tx.commit();
    session.close();
    }
    
    
    /**
     * @param search the search to set
     * context User inv:
     * @inv List<User>->size >= 0
     * @pre session.createQuery()
     * @return the List<User>
     */
    public List<User> searchString(String search){
            Session session = HibernateSettings.HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.getTransaction().commit();
            Transaction tx;
            tx=session.beginTransaction();
            Query query = session.createQuery("from UserManagement.User where name= :word");
            query.setParameter("word", search);
        setList(query.list());
    tx.commit();
    session.close();
    return getList();
    }
    
    /**
     * @param pro_id the pro_id to set
     * context User inv:
     * @inv List<User>->size >= 0
     * @pre session.createQuery()
     * @pre self.id=pro_id
     * @return the List<User>
     */
    public List<User> getProUser(int pro_id){
        Session session = HibernateSettings.HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.getTransaction().commit();
            Transaction tx;
            tx=session.beginTransaction();
            Query query = session.createQuery("FROM UserManagement.User u, proman.Projectuser pu  where pu.project_id= :id and u.id= pu.user_id");
            query.setParameter("id", pro_id);
        setList(query.list());
    tx.commit();
    session.close();
    return getList();
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
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public Set getComments() {
        return this.comments;
    }
    
    public void setComments(Set comments) {
        this.comments = comments;
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

