package xxd.nju.homework.service.impl;

import org.springframework.dao.support.DaoSupport;

import xxd.nju.homework.dao.UserDao;
import xxd.nju.homework.model.UserBean;
import xxd.nju.homework.service.UserService;

public class UserServiceImpl implements UserService {

	private UserDao userDao;
	
	@Override
	public String addUser(UserBean userBean) {
		// TODO Auto-generated method stub
		userDao.save(userBean);
		return null;
	}

	@Override
	public UserBean login(UserBean userbean) {
		// TODO Auto-generated method stub
		return userDao.find(userbean.getUsername(), userbean.getPassword());
	}

	@Override
	public void updateUser(UserBean userBean) {
		// TODO Auto-generated method stub
		userDao.updateUser(userBean);
	}

	@Override
	public void deleteUser(UserBean userBean) {
		// TODO Auto-generated method stub
		userDao.delete(userBean);
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public UserBean getUserBeanByRowNum(int index) {
		// TODO Auto-generated method stub
		return userDao.getAllUser().get(index);
	}
	
}
