package xxd.nju.homework.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.util.*;

import xxd.nju.homework.dao.BaseDao;
import xxd.nju.homework.dao.ParticipateDao;
import xxd.nju.homework.dao.ProjectDao;
import xxd.nju.homework.model.ProjectBean;
import xxd.nju.homework.model.UserBean;

public class ProjectDaoImpl implements ProjectDao {

	private BaseDao baseDao;

	private Session getSession() {
		Configuration configuration = new Configuration().configure();
		SessionFactory sessionFactory = configuration.buildSessionFactory();
		return sessionFactory.openSession();
	}

	@Override
	public void save(ProjectBean projectBean) {
		// TODO Auto-generated method stub
		Session session = getSession();
		Transaction transaction = session.beginTransaction();
		long num = getRegisterID();
		String prex = "P";
		if (num / 1000 < 1)
			prex += "0";
		if (num / 100 < 1)
			prex += "0";
		if (num / 10 < 1)
			prex += "0";
		String projectID = prex + num;
		projectBean.setProjectID(projectID);
		session.save(projectBean);
		transaction.commit();
	}
	
	private long getRegisterID(){
		
		ArrayList<ProjectBean> projectList = getAllProject();
		if(projectList.size() == 0) return 1;
		String ss = projectList.get(projectList.size()-1).getProjectID();
		long op = 0;
		for (int i = 1;i<ss.length();i++) {
			op *= 10;
			op += (ss.charAt(i) - '0');
		}
		return op+1;
	}

	@Override
	public void delete(ProjectBean projectBean) {
		// TODO Auto-generated method stub
		Session session = getSession();
		Transaction transaction = session.beginTransaction();
		session.delete(projectBean);
		transaction.commit();
	}

	@Override
	public void updateProject(ProjectBean projectBean) {
		// TODO Auto-generated method stub
		Session session = getSession();
		Transaction transaction = session.beginTransaction();
		session.update(projectBean);
		transaction.commit();
	}

	@Override
	public ArrayList<ProjectBean> getAllProject() {
		// TODO Auto-generated method stub
		ArrayList<ProjectBean> projectList = new ArrayList<ProjectBean>();
		Session session = getSession();
		String hql = "from ProjectBean";
		Query query = session.createQuery(hql);
		List<ProjectBean> projects = query.list();
		for (ProjectBean project : projects) {
			projectList.add(project);
		}
		return projectList;
	}

	@Override
	public long getProjectNum() {
		// TODO Auto-generated method stub
		return getAllProject().size();
	}

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	public ArrayList<ProjectBean> getHostProjectList(String userID) {
		// TODO Auto-generated method stub
		ArrayList<ProjectBean> projectList = new ArrayList<ProjectBean>();
		ArrayList<ProjectBean> list = getAllProject();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getProjectHostID().equals(userID))
				projectList.add(list.get(i));
		}
		return projectList;
	}

	@Override
	public ArrayList<ProjectBean> getParticipateProjectList(String userID) {
		// TODO Auto-generated method stub
		ParticipateDao dao = new ParticipateDaoImpl();
		ArrayList<String> idList = dao.getParticipateByUserID(userID);
		ArrayList<ProjectBean> projectList = new ArrayList<ProjectBean>();
		System.out.println(idList.size());
		for (int i = 0; i < idList.size(); i++) {
			ProjectBean projectbean = getProjectByID(idList.get(i));
			if (projectbean != null)
				projectList.add(projectbean);
		}
		return projectList;
	}

	@Override
	public ProjectBean getProjectByID(String projectID) {
		// TODO Auto-generated method stub
		Session session = getSession();
		String hql = "from ProjectBean where projectID=?";
		Query query = session.createQuery(hql);
		query.setString(0, projectID);
		List<ProjectBean> projects = query.list();
		for (ProjectBean project : projects) {
			return project;
		}
		return null;
	}

}
