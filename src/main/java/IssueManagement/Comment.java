package IssueManagement;


import HibernateSettings.HibernateUtil;
import UserManagement.User;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class Comment  implements java.io.Serializable {


     private Integer id;
     private Issue issue;
     private User user;
     private Date creationDate;
     private String comment;
     private String creatorName;
     private List<Comment> list;
    public Comment() {
    }

	
    public Comment(Issue issue, User user) {
        this.issue = issue;
        this.user = user;
    }
    public Comment(Issue issue, User user, Date creationDate, String comment, String creatorName) {
       this.issue = issue;
       this.user = user;
       this.creationDate = creationDate;
       this.comment = comment;
       this.creatorName = creatorName;
    }
    public void saveComment(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(this);
        session.getTransaction().commit();
   }
   public List<Comment> getComment(int id){
       Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction(); 
        session.getTransaction().commit();
        Transaction tx;
        tx=session.beginTransaction();
        Query query = session.createQuery("from IssueManagement.Comment where issue_id= :id");
        query.setParameter("id", id);
        setList((List<Comment>) query.list());
        tx.commit();
        session.close();
        return getList();
   }
   public void deleteCmnt(){
        Session session = HibernateSettings.HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(this);
        session.getTransaction().commit();
        session.close();
   }
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Issue getIssue() {
        return this.issue;
    }
    
    public void setIssue(Issue issue) {
        this.issue = issue;
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
    public String getComment() {
        return this.comment;
    }
    
    public void setComment(String comment) {
        this.comment = comment;
    }
    public String getCreatorName() {
        return this.creatorName;
    }
    
    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName;
    }

    /**
     * @return the list
     */
    public List<Comment> getList() {
        return list;
    }

    /**
     * @param list the list to set
     */
    public void setList(List<Comment> list) {
        this.list = list;
    }




}


