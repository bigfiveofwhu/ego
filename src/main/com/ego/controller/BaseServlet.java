package com.ego.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;
import java.util.Map.Entry;


@WebServlet("*.html")
public class BaseServlet extends HttpServlet
{
    private static final long serialVersionUID = 3420016669290706542L;
    public static final String prefix = "WEB-INF/views/";
    //加载映射文件
    private static ResourceBundle mapping;
    static
    {
        mapping = ResourceBundle.getBundle("urlMapping");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
    	//回话持续1个小时
    	request.getSession().setMaxInactiveInterval(3600);
        System.out.println("base servlet is called");
        String toPath; // 跳转的目标页面
        try
        {
            /************************************************************
             * 解析访问路径,获取目标类的名称
             ************************************************************/
            // 拦截请求的访问路径
            String url = request.getServletPath();
            int endpos = url.indexOf(".html", url.lastIndexOf("/"));
            String mappingURL = url.substring(1, endpos);
            /***********************************************************
             * 实例化目标类---业务控制器
             ***********************************************************/
            // 实例化业务控制器
            String basePackage = "com.ego.controller.impl.";
            String className = basePackage + mapping.getString(mappingURL);
            Controller controller = (Controller) Class.forName(className).newInstance();
            /***********************************************************
             * 向业务控制器,填充页面数据 i
             ***********************************************************/
            // 为业务控制器织入DTO切片
            controller.setMapDto(this.createDto(request));

            /***********************************************************
             * 调用业务控制器的流程控制方法
             ***********************************************************/
            // 调用流程控制方法
            toPath = controller.execute();

            /***********************************************************
             * 处理控制器向页面输出的数据 o
             ***********************************************************/
            // 解析属性
            Map<String, Object> rueqestAttribute = controller.getAttribute();
            // 织入属性处理切片
            this.parseRueqestAttribute(request, rueqestAttribute);
        }
        catch (Exception ex)
        {
            request.setAttribute("msg", ex.getMessage());
            ex.printStackTrace();
            toPath = "errorPage/error";
        }

        request.getRequestDispatcher("/" + toPath + ".jsp").forward(request, response);
    }

    /**
     * attribute切片
     *
     * @param request
     * @param rueqestAttribute
     */
    private void parseRueqestAttribute(HttpServletRequest request, Map<String, Object> rueqestAttribute)
    {
        // 1.还原所有的键值对,形成集合
        Set<Map.Entry<String, Object>> entrySet = rueqestAttribute.entrySet();
        // 2.循环集合
        for (Map.Entry<String, Object> entry : entrySet)
        {
            // 3.将map的每个键值对,转换成request的属性
            request.setAttribute(entry.getKey(), entry.getValue());
        }
        // 清除所有的request级属性数据
        rueqestAttribute.clear();
    }

    /**
     * DTO切片
     *
     * @param request
     * @return
     */
    private Map<String, Object> createDto(HttpServletRequest request)
    {
        // 1.获取页面数据
        Map<String, String[]> tem = request.getParameterMap();


        System.out.println("tem: "+ tem);

        int initSize = ((int) (tem.size() / 0.75)) + 1;
        // 2.导出所有键值对,形成键值对集合
        Set<Entry<String, String[]>> entrySet = tem.entrySet();
        // 3.定义数组,表示Enetry的value部分
        String[] value = null;

        // 4.定义DTO容器
        Map<String, Object> dto = new HashMap<>(initSize);

        HttpSession session = request.getSession();
        Enumeration<String> attributes = session.getAttributeNames();
        while (attributes.hasMoreElements())
        {
            String name = attributes.nextElement();
            dto.put(name, session.getAttribute(name));
        }

        // 5.循环读取entrySet,获取每个键值对
        for (Entry<String, String[]> entry : entrySet) 
        {
            // 获取value部分的数组
            value = entry.getValue();
            // 依据长度判断页面控件的类别
            if (value.length == 1) // 非checkbox类控件
            {
                // 过滤掉页面未填充项目
                if (value[0] != null && !value[0].equals(""))
                {
                    dto.put(entry.getKey(), value[0]);
                }
            }
            else // checkbox类控件
            {
                dto.put(entry.getKey(), value);
            }
        }

        //放入request对象
        dto.put("request", request);

        System.out.println(dto);
        //System.out.println(dto.get("aaa102"));

        return dto;
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        this.doGet(request, response);
    }
}
