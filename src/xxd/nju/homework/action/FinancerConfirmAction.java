package xxd.nju.homework.action;

import java.util.Map;

import xxd.nju.homework.model.SubmitItemBean;
import xxd.nju.homework.service.SubmitItemService;

public class FinancerConfirmAction extends BaseAction {
	
	private SubmitItemService submitItemService;

	public String execute() throws Exception {
		String submitItem = request.getParameter("submitItem");
		String participateID = request.getParameter("participateID");
		SubmitItemBean submitItemBean = submitItemService.getSubmitItem(
				participateID, submitItem);
		if (submitItemBean == null)
			return "FAIL";
		submitItemBean.setSubmitState("SUCCESS");
		submitItemService.updateSubmitItem(submitItemBean);
		return "SUCCESS";
	}

	public SubmitItemService getSubmitItemService() {
		return submitItemService;
	}

	public void setSubmitItemService(SubmitItemService submitItemService) {
		this.submitItemService = submitItemService;
	}
}
