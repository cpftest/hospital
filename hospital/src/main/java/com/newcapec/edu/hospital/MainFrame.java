package com.newcapec.edu.hospital;

import java.awt.BorderLayout;
import java.awt.Container;
import java.util.Arrays;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JTable;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.newcapec.edu.po.Account;
import com.newcapec.edu.service.AccountService;

public class MainFrame extends JFrame {
	private String[] columnNames= {"ID","用户名","金额"};
	
	public MainFrame() {
		this.setTitle("TableTEst");
		
		Container container=this.getContentPane();
		
		Object[][] data=getData();
		
		System.out.println(Arrays.toString(data));
		
		JTable table = new JTable(data, columnNames);
		
		
		container.setLayout(new BorderLayout());
		container.add(table.getTableHeader(), BorderLayout.PAGE_START);
		container.add(table,BorderLayout.CENTER);
		
		
		this.pack();
		this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		this.setVisible(true);
	}
	
	/**
	 * 得到表格数据
	 * @return
	 */
	private String[][] getData() {
		//spring 相关 ,start add by changpf
        ApplicationContext  app=new ClassPathXmlApplicationContext("app.xml");
        AccountService accountService=(AccountService)app.getBean("accountService");
        //spring end
        
        List<Account> lst=accountService.getAll();
        
        String[][] tmpData=new String[10][10];
        
        for (int i = 0; i < lst.size(); i++) {
			Account ac = lst.get(i);
	      	String[] row=new String[3];
        	row[0]=ac.getId()+"";
        	row[1]=ac.getUname();
        	row[2]=ac.getMoney()+"";
        	System.out.println(row);
        	tmpData[i]=row;
		}
        
        
        
        
		return tmpData;
	}

	public void init() {
		
	}
	
	
	

	public static void main(String[] args) {
		new MainFrame();
		
		
	}

}
