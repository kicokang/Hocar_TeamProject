package DTO;

public class userVo {
	private String name;
	private String id;
	private String pw;
	private String phone_num;
	private String address;
	private String email;
	private String email2;
	
	public userVo() {
		
	}
	public userVo(String name,String id,String pw,String phone_num,
			String address,String email,String email2) {
		this.name=name;
		this.id=id;
		this.pw=pw;
		this.phone_num=phone_num;
		this.address=address;
		this.email=email;
		this.email2=email2;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}

}
