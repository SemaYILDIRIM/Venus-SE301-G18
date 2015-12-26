package IssueManagement;

import UserManagement.User;
import common.GenericData;
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
    public void deleteComment(String id,String userid,String Issueid){
        User u=new User();
        u.setId(Integer.parseInt(userid));
        issue.setId(Integer.parseInt(Issueid));
        comment.setId(Integer.parseInt(id));
        comment.setUser(u);
        comment.setIssue(issue);
        comment.deleteCmnt();
    }
    public void deleteAttach(String id,String Issueid){
        
        issue.setId(Integer.parseInt(Issueid));
        a.setId(Integer.parseInt(id));
        a.setIssue(issue);
        a.deleteAttach();
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
    
    
    
    //////////////////////////////
    
    
    public List<GenericData> getAllPriorityTypes(){
         return issue.getAllPriorityTypess();
     }
    
    public List<String> getAllIssueTypes(){
        return issue.getAllIssueTypess();
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
    
   public Issue findById(int id){
        return issue.findByIdd(id);
    }
   
       public List getAllIssueByMe(){
        return issue.getAllIssueByMee();
    }
   
}
