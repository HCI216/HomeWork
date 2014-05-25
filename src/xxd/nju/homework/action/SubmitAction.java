package xxd.nju.homework.action;

import xxd.nju.homework.dao.ProjectDao;
import xxd.nju.homework.dao.SubmitItemDao;
import xxd.nju.homework.model.ParticipateBean;
import xxd.nju.homework.model.ProjectBean;
import xxd.nju.homework.model.SubmitItemBean;
import xxd.nju.homework.service.ParticipateService;
import xxd.nju.homework.service.ProjectService;
import xxd.nju.homework.service.SubmitItemService;


public class SubmitAction extends BaseAction {
	
	private SubmitItemService submitItemService;
	private ParticipateService participateService;
	
	public String execute() throws Exception{
		
		String userID = (String) request.getSession().getAttribute("loginNormalUser");
		String projectID = (String)request.getParameter("submitproject");
		String food = request.getParameter("food");
		String transportation = request.getParameter("transportation");
		String device = request.getParameter("device");
		System.out.println(projectID + " " + userID);
		ParticipateBean participateBean = participateService.getParticipateByProjectIDANDUserID(projectID, userID);
//		ParticipateBean participateBean = participateService.getParticipateByProjectIDANDUserID("P0001", "U0002");
		if(food.equals("") && transportation.equals("") && device.equals("")) return "FAIL";
		
		if(!food.equals("")){
			SubmitItemBean submitItem = new SubmitItemBean();	
			submitItem.setParticipateID(participateBean.getParticipateID());
			submitItem.setSubmitItem("FOOD");
			submitItem.setUseMoney(Double.parseDouble(food));
			submitItem.setSubmitState("HOST");
			submitItemService.addSubmitItem(submitItem);
		}
		if(!transportation.equals("")){
			SubmitItemBean submitItem = new SubmitItemBean();	
			submitItem.setParticipateID(participateBean.getParticipateID());
			submitItem.setSubmitItem("TRANSPORTATION");
			submitItem.setUseMoney(Double.parseDouble(transportation));
			submitItem.setSubmitState("HOST");
			submitItemService.addSubmitItem(submitItem);
		}
		if(!device.equals("")){
			SubmitItemBean submitItem = new SubmitItemBean();	
			submitItem.setParticipateID(participateBean.getParticipateID());
			submitItem.setSubmitItem("DEVICE");
			System.out.println(device);
			submitItem.setUseMoney(Double.parseDouble(device));
			
			submitItem.setSubmitState("HOST");
			submitItemService.addSubmitItem(submitItem);
		}
		return "SUCCESS";
	}

	public SubmitItemService getSubmitItemService() {
		return submitItemService;
	}

	public void setSubmitItemService(SubmitItemService submitItemService) {
		this.submitItemService = submitItemService;
	}

	public ParticipateService getParticipateService() {
		return participateService;
	}

	public void setParticipateService(ParticipateService participateService) {
		this.participateService = participateService;
	}
	
}
