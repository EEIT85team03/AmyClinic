package group3.henry.login.controller;

public class practiceAction {
	private String name = "Incorrect";

	public String getName() {
		System.out.println("getName() called");
		return name;
	}
	public void setName(String name) {
		System.out.println("setName() called");
		this.name = name;
	}
	
	public String execute(){
		System.out.println("execute() called");
		return "success";
	}
	
}
