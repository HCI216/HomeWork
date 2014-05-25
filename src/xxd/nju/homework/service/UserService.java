package xxd.nju.homework.service;

import xxd.nju.homework.model.UserBean;

public interface UserService {
	
	public String addUser(UserBean userbean);
	public UserBean login(UserBean userbean);
	public void updateUser(UserBean userBean);
	public void deleteUser(UserBean userBean);
	public UserBean getUserBeanByRowNum(int index);
}
