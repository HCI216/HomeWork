package xxd.nju.homework.action;

import java.util.Map;

import xxd.nju.homework.model.UserBean;

public class FinancerLoginAction extends LoginAction {
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		UserBean result = this.executeLogin();
		if(result == null) System.out.println("hello");
		if (result == null || !result.getPosition().equals("financer"))
			return "FAIL";
		else {
			request.getSession().setAttribute("loginFinancer",
					result.getUserID());
			System.out.println("hi");
			return "SUCCESS";
		}
	}
}
