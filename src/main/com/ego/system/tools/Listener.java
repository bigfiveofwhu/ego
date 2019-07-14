package com.ego.system.tools;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class Listener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        String webContent = servletContextEvent.getServletContext().getRealPath("/");
        System.setProperty("webContent", webContent);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
    }
}
