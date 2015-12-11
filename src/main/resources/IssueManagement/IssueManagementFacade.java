package IssueManagement;

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
        //setList(getComment().getComment(Integer.parseInt(id)));
    }
//    public void saveCmnt(String cmnt,String asignee, String proid,String issueid){
//        IssueManagement.Issue i=new Issue();
//                                IssueManagement.IssueId ii= new IssueId();
//                                ii.setAssignee(Integer.parseInt(asignee));
//                                ii.setProjectId(Integer.parseInt(proid));
//                                ii.setId(Integer.parseInt(issueid));
//                                i.setId(ii);
//                                Comment sss=new Comment(i);
//                                sss.setComment(cmnt);
//        sss.saveComment();
//    }
//    public void saveattach(String path){
//        IssueManagement.Issue i=new Issue();
//                                IssueManagement.IssueId ii= new IssueId();
//                                ii.setAssignee(110);
//                                ii.setProjectId(1);
//                                ii.setId(2);
//                                i.setId(ii);
//        a=new  Attachment(i);
//        a.setDocumentpath(path);
//        a.save();
//    }
//    public void getAttach(String id){
//      this.setAtch(a.getAttachmentDetail(Integer.parseInt(id)));
//      
//    }
    public Issue getIssueById(String issueid,String userid){
       return issue.getIssueByid(Integer.parseInt(issueid));
       
        
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
