package model;

public class UserDTO {

	String user_id;
	String name;
	String password;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public UserDTO(String user_id, String name, String password) {
		this.user_id = user_id;

		this.name = name;
		this.password = password;
	}
	public UserDTO(String user_id, String password) {
		this.user_id = user_id;
		this.name = null;
		this.password = password;
	}
	public UserDTO() {

	}
	
	
}
