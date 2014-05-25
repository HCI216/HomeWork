package xxd.nju.homework.service;


import xxd.nju.homework.model.SubmitItemBean;

public interface SubmitItemService {
	public void addSubmitItem(SubmitItemBean submitItembean);
	public void updateSubmitItem(SubmitItemBean submitItemBean);
	public void deleteSubmitItem(SubmitItemBean submitItemBean);
	public SubmitItemBean getSubmitItem(String participateID,String submitItem);
}
