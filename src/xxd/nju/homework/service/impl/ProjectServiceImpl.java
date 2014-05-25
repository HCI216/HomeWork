package xxd.nju.homework.service.impl;

import java.util.ArrayList;

import xxd.nju.homework.dao.ProjectDao;
import xxd.nju.homework.model.ProjectBean;
import xxd.nju.homework.service.ProjectService;

public class ProjectServiceImpl implements ProjectService {

	private ProjectDao projectDao;

	@Override
	public void addProject(ProjectBean projectbean) {
		// TODO Auto-generated method stub
		projectDao.save(projectbean);
	}

	@Override
	public void updateProject(ProjectBean projectBean) {
		// TODO Auto-generated method stub
		projectDao.updateProject(projectBean);
	}

	@Override
	public void deleteProject(ProjectBean projectBean) {
		// TODO Auto-generated method stub
		projectDao.delete(projectBean);
	}

	@Override
	public ProjectBean getProjectBeanByRowNum(int index) {
		// TODO Auto-generated method stub
		return projectDao.getAllProject().get(index);
	}

	public ProjectDao getProjectDao() {
		return projectDao;
	}

	public void setProjectDao(ProjectDao projectDao) {
		this.projectDao = projectDao;
	}

	@Override
	public ArrayList<ProjectBean> getAllProject() {
		// TODO Auto-generated method stub
		return projectDao.getAllProject();
	}

	@Override
	public ProjectBean getProjectByRowANDUserID(String userID, int rowNum) {
		// TODO Auto-generated method stub
		return projectDao.getParticipateProjectList(userID).get(rowNum);
	}

}
