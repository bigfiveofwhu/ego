package com.ego.services.impl;

import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class PreferenceService extends JdbcServicesSupport{
	//������Ʒ����ӹ��ﳵ���ղأ����򣬵��
	//�����2�������5���ղؼ�5����ӹ��ﳵ��5��������1
	private boolean	click()throws Exception {
		return false;
	}
	public boolean insertPreference()throws Exception {
		//dto�����û�id����Ʒid
		//fnameΪ aab204
		
		StringBuilder sql=new StringBuilder()
				.append(" insert into aa09(aaa102,aaa902,aaa903,aaa904)")
				.append("select ?,aab204,0,pcode  from ab02 join syscode on fcode=aab204")
				.append("where aab203=?");
		return this.executeUpdate(sql.toString(),this.get("aaa102"),this.get("aab203"));
		
	}
}
