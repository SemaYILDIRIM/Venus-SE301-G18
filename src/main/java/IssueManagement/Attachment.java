package IssueManagement;


import HibernateSettings.HibernateUtil;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class Attachment  implements java.io.Serializable {


     private Integer id;
     private Issue issue;
     private String documentpath;
     private Date creationDate;

    public Attachment() {
    }

	
    public Attachment(Issue issue) {
        this.issue = issue;
    }
    public Attachment(Issue issue, String documentpath, Date creationDate) {
       this.issue = issue;
       this.documentpath = documentpath;
       this.creationDate = creationDate;
    }
    void save() {
   Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(this);
        session.getTransaction().commit();
    
    }
    public List<Attachment> getAttachmentDetail(int id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.getTransaction().commit();
        Transaction tx;
        tx=session.beginTransaction();
        Query query = session.createQuery("from IssueManagement.Attachment where issue_id= :idd");
        query.setParameter("idd", id);
        List<Attachment> attach=query.list();
        
        return attach;
    }
    public void deleteAttach(){
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
    public String getDocumentpath() {
        return this.documentpath;
    }
    
    public void setDocumentpath(String documentpath) {
        this.documentpath = documentpath;
    }
    public Date getCreationDate() {
        return this.creationDate;
    }
    
    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }




}


