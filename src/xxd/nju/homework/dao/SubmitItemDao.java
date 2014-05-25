package xxd.nju.homework.dao;

import java.util.ArrayList;

import xxd.nju.homework.model.SubmitItemBean;

public interface SubmitItemDao {
	public void save(SubmitItemBean SubmitItemBean);
	public void delete(SubmitItemBean SubmitItemBean);
	public void updateSubmitItem(SubmitItemBean SubmitItem);
	public ArrayList<SubmitItemBean> getAllSubmitItem();
	public ArrayList<SubmitItemBean> getSubmitItemByID(String UserID);
	public ArrayList<SubmitItemBean> getSubmitItemByHostID(String hostID);
	public ArrayList<SubmitItemBean> getSubmitItemListByProjectID(String projectID);
	public SubmitItemBean getSubmitItem(String partcipateID,String submitItem);
	public long getSubmitItemNum();
}
