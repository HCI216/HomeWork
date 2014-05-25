package xxd.nju.homework.service.impl;

import java.util.ArrayList;

import xxd.nju.homework.dao.ParticipateDao;
import xxd.nju.homework.model.ParticipateBean;
import xxd.nju.homework.service.ParticipateService;

public class ParticipateServiceImpl implements ParticipateService {

	private ParticipateDao participateDao;
	
	@Override
	public ParticipateBean getParticipateByProjectIDANDUserID(String projectID,
			String userID) {
		// TODO Auto-generated method stub
		ArrayList<ParticipateBean> participateList = participateDao.getAllParticipate();
		for (int i = 0;i<participateList.size();i++){
			ParticipateBean participateBean = participateList.get(i);
			if(participateBean.getProjectID().equals(projectID) && participateBean.getUserID().equals(userID)){
				return participateBean;
			}
		}
		return null;
	}

	@Override
	public void addParticipate(ParticipateBean participateBean) {
		// TODO Auto-generated method stub
		participateDao.save(participateBean);
	}

	@Override
	public void deleteParticipate(ParticipateBean participateBean) {
		// TODO Auto-generated method stub
		participateDao.delete(participateBean);
	}

	public ParticipateDao getParticipateDao() {
		return participateDao;
	}

	public void setParticipateDao(ParticipateDao participateDao) {
		this.participateDao = participateDao;
	}
	
}
