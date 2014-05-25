package xxd.nju.homework.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import xxd.nju.homework.dao.BaseDao;
import xxd.nju.homework.dao.ParticipateDao;
import xxd.nju.homework.model.ParticipateBean;
import xxd.nju.homework.model.ProjectBean;

public class ParticipateDaoImpl implements ParticipateDao {

	private BaseDao baseDao;

	private Session getSession() {
		Configuration configuration = new Configuration().configure();
		SessionFactory sessionFactory = configuration.buildSessionFactory();
		return sessionFactory.openSession();
	}
	@Override
	public void save(ParticipateBean participateBean) {
		// TODO Auto-generated method stub
		Session session = getSession();
		Transaction transaction = session.beginTransaction();
		long num = getRegisterID();
		String prex = "PA";
		if (num / 1000 < 1)
			prex += "0";
		if (num / 100 < 1)
			prex += "0";
		if (num / 10 < 1)
			prex += "0";
		String participateID = prex + num;
		participateBean.setParticipateID(participateID);
		session.save(participateBean);
		transaction.commit();
	}

	private long getRegisterID(){
		
		ArrayList<ParticipateBean> participateList = getAllParticipate();
		if(participateList.size() == 0) return 1;
		String ss = participateList.get(participateList.size()-1).getParticipateID();
		long op = 0;
		for (int i = 2;i<ss.length();i++) {
			op *= 10;
			op += (ss.charAt(i) - '0');
		}
		return op+1;
	}
	
	@Override
	public void delete(ParticipateBean participateBean) {
		// TODO Auto-generated method stub
		Session session = getSession();
		Transaction transaction = session.beginTransaction();
		session.delete(participateBean);
		transaction.commit();
	}

	@Override
	public void update(ParticipateBean projectBean) {
		// TODO Auto-generated method stub
		Session session = getSession();
		Transaction transaction = session.beginTransaction();
		session.update(projectBean);
		transaction.commit();
	}

	@Override
	public ArrayList<ParticipateBean> getAllParticipate() {
		// TODO Auto-generated method stub
		ArrayList<ParticipateBean> projectList = new ArrayList<ParticipateBean>();
		Session session = getSession();
		String hql = "from ParticipateBean";
		Query query = session.createQuery(hql);
		List<ParticipateBean> projects = query.list(); 
		for (ParticipateBean project : projects){
			projectList.add(project);
		}
		return projectList;
	}

	@Override
	public long getParticipateNum() {
		// TODO Auto-generated method stub
		return getAllParticipate().size();
	}

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	@Override
	public ArrayList<String> getParticipateByUserID(String userID) {
		// TODO Auto-generated method stub
		ArrayList<String> projectIDList = new ArrayList<String>();
		ArrayList<ParticipateBean> beans = getAllParticipate();
		for (int i = 0;i<beans.size();i++) {
			ParticipateBean bean = beans.get(i);
			if(bean.getUserID().equals(userID)) projectIDList.add(bean.getProjectID());
		}
		return projectIDList;
	}
	@Override
	public ParticipateBean getParticipateByID(String participateID) {
		// TODO Auto-generated method stub
		Session session = getSession();
		String hql = "from ParticipateBean where participateID=?";
		Query query = session.createQuery(hql);
		query.setString(0, participateID);
		List<ParticipateBean> projects = query.list(); 
		for (ParticipateBean project : projects){
			return project;
		}
		return null;
	}
	@Override
	public boolean isTaken(String projectID, String userID) {
		// TODO Auto-generated method stub
		Session session = getSession();
		String hql = "from ParticipateBean where projectID=? and userID=?";
		Query query = session.createQuery(hql);
		query.setString(0, projectID);
		query.setString(1, userID);
		List<ParticipateBean> projects = query.list(); 
		for (ParticipateBean project : projects){
			if(project != null) return true;
			else break;
		}
		return false;
	}

}
