package xxd.nju.homework.dao;

import java.util.ArrayList;

import xxd.nju.homework.model.UserBean;

public interface UserDao {
	public void delete(UserBean userBean);
	public void save(UserBean userBean);
	public void updateUser(UserBean user);
	public UserBean find(String username,String password);
	public ArrayList<UserBean> getAllUser();
	public String getNameByID(String userID);
	public ArrayList<UserBean> getUserNotTakePart(String projectID,String userID);
	public Double getSubmitMoney(String userID);
	public Double getUseMoney(String userID);
}
