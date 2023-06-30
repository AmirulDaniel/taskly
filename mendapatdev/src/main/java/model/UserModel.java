package model;

public class UserModel {
	protected int userid;
	protected String username;
	protected String password;

	public UserModel() {}
	
	public UserModel(int userid, String username, String password) {
		this.userid = userid;
		this.username = username;
		this.password = password;
	}
	
	public UserModel(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}