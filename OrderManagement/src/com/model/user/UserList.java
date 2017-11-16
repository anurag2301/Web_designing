package com.model.user;

import java.util.ArrayList;
import java.util.Hashtable;

import com.bean.user.User;

public class UserList {
	private Hashtable<Integer, User> users = new Hashtable<Integer, User>();

	public Hashtable<Integer, User> getUsers() {
		return users;
	}

	public void setUsers(Hashtable<Integer, User> users) {
		this.users = users;
	}

	public UserList() {
		int id = 10100, j = 1;

		User u = new User(10001, "Anurag Jain","Simtronics", 0, 11, 0);
		users.put(10001, u);
		
		User u2 = new User(10002, "Shilpa Vishwakarma","Simmers", 0, 12, 0);
		users.put(10002, u2);
		
		User u3 = new User(10003, "Ankit Agarwal","Shenzhen", 0, 13, 0);
		users.put(10003, u3);
		
		User u4 = new User(10004, "Gaurabh Tomar","Gst Corp.", 0, 14, 0);
		users.put(10004, u4);
		
		User u5 = new User(20001, "Balaram","PnP Corp.", 1, 0, 21);
		users.put(20001, u5);
		
		User u6 = new User(20002, "Shivani","SV Communications", 1, 0, 22);
		users.put(20002, u6);
		
		User u7 = new User(20003, "Manish","MGM Group", 1, 0, 23);
		users.put(20003, u7);
		
		User u8 = new User(20004, "Himanshu","Huwei", 1, 0, 24);
		users.put(20004, u8);
		
		User u9 = new User(30001, "Md. Shahnawaz Akhtar","SA Group", 2, 31, 41);
		users.put(30001, u9);
		
		User u10 = new User(30002, "Prashant","Innos", 2, 32, 42);
		users.put(30002, u10);
		
		User u11 = new User(30003, "Prakhar","Commune", 2, 33, 43);
		
		users.put(30003, u11);
		
		User u12 = new User(20004, "Abhisek","Bridge Gap", 2, 34, 44);
		users.put(30004, u12);
	}

	public User searchUserList(int id, String pass) {
		User u = new User();
		if (users.containsKey(id)) {
			u = users.get(id); // returns the value corresponding to key id
			if(u.getPassword().equals(pass)) {
				return u;
			}
		}
		
		
		return null;
	}

	public ArrayList<String> manufacturerList () {
		ArrayList<String> l = new ArrayList<String>();
		 
		for(User u : users.values()) {		
			if(u.getmId()!=0) {
				l.add(u.getCompanyName());
			}
		}
		
		return l;
	}
	
	public int manufacturerId(String company) {
		int id = 0;
		for(User u : users.values()) {		
			if(u.getCompanyName().equals(company)) {
				id = u.getmId();
				break;
			}
		}
		return id;
	}
	
	public String companyName(int id, int loginAs) {
		String name = null;
		for(User u : users.values()) {		
			if(u.getsId() == id && loginAs == 0) {
				name = u.getCompanyName();
				break;
			}
			else if(u.getmId() == id && loginAs == 1) {
				name = u.getCompanyName();
				break;
			}
		}
		return name;
	}
	
}
