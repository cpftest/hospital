package com.newcapec.edu.hospital;

import org.omg.CORBA.portable.ApplicationException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.newcapec.edu.service.AccountService;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
    	 
        ApplicationContext  app=new ClassPathXmlApplicationContext("app.xml");
        AccountService accountService=(AccountService)app.getBean("accountService");
        System.out.println(accountService.getAll());
    }
}
