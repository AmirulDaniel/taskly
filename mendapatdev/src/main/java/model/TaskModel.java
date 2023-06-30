package model;

public class TaskModel {
	protected int taskid;
	protected String name;
	protected String duedate;
	protected String description;
	protected int statusid;
	protected int categoryid;
	protected int userid;

	public TaskModel() {}
	
	public TaskModel(int taskid, String name, String duedate, String description, int statusid, int categoryid, int userid) {
		this.taskid = taskid;
		this.name = name;
		this.duedate = duedate;
		this.description = description;
		this.statusid = statusid;
		this.categoryid = categoryid;
		this.userid = userid;
	}
	
	public TaskModel(String name, String duedate, String description, int statusid, int categoryid, int userid) {
		super();
		this.name = name;
		this.duedate = duedate;
		this.description = description;
		this.statusid = statusid;
		this.categoryid = categoryid;
		this.userid = userid;
	}

	public int getTaskid() {
		return taskid;
	}

	public void setTaskid(int taskid) {
		this.taskid = taskid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDuedate() {
		return duedate;
	}

	public void setDuedate(String duedate) {
		this.duedate = duedate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getStatusid() {
		return statusid;
	}

	public void setStatusid(int statusid) {
		this.statusid = statusid;
	}

	public int getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}
}