package proman;
import UserManagement.User;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Sema Yıldırım
 */
public class ProjectManagementFacade {
    private Project pro = new Project();
    private Projectuser pp=new Projectuser();
    private List<User> userlist=new ArrayList();
    
    /**
     * This method gets Project Detail information  from database
     * context Project inv:
     * @inv self.pro.id=id
     * @pre self.pro.getProjectDetails(Integer.parseInt(id));
     * @return Project
     */
    public Project getProjectDetail(String id){
        return getPro().getProjectDetails(Integer.parseInt(id));
    }
    
    /**
     * This method gets Project User Detail information  from database
     * by using ProjectUser table
     * context Project inv:
     * @inv self.pp.id=id
     * @inv List<Projectuser>.size >= 0
     * @pre self.pp.getProUser(id)
     * @return List<Projectuser> 
     */
    public List<Projectuser> getProjectUser(int id){
        
      return getPp().getProUser(id); 
    }
    /**
     * This method gets Project User Detail information  from database
     * by using ProjectUser table
     * context Project inv:
     * @inv user.id=id
     * @pre pp.getProProject(id)
     * @return List<Projectuser> 
     */
    public List<Projectuser> getProjectProject(int id){
      return getPp().getProProject(id); 
    }
    /**
     * This method saves Project User Detail information  to database
     * by using ProjectUser table
     * Method sets user and project's attributes 
     * context Project inv:
     * @inv user.id=uid
     * @inv user.id=managerid
     * @inv pp.id=proid
     * @pre pp.saveProUser(prouser)
     */
    public void saveProjectUser(String proid,String uid,String managerid){
      Project p1 = new Project();
      User manager=new User();
      manager.setId(Integer.parseInt(managerid));
      p1.setId(Integer.parseInt(proid));
      p1.setUser(manager);
      
      
      User u1=new User();
      u1.setId(Integer.parseInt(uid));
      Projectuser prouser =new Projectuser(p1, u1);
        getPp().saveProUser(prouser);
    }
    
    public void  getlistofUser(String role,int proid){
        setUserlist(getPp().listofresolveStatus(role,proid));
       //return userlist;
    }

    
    
    
    ////////////////////////////////
    
    public List getAllProjects(){
         
         return pro.getAllProjectss();
     }
    
    
    /**
     * @return the userlist
     */
    public List<User> getUserlist() {
        return userlist;
    }

    /**
     * @param userlist the userlist to set
     */
    public void setUserlist(List<User> userlist) {
        this.userlist = userlist;
    }

    /**
     * @return the pro
     */
    public Project getPro() {
        return pro;
    }

    /**
     * @param pro the pro to set
     */
    public void setPro(Project pro) {
        this.pro = pro;
    }

    /**
     * @return the pp
     */
    public Projectuser getPp() {
        return pp;
    }

    /**
     * @param pp the pp to set
     */
    public void setPp(Projectuser pp) {
        this.pp = pp;
    }
    
    public Project findById(int id){
        return pro.findByIdd(id);
    }
}
