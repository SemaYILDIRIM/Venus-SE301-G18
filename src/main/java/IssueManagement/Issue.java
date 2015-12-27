package IssueManagement;


import HibernateSettings.HibernateUtil;
import proman.Project;
import UserManagement.User;
import common.GenericData;
import common.VenusSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class Issue  implements java.io.Serializable {


     private Integer id;
     private Project project;
     private User userByAssignee;
     private User userByCreatoruserId;
     private String summary;
     private String description;
     private Date creationDate;
     private Date updateDate;
     private String type;
     private String status;
     private Integer priority;
     private Date dueDate;
     private Set attachments = new HashSet(0);
     private Set issuehistories = new HashSet(0);
     private Set comments = new HashSet(0);
     private List<Issue> list;
    public Issue() {
    }

	
    public Issue(Project project, User userByAssignee, User userByCreatoruserId) {
        this.project = project;
        this.userByAssignee = userByAssignee;
        this.userByCreatoruserId = userByCreatoruserId;
    }
    public Issue(Project project, User userByAssignee, User userByCreatoruserId, String summary, String description, Date creationDate, Date updateDate, String type, String status, Integer priority, Date dueDate, Set attachments, Set issuehistories, Set comments) {
       this.project = project;
       this.userByAssignee = userByAssignee;
       this.userByCreatoruserId = userByCreatoruserId;
       this.summary = summary;
       this.description = description;
       this.creationDate = creationDate;
       this.updateDate = updateDate;
       this.type = type;
       this.status = status;
       this.priority = priority;
       this.dueDate = dueDate;
       this.attachments = attachments;
       this.issuehistories = issuehistories;
       this.comments = comments;
    }
   public List<Issue> getIssueList(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction(); 
        session.getTransaction().commit();
        Transaction tx;
        tx=session.beginTransaction();
        Query query = session.createQuery("from IssueManagement.Issue where project_id= :id");
        query.setParameter("id", id);
        setList((List<Issue>) query.list());
        tx.commit();
        session.close();
        return getList();
    }
   public Issue getIssueByid(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction(); 
        session.getTransaction().commit();
        Transaction tx;
        tx=session.beginTransaction();
        Query query = session.createQuery("from IssueManagement.Issue where id= :id");
        query.setParameter("id", id);
        setList((List<Issue>) query.list());
        tx.commit();
        session.close();
        return getList().get(0);
    }
   public List<Issue> getIssueAssigneeList(int id,int pro) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction(); 
        session.getTransaction().commit();
        Transaction tx;
        tx=session.beginTransaction();
        Query query = session.createQuery("from IssueManagement.Issue where assignee= :id and project_id= :proo");
        query.setParameter("id", id);
        query.setParameter("proo", pro);
        setList((List<Issue>) query.list());
        tx.commit();
        session.close();
        return getList();
    }
   public void setIssueStatus(String stu,int id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction(); 
        session.getTransaction().commit();
        Transaction tx;
        tx=session.beginTransaction();
        Query query = session.createQuery("update IssueManagement.Issue set status = :stu  where id = :id");
        query.setParameter("stu", stu);
        query.setInteger("id", id);
        int result = query.executeUpdate();
        tx.commit();
        session.close();
   }
   public void setIssueAssignee(int id,int assignee){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction(); 
        session.getTransaction().commit();
        Transaction tx;
        tx=session.beginTransaction();
        Query query = session.createQuery("update IssueManagement.Issue set assignee = :assignee  where id = :id");
        query.setInteger("assignee", assignee);
        query.setInteger("id", id);
        
        int result = query.executeUpdate();
        tx.commit();
        session.close();
   }
   public void setIssueCreator(int id,int creator){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction(); 
        session.getTransaction().commit();
        Transaction tx;
        tx=session.beginTransaction();
        Query query = session.createQuery("update IssueManagement.Issue set creatoruserID = :creator  where id = :id");
        query.setInteger("creator", creator);
        query.setInteger("id", id);
        
        int result = query.executeUpdate();
        tx.commit();
        session.close();
   }
   
   
   public void saveIssue(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        this.setCreationDate(new Date());
        this.setStatus(IssueStatus.OPEN);
        session.save(this);
        session.getTransaction().commit();
   }
   //////////////////////
   
   
   
   public List<GenericData> getAllPriorityTypess(){
       List<GenericData> l = new ArrayList<GenericData>();
       
       l.add(new GenericData(1, "Major"));
       l.add(new GenericData(2, "Minor"));
       l.add(new GenericData(3, "Critical"));
       
       return l;
   }
   public List<String> getAllIssueTypess(){
       List<String> l = new ArrayList<String>();
       
       l.add("Bug");
       l.add("Task");
       l.add("Improvement");
       
       return l;
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
    public User getUserByAssignee() {
        return this.userByAssignee;
    }
    
    public void setUserByAssignee(User userByAssignee) {
        this.userByAssignee = userByAssignee;
    }
    public User getUserByCreatoruserId() {
        return this.userByCreatoruserId;
    }
    
    public void setUserByCreatoruserId(User userByCreatoruserId) {
        this.userByCreatoruserId = userByCreatoruserId;
    }
    public String getSummary() {
        return this.summary;
    }
    
    public void setSummary(String summary) {
        this.summary = summary;
    }
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
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
    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
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
    public Set getAttachments() {
        return this.attachments;
    }
    
    public void setAttachments(Set attachments) {
        this.attachments = attachments;
    }
    public Set getIssuehistories() {
        return this.issuehistories;
    }
    
    public void setIssuehistories(Set issuehistories) {
        this.issuehistories = issuehistories;
    }
    public Set getComments() {
        return this.comments;
    }
    
    public void setComments(Set comments) {
        this.comments = comments;
    }

    /**
     * @return the list
     */
    public List<Issue> getList() {
        return list;
    }

    /**
     * @param list the list to set
     */
    public void setList(List<Issue> list) {
        this.list = list;
    }

    public Issue findByIdd(int id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx;
        tx=session.beginTransaction();
        Query query = session.createQuery("from IssueManagement.Issue where id.id=:id");
        query.setParameter("id", id);
        List<Issue> list = query.list();
        Issue issue = list.get(0);
        
        Hibernate.initialize(issue.getProject());
        Hibernate.initialize(issue.getUserByAssignee());
        Hibernate.initialize(issue.getUserByCreatoruserId());
        Hibernate.initialize(issue.getComments());
        
        tx.commit();
        session.close();
        
        System.out.println(list);
        return issue;
    }
    
    public List getAllIssueByMee(){
        
       Session session = HibernateUtil.getSessionFactory().openSession();
        
        User loggedInUser = VenusSession.getSession().getUser();
        Transaction transaction;
        transaction=session.beginTransaction();
        Query query = session.createQuery("from IssueManagement.Issue u where u.userByCreatoruserId.id = :userid");
        query.setParameter("userid", loggedInUser.getId());
         
        List<Issue> listt = query.list();
        transaction.commit();
        session.close();
        
        System.out.println(listt); 
    
    
        return listt;
    }

    //////////////////////////////////////////
    public static class IssueStatus{
        public static final String OPEN ="open";
        public static final String CLOSED ="closed";
        public static final String RESOLVED ="resolved";     
    }

}


