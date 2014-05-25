package xxd.nju.homework.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.util.*;

import xxd.nju.homework.dao.BaseDao;
import xxd.nju.homework.dao.ParticipateDao;
import xxd.nju.homework.dao.UserDao;
import xxd.nju.homework.model.ParticipateBean;
import xxd.nju.homework.model.SubmitItemBean;
import xxd.nju.homework.model.UserBean;

public class UserDaoImpl implements UserDao {

	private BaseDao baseDao;

	@Override
	public void delete(UserBean userBean) {
		// TODO Auto-generated method stub
		Session session = getSession();
		Transaction transaction = session.beginTransaction();
		session.delete(userBean);
		transaction.commit();
	}

	@Override
	public void save(UserBean userBean) {
		// TODO Auto-generated method stub
		Session session = getSession();
		Transaction transaction = session.beginTransaction();
		long num = getRegisterID();
		String prex = "U";
		if (num / 1000 < 1)
			prex += "0";
		if (num / 100 < 1)
			prex += "0";
		if (num / 10 < 1)
			prex += "0";
		String userID = prex + num;
		userBean.setUserID(userID);
		session.save(userBean);
		transaction.commit();
	}

	private Session getSession() {
		Configuration configuration = new Configuration().configure();
		SessionFactory sessionFactory = configuration.buildSessionFactory();
		return sessionFactory.openSession();
	}

	@Override
	public UserBean find(String username, String password) {
		// TODO Auto-generated method stub

		/*
		 * Criteria criteria = session.createCriteria(UserBean.class);
		 * criteria.add(Expression.eq("username",username));
		 * criteria.add(Expression.eq("password", password)); List users =
		 * criteria.list(); Iterator iterator = users.iterator();
		 * while(iterator.hasNext()) { return (UserBean)iterator.next(); }
		 */
		String hql = "from UserBean where username=? and password=?";
		Query query = getSession().createQuery(hql);
		query.setString(0, username);
		query.setString(1, password);
		List<UserBean> users = query.list();
		for (UserBean user : users) {
			return user;
		}
		return null;
	}

	public long getUserNum() {
		int i = 0;
		String sql = "from UserBean";
		Query query = getSession().createQuery(sql);
		List<UserBean> users = query.list();
		for (UserBean user : users)
			i++;
		return i;
	}

	@Override
	public void updateUser(UserBean user) {
		// TODO Auto-generated method stub
		Session session = getSession();
		Transaction transaction = session.beginTransaction();
		session.update(user);
		transaction.commit();
	}

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public ArrayList<UserBean> getAllUser() {
		// TODO Auto-generated method stub
		ArrayList<UserBean> userList = new ArrayList<UserBean>();
		Session session = getSession();
		String hql = "from UserBean";
		Query query = session.createQuery(hql);
		List<UserBean> users = query.list();
		for (UserBean user : users) {
			userList.add(user);
		}
		return userList;
	}

	private long getRegisterID() {
		ArrayList<UserBean> userList = getAllUser();
		if (userList.size() == 0)
			return 1;
		String ss = userList.get(userList.size() - 1).getUserID();
		long op = 0;
		for (int i = 1; i < ss.length(); i++) {
			op *= 10;
			op += (ss.charAt(i) - '0');
		}
		return op + 1;
	}

	@Override
	public String getNameByID(String userID) {
		// TODO Auto-generated method stub
		Session session = getSession();
		String hql = "from UserBean where userID=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, userID);
		List<UserBean> list = query.list();
		for (UserBean s : list) {
			return s.getUsername();
		}
		return null;
	}

	@Override
	public ArrayList<UserBean> getUserNotTakePart(String projectID,
			String hostID) {
		// TODO Auto-generated method stub
		ArrayList<UserBean> users = getAllUser();
		ArrayList<UserBean> userList = new ArrayList<UserBean>();
		ParticipateDao participateDao = new ParticipateDaoImpl();
		for (int i = 0; i < users.size(); i++) {
			if (!users.get(i).getUserID().equals(hostID) && users.get(i).getPosition().equals("normaluser")) {
				if (!participateDao.isTaken(projectID, users.get(i).getUserID())) {
					userList.add(users.get(i));
				}
			}
		}
		return userList;
	}

	@Override
	public Double getSubmitMoney(String userID) {
		// TODO Auto-generated method stub
		Session session = getSession();
		String hql = "select s from ParticipateBean p,SubmitItemBean s where p.participateID=s.participateID and s.submitState=? and p.userID=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, "SUCCESS");
		query.setParameter(1, userID);
		List<SubmitItemBean> list = query.list();
		double result = 0.0;
		for (SubmitItemBean itemBean : list){
			result += itemBean.getUseMoney();
		}
		return result;
	}

	@Override
	public Double getUseMoney(String userID) {
		// TODO Auto-generated method stub
		Session session = getSession();
		String hql = "select s from ParticipateBean p,SubmitItemBean s where p.participateID=s.participateID and p.userID=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, userID);
		List<SubmitItemBean> list = query.list();
		double result = 0.0;
		for (SubmitItemBean itemBean : list){
			result += itemBean.getUseMoney();
		}
		System.out.println(userID + ":" +result);
		return result;
	}
}
