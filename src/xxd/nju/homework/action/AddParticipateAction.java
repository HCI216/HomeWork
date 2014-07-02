package xxd.nju.homework.action;

import java.util.ArrayList;
import java.util.Map;

import xxd.nju.homework.dao.UserDao;
import xxd.nju.homework.dao.impl.UserDaoImpl;
import xxd.nju.homework.model.ParticipateBean;
import xxd.nju.homework.model.UserBean;
import xxd.nju.homework.service.ParticipateService;

public class AddParticipateAction extends BaseAction {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1362409623013882064L;

	private ParticipateService participateService;

	
	public String execute() throws Exception{
		
		String select = request.getParameter("userID");
		String userId = (String) request.getSession().getAttribute(
				"loginNormalUser");
		String money = request.getParameter("giveMoney");
		if(money == null) return "FAIL";
		UserDao userDao = new UserDaoImpl();
		String projectID = request.getParameter("projectID");
		ArrayList<UserBean> userList = userDao.getUserNotTakePart(
				projectID, userId);
		UserBean userbean = userList.get(Integer.parseInt(select));
		ParticipateBean participate = new ParticipateBean();
		participate.setProjectID(projectID);
		participate.setUserID(userbean.getUserID());
		participate.setGiveMoney(Double.parseDouble(money));
		participateService.addParticipate(participate);
		return "SUCCESS";
	}

	public ParticipateService getParticipateService() {
		return participateService;
	}

	public void setParticipateService(ParticipateService participateService) {
		this.participateService = participateService;
	}
	
}
