package IssueManagement;

import UserManagement.User;
import java.util.ArrayList;
import java.util.List;



/**
 *
 * @author Sema Yıldırım
 */
public class IssueManagementFacade {
    private Issue issue=new Issue();
    private Attachment a=new Attachment();
    private List<Attachment> atch=new ArrayList<Attachment>();
    private Comment comment =new Comment();
    private List<Comment> list;

    public IssueManagementFacade() {
    }
    
    public List<Issue> getIssuesAssignee(String id, String pro){
      return  issue.getIssueAssigneeList(Integer.parseInt(id),Integer.parseInt(pro));
    }
    public List<Issue> getIssuesManager(String id){
      return  issue.getIssueList(Integer.parseInt(id));
    }
    public void getCommentList(String id){
        setList(getComment().getComment(Integer.parseInt(id)));
    }
    public void saveCmnt(String cmnt, String userid,String issueid){
        IssueManagement.Issue i=new Issue();
                                i.setId(Integer.parseInt(issueid));
                                User u=new User();
                                u.setId(Integer.parseInt(userid));
                                Comment sss=new Comment();
                                sss.setComment(cmnt);
                                sss.setIssue(i);
                                sss.setUser(u);
        sss.saveComment();
    }
    public void saveattach(String path,String issueid){
        IssueManagement.Issue i=new Issue();
                         i.setId(Integer.parseInt(issueid));
        a=new  Attachment(i);
        a.setDocumentpath(path);
        a.save();
    }
    public void changestatus(String stu,int id){
        issue.setIssueStatus(stu,id);
    }
    public void getAttach(String id){
      this.setAtch(a.getAttachmentDetail(Integer.parseInt(id)));
      
    }
    public Issue getIssueById(String issueid,String userid){
       return issue.getIssueByid(Integer.parseInt(issueid));
       
        
    }
    public void IssueAssigneeStatus(int id,int assignee){
        issue.setIssueAssignee(id,assignee);
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

    /**
     * @return the comment
     */
    public Comment getComment() {
        return comment;
    }

    /**
     * @param comment the comment to set
     */
    public void setComment(Comment comment) {
        this.comment = comment;
    }

    /**
     * @return the atch
     */
    public List<Attachment> getAtch() {
        return atch;
    }

    /**
     * @param atch the atch to set
     */
    public void setAtch(List<Attachment> atch) {
        this.atch = atch;
    }

    /**
     * @return the attachs
     */
    

    /**
     * @param attachs the attachs to set
     */
   
}
