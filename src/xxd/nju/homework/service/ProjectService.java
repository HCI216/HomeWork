package xxd.nju.homework.service;

import java.util.ArrayList;

import xxd.nju.homework.model.ProjectBean;


public interface ProjectService {
	public void addProject(ProjectBean projectbean);
	public void updateProject(ProjectBean projectBean);
	public void deleteProject(ProjectBean projectBean);
	public ProjectBean getProjectBeanByRowNum(int index);
	public ArrayList<ProjectBean> getAllProject();
	public ProjectBean getProjectByRowANDUserID(String userID,int rowNum);
} 
