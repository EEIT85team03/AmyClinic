package group3.k.emp_login.controller;

public class HelloAction {
	private String eid = "Test";
	private String name = "Hello";
	
	public String getEid() {
		System.out.println("取得eid");
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	public String getName() {
		System.out.println("取得name");
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String execute(){
		System.out.println("execute");
		return "sussess";
	}
}
