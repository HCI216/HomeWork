package xxd.nju.homework.dao;

import java.util.ArrayList;

import xxd.nju.homework.model.ProjectBean;
import xxd.nju.homework.model.UserBean;

public interface ProjectDao {
	
	public void save(ProjectBean projectBean);
	public void delete(ProjectBean projectBean);
	public void updateProject(ProjectBean project);
	public ArrayList<ProjectBean> getAllProject();
	public long getProjectNum();
	public ArrayList<ProjectBean> getHostProjectList(String userID);
	public ArrayList<ProjectBean> getParticipateProjectList(String userID);
	public ProjectBean getProjectByID(String userID);
}
