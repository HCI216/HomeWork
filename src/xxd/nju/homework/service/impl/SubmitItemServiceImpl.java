package xxd.nju.homework.service.impl;

import java.util.ArrayList;

import xxd.nju.homework.dao.ParticipateDao;
import xxd.nju.homework.dao.SubmitItemDao;
import xxd.nju.homework.model.ParticipateBean;
import xxd.nju.homework.model.SubmitItemBean;
import xxd.nju.homework.service.SubmitItemService;

public class SubmitItemServiceImpl implements SubmitItemService {

	private SubmitItemDao submitItemDao;
	private ParticipateDao participateDao;

	@Override
	public void addSubmitItem(SubmitItemBean submitItembean) {
		// TODO Auto-generated method stub
		submitItemDao.save(submitItembean);
	}

	@Override
	public void updateSubmitItem(SubmitItemBean submitItemBean) {
		// TODO Auto-generated method stub
		submitItemDao.updateSubmitItem(submitItemBean);
	}

	@Override
	public void deleteSubmitItem(SubmitItemBean submitItemBean) {
		// TODO Auto-generated method stub
		submitItemDao.delete(submitItemBean);
	}

	public SubmitItemDao getSubmitItemDao() {
		return submitItemDao;
	}

	public void setSubmitItemDao(SubmitItemDao submitItemDao) {
		this.submitItemDao = submitItemDao;
	}

	public ParticipateDao getParticipateDao() {
		return participateDao;
	}

	public void setParticipateDao(ParticipateDao participateDao) {
		this.participateDao = participateDao;
	}

	@Override
	public SubmitItemBean getSubmitItem(String participateID, String submitItem) {
		// TODO Auto-generated method stub
		return submitItemDao.getSubmitItem(participateID, submitItem);
	}

}
