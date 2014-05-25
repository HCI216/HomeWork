package xxd.nju.homework.service;

import xxd.nju.homework.model.ParticipateBean;

public interface ParticipateService {
	public ParticipateBean getParticipateByProjectIDANDUserID(String projectID,String userID);
	public void addParticipate(ParticipateBean participateBean);
	public void deleteParticipate(ParticipateBean participateBean);
}
