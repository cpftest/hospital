package com.newcapec.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newcapec.edu.dao.AccountDao;
import com.newcapec.edu.po.Account;

@Service("accountService")
public class AccountServiceImp implements AccountService {

	@Autowired
	private AccountDao aDao;
	
	
	
	public AccountDao getaDao() {
		return aDao;
	}



	public void setaDao(AccountDao aDao) {
		this.aDao = aDao;
	}



	@Override
	public List<Account> getAll() {
		return aDao.getAll();
	}

}
