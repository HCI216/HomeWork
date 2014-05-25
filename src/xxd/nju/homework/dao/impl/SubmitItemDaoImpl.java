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
import xxd.nju.homework.dao.ProjectDao;
import xxd.nju.homework.dao.SubmitItemDao;
import xxd.nju.homework.model.ParticipateBean;
import xxd.nju.homework.model.ProjectBean;
import xxd.nju.homework.model.SubmitItemBean;

public class SubmitItemDaoImpl implements SubmitItemDao {

	private BaseDao baseDao;

	private Session getSession() {
		Configuration configuration = new Configuration().configure();
		SessionFactory sessionFactory = configuration.buildSessionFactory();
		return sessionFactory.openSession();
	}

	@Override
	public void save(SubmitItemBean submitItemBean) {
		// TODO Auto-generated method stub
		Session session = getSession();
		Transaction transaction = session.beginTransaction();
		long num = getRegisterID();
		String prex = "S";
		if (num / 1000 < 1)
			prex += "0";
		if (num / 100 < 1)
			prex += "0";
		if (num / 10 < 1)
			prex += "0";
		String submitItemID = prex + num;
		submitItemBean.setSubmitItemID(submitItemID);
		session.save(submitItemBean);
		transaction.commit();
	}

	private long getRegisterID(){
		
		ArrayList<SubmitItemBean> submitItemList = getAllSubmitItem();
		if(submitItemList.size() == 0) return 1;
		String ss = submitItemList.get(submitItemList.size()-1).getSubmitItemID();
		long op = 0;
		for (int i = 1;i<ss.length();i++) {
			op *= 10;
			op += (ss.charAt(i) - '0');
		}
		return op+1;
	}
	
	@Override
	public long getSubmitItemNum() {
		// TODO Auto-generated method stub
		return getAllSubmitItem().size();
	}

	@Override
	public void delete(SubmitItemBean submitItemBean) {
		// TODO Auto-generated method stub
		Session session = getSession();
		Transaction transaction = session.beginTransaction();
		session.delete(submitItemBean);
		transaction.commit();
	}

	@Override
	public void updateSubmitItem(SubmitItemBean submitItemBean) {
		// TODO Auto-generated method stub
		Session session = getSession();
		Transaction transaction = session.beginTransaction();
		session.update(submitItemBean);
		transaction.commit();
	}

	@Override
	public ArrayList<SubmitItemBean> getAllSubmitItem() {
		// TODO Auto-generated method stub
		ArrayList<SubmitItemBean> submitItemList = new ArrayList<SubmitItemBean>();
		Session session = getSession();
		String hql = "from SubmitItemBean";
		Query query = session.createQuery(hql);
		List<SubmitItemBean> submitItems = query.list();
		for (SubmitItemBean submitItem : submitItems) {
			submitItemList.add(submitItem);
		}
		return submitItemList;
	}

	@Override
	public ArrayList<SubmitItemBean> getSubmitItemListByProjectID(
			String projectID) {
		// TODO Auto-generated method stub
		ArrayList<SubmitItemBean> submitItemList = new ArrayList<SubmitItemBean>();
		Session session = getSession();
		String hql = "select s from SubmitItemBean s,ParticipateBean p where s.participateID=p.participateID and p.projectID=?";
		Query query = session.createQuery(hql);
		query.setString(0, projectID);
		List<SubmitItemBean> submitItems = query.list();
		for (SubmitItemBean submitItem : submitItems) {
			submitItemList.add(submitItem);
		}
		return submitItemList;
	}

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	public ArrayList<SubmitItemBean> getSubmitItemByID(String userID) {
		// TODO Auto-generated method stub
		ParticipateDao participateDao = new ParticipateDaoImpl();
		ArrayList<SubmitItemBean> submitItemList = new ArrayList<SubmitItemBean>();
		ArrayList<SubmitItemBean> submitItems = getAllSubmitItem();
		for (int i = 0; i < submitItems.size(); i++) {
			SubmitItemBean submitItemBean = submitItems.get(i);
			ParticipateBean participateBean = participateDao
					.getParticipateByID(submitItemBean.getParticipateID());
			if (participateBean != null
					&& participateBean.getUserID().equals(userID)) {
				submitItemList.add(submitItemBean);
			}
		}
		return submitItemList;
	}

	@Override
	public ArrayList<SubmitItemBean> getSubmitItemByHostID(String hostID) {
		// TODO Auto-generated method stub
		ArrayList<SubmitItemBean> pp = new ArrayList<SubmitItemBean>();
		ProjectDao projectDao = new ProjectDaoImpl();
		ArrayList<ProjectBean> projectList = projectDao.getAllProject();
		ArrayList<String> projectIDList = new ArrayList<String>();
		for (int i = 0;i<projectList.size();i++) {
			if(hostID.equals(projectList.get(i).getProjectHostID())){
				projectIDList.add(projectList.get(i).getProjectID());
			}
		}
		for (int i = 0;i<projectIDList.size();i++) {
			ArrayList<SubmitItemBean> items = getSubmitItemListByProjectID(projectIDList.get(i));
			for (int j = 0;j<items.size();j++){
				pp.add(items.get(j));
			}
		}
		return pp;
	}

	@Override
	public SubmitItemBean getSubmitItem(String partcipateID, String submitItem) {
		// TODO Auto-generated method stub
		Session session = getSession();
		String hql = "from SubmitItemBean where participateID=? and submitItem=?";
		Query query = session.createQuery(hql);
		query.setString(0, partcipateID);
		query.setString(1, submitItem);
		List<SubmitItemBean> submitItems = query.list();
		for (SubmitItemBean submitItembean : submitItems) {
			return submitItembean;
		}
		return null;
	}	
}
