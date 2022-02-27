package com.radio.listener;

import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Application Lifecycle Listener implementation class RadioAppListener
 *
 */
public class RadioAppListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public RadioAppListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
        ServletContext app = sce.getServletContext();
        
        String contextRoot = app.getContextPath();  
        
        app.setAttribute("root", contextRoot);
        
        //재민 버킷경로
        app.setAttribute("BoardStaticPath", "https://objectstorage.ap-seoul-1.oraclecloud.com/n/cnwcb0ooelq8/b/bucket-20210218-2349/o/");
        // 진수 버킷 경로
        app.setAttribute("ReplayStaticPath", "https://objectstorage.ap-seoul-1.oraclecloud.com/n/cnca7kbvyqaq/b/bucket-20210216-1417/o/");
        // 유정 버킷 경로
        app.setAttribute("picRoomStaticPath", "https://objectstorage.ap-seoul-1.oraclecloud.com/n/cndwlmgtk97g/b/bucket-20210217-1820/o/");
      
        String ociConfigMOONPath = "https://objectstorage.ap-seoul-1.oraclecloud.com/n/cnca7kbvyqaq/b/bucket-20210216-1417/o/"; 
        app.setAttribute("staticPath1", ociConfigMOONPath);          
        String ociConfigMINPath = "https://objectstorage.ap-seoul-1.oraclecloud.com/n/cnwcb0ooelq8/b/bucket-20210218-2349/o/"; 
        app.setAttribute("staticPath2", ociConfigMINPath);  
        String ociConfigYJPath = "https://objectstorage.ap-seoul-1.oraclecloud.com/n/cnca7kbvyqaq/b/bucket-20210216-1417/o/"; 
        app.setAttribute("staticPath3", ociConfigYJPath);  
    }
	
}
