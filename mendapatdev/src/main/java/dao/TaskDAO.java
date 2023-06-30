package dao;

import java.sql.*;
import java.util.*;

import model.TaskModel;

public class TaskDAO {
	private String jdbcURL = "jdbc:mysql://localhost/taskly";
	private String jdbcUsername = "root";
	private String jdbcPassword = "";

	private static final String INSERT_TASK_SQL = "INSERT INTO task"
			+ " (name, duedate, description, statusid, categoryid, userid) VALUES " + " (?, ?, ?, ?, ?, ?)";
	private static final String SELECT_TASK_BY_TASKID = "SELECT * FROM task WHERE taskid = ?";
	private static final String SELECT_TASK_BY_USERID = "SELECT * FROM task WHERE userid = ?";
	private static final String DELETE_TASK_SQL = "DELETE FROM task WHERE taskid = ?";
	private static final String UPDATE_TASK_SQL = "UPDATE task SET name = ?, duedate = ?, description= ?, statusid= ?, categoryid= ?, userid = ? WHERE taskid = ?";

	public TaskDAO() {}
	
	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}

	public void insertTask(TaskModel task) throws SQLException {
		System.out.println(INSERT_TASK_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TASK_SQL)) {
			preparedStatement.setString(1, task.getName());
			preparedStatement.setString(2, task.getDuedate());
			preparedStatement.setString(3, task.getDescription());
			preparedStatement.setInt(4, task.getStatusid());
			preparedStatement.setInt(5, task.getCategoryid());
			preparedStatement.setInt(6, task.getUserid());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public TaskModel selectTask(int taskid) {
		TaskModel task = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TASK_BY_TASKID);) {
			preparedStatement.setInt(1, taskid);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String name = rs.getString("name");
				String duedate = rs.getString("duedate");
				String description = rs.getString("description");
				int statusid = rs.getInt("statusid");
				int categoryid = rs.getInt("categoryid");
				int userid = rs.getInt("userid");
				task = new TaskModel(taskid, name, duedate, description, statusid, categoryid, userid);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return task;
	}
	
	public List <TaskModel> selectAllTask(int userid) {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<TaskModel> tasks = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TASK_BY_USERID);) {
			preparedStatement.setInt(1, userid);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int taskid = rs.getInt("taskid");
				String name = rs.getString("name");
				String duedate = rs.getString("duedate");
				String description = rs.getString("description");
				int statusid = rs.getInt("statusid");
				int categoryid = rs.getInt("categoryid");
				tasks.add(new TaskModel(taskid, name, duedate, description, statusid, categoryid, userid));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return tasks;
	}

	public boolean deleteTask(int taskid) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_TASK_SQL);) {
			statement.setInt(1, taskid);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateTask(TaskModel task) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_TASK_SQL);) {
			statement.setString(1, task.getName());
			statement.setString(2, task.getDuedate());
			statement.setString(3, task.getDescription());
			statement.setInt(4, task.getStatusid());
			statement.setInt(5, task.getCategoryid());
			statement.setInt(6, task.getUserid());
			statement.setInt(7, task.getTaskid());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}