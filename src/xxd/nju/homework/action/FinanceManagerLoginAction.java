package xxd.nju.homework.action;

import java.util.Map;

import xxd.nju.homework.model.UserBean;

public class FinanceManagerLoginAction extends LoginAction {
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		UserBean result = this.executeLogin();
		if (result == null || !result.getPosition().equals("financeManager"))
			return "FAIL";
		else {
			request.getSession().setAttribute("loginManager",
					result.getUserID());
			return "SUCCESS";
		}
	}
}
