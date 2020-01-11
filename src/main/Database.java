
package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Database {
	private final String userName = "root";
	private final String password = "admin";
	private final String url = "jdbc:mysql://localhost:3306/cs485_lab";

	private static Database instance;

	private Connection connection;

	private Database() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(url, userName, password);
			System.out.println("database connected");
		} catch (Exception ex) {
			ex.printStackTrace(System.out);
		}
	}
	
	public Account getAccount(String username) {
		try {
			PreparedStatement statement = connection.prepareStatement("SELECT * FROM account WHERE username = ?");
			statement.setString(1, username);
			
			ResultSet rs = statement.executeQuery();
			
			if(rs.next()) {
				Account account = new Account();
				account.setUsername(username);
				account.setPassword(rs.getString("password"));
				account.setFirstName(rs.getString("first_name"));
				account.setLastName(rs.getString("last_name"));
				
				return account;
			}
		} catch(Exception ex) {
			ex.printStackTrace(System.out);
		}
		
		return null;
	}
	
	public Kitchen getZipCode(String zipCode) {
		try {
			PreparedStatement statement = connection.prepareStatement("SELECT * FROM kitchen WHERE zip_code = ?");
			statement.setString(1, zipCode);
			
			ResultSet rs = statement.executeQuery();
			
			if(rs.next()) {
				Kitchen kitchen = new Kitchen();
				kitchen.setZip_code(rs.getString("zipCode"));
				kitchen.setAddress(rs.getString("address"));
				kitchen.setId(rs.getString("id"));
				kitchen.setSupplier_id(rs.getString("supplier_id"));
				kitchen.setInspector_id(rs.getString("inspector_id"));
				
				return kitchen;
			}
		} catch(Exception ex) {
			ex.printStackTrace(System.out);
		}
		
		return null;
	}
	
	public void addAccount(Account account) {
		try {
			PreparedStatement statement = connection.prepareStatement("INSERT INTO account VALUES(?, ?, ?, ?)");
			statement.setString(1, account.getUsername());
			statement.setString(2, account.getPassword());
			statement.setString(3, account.getFirstName());
			statement.setString(4, account.getLastName());
			statement.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace(System.out);
		}
	}

	public static Database getInstance() {
		if (instance == null)
			instance = new Database();

		return instance;
	}
}
