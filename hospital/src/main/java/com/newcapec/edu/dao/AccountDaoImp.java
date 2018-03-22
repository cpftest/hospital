package com.newcapec.edu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newcapec.edu.mapper.AccountMapper;
import com.newcapec.edu.po.Account;

@Repository
public class AccountDaoImp implements AccountDao {

	@Autowired
	private AccountMapper  mapper;
	
	@Override
	public List<Account> getAll() {
		return mapper.getAll();
	}

}
