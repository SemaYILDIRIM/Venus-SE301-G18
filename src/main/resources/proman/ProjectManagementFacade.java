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
    public Project getProjectDetail(String id){
        return pro.getProjectDetails(Integer.parseInt(id));
    }
    public List<Projectuser> getProjectUser(int id){
        
      return pp.getProUser(id); 
    }
    public List<Projectuser> getProjectProject(int id){
      return pp.getProProject(id); 
    }
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
