package xxd.nju.homework.dao;

import java.util.ArrayList;

import xxd.nju.homework.model.ParticipateBean;
import xxd.nju.homework.model.ProjectBean;

public interface ParticipateDao {
	public void save(ParticipateBean participateBean);
	public void delete(ParticipateBean participateBean);
	public void update(ParticipateBean participateBean);
	public ArrayList<ParticipateBean> getAllParticipate();
	public ParticipateBean getParticipateByID(String participateID);
	public ArrayList<String> getParticipateByUserID(String userID);
	public long getParticipateNum();
	public boolean isTaken(String projectID,String userID);
}
