package IssueManagement;


import UserManagement.User;
import java.util.Date;


public class Issuehistory  implements java.io.Serializable {


     private Integer id;
     private Issue issue;
     private User user;
     private Date updateDate;

    public Issuehistory() {
    }

	
    public Issuehistory(Issue issue, User user) {
        this.issue = issue;
        this.user = user;
    }
    public Issuehistory(Issue issue, User user, Date updateDate) {
       this.issue = issue;
       this.user = user;
       this.updateDate = updateDate;
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
    public Date getUpdateDate() {
        return this.updateDate;
    }
    
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }




}


