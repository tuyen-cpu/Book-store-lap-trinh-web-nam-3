package tuyen.websach.dao;

import java.util.List;

import tuyen.websach.model.Account;

public interface AccountDAO {
	boolean insert(Account ac);

	void edit(Account ac);

	void delete(int id);

	boolean kiemTraUserName(String userName);

	boolean kiemTraMatKhau(String userName, String matKhau);
boolean doiMatKhau(String userName,String matKhau);
	Account getAccount(String userName);

	List<Account> getAll();

}
