package com.newcapec.edu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.newcapec.edu.po.Account;

public interface AccountMapper {

	@Select("select * from account")
	List<Account> getAll();
}
