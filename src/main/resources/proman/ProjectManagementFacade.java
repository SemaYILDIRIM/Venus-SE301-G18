package proman;
import UserManagement.User;
import java.util.List;


/**
 *
 * @author Sema Yıldırım
 */
public class ProjectManagementFacade {
    Project pro = new Project();
    Projectuser pp=new Projectuser();
    
    /**
     * This method gets Project Detail information  from database
     * context Project inv:
     * @inv self.pro.id=id
     * @pre self.pro.getProjectDetails(Integer.parseInt(id));
     * @return Project
     */
    public Project getProjectDetail(String id){
        return pro.getProjectDetails(Integer.parseInt(id));
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
        
      return pp.getProUser(id); 
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
      return pp.getProProject(id); 
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
      pp.saveProUser(prouser);
    }
}
