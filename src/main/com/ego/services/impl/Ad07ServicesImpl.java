/**
 * @author zb
 * 举报表:ad07
 Name	      Code	
流水号	     aad701	
用户id	     aaa102	
举报原因	     aad702	
举报内容	     aad703	
举报对象类型	 aad704	
举报对象ref	 aad705
举报状态	     aad706		01--已处理 02--未处理
 */

package com.ego.services.impl;

import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class Ad07ServicesImpl extends JdbcServicesSupport
{
   /**
        *  举报表查询
    */
	@Override
    public List<Map<String, String>> query() throws Exception 
    {
	     	
    	// TODO Auto-generated method stub
    	return super.query();
    }
	
	
}
