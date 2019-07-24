/**
 * @author hug
 * aab102 --����id
 * aab202 --��Ʒ����
 * aab203 --��Ʒid
 * aab204 --��Ʒ����
 * aab205 --��Ʒ�۸�
 * aab206 --���
 * aab207 --��Ʒ����
 * aab208 --չʾҳ��
 * aab209 --��Ʒ���
 * aab210 --�ϼ�ʱ��
 * aab211 --�ۺ�����
 * aab212 --��Ʒ״̬
 */

package com.ego.services.impl;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import com.ego.services.JdbcServicesSupport;

public class Ab02ServiceImpl extends JdbcServicesSupport
{

	/**
	 * @author hug
	 */
	@Override
	public Map<String, String> findById(String qtype) throws Exception
	{
		Method method=this.getMethod(qtype);
		return (Map<String, String>)method.invoke(this);
	}
	/**
	 * @author hug
	 */
	@Override
	public List<Map<String, String>> query(String qtype) throws Exception
	{
		Method method=this.getMethod(qtype);
		return (List<Map<String, String>>)method.invoke(this);
	}
	/**
	 * @author hug
	 * ͨ��aab102 --����id ������ѯ��Ʒ
	 * @return
	 */
	private List<Map<String,String>> findProductsByAab102() throws Exception
	{
		String sql="select aab202,aab203,aab205,aab208 from ab02 where aab212='02' and aab102=?";
		return this.queryForList(sql, this.get("aab102"));
	}
	/**
	 * ͨ���ؼ���������Ʒ, ģ��ƥ����Ʒ����
	 * hug
	 * @return
	 */
	private List<Map<String,String>> queryByKey() throws Exception
	{
		String sql="select aab202,aab203,aab205,aab206,aab208 from ab02 where aab212='02' and aab202 like ?";
		System.out.println("ͨ���ؼ���ģ����ѯ");
		return this.queryForList(sql, this.get("key"));
	}
	
	/**
	 * ͨ�������������,�������ǵ�һ�����,�ڶ������,���������,������ϲ���ѯ
	 * hug
	 * @return
	 */
	private List<Map<String,String>> queryBySort() throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select x.aab202,x.aab204,x.aab203,x.aab205,x.aab206,x.aab208,s.fcode,y.fcode,z.fcode ")
				.append("  from ab02 x, syscode s, syscode y,syscode z")
				.append(" where x.aab212='02'      and s.fname='aab204' and y.fname='aab204'")
				.append("   and ((x.aab204=?       and s.fcode =?       and y.fcode=s.pfcode and z.fcode=y.pfcode)")
				.append("    or  (x.aab204=s.fcode and s.pfcode=?       and y.fcode=?        and z.fcode=y.pfcode)")
				.append("    or  (x.aab204=s.fcode and s.pfcode=y.fcode and y.pfcode=?       and z.fcode=?))")
				;
		Object args[]= {
			this.get("type"),
			this.get("type"),
			this.get("type"),
			this.get("type"),
			this.get("type"),
			this.get("type")
		};
		System.out.println("ͨ������ģ����ѯ");
		return this.queryForList(sql.toString(), args);
	}
	
	/**
	 * @author hug
	 * ������Ʒ�����ϼܵİ˸�
	 * @return
	 */
	private List<Map<String,String>> findByUpToDate() throws Exception
	{
		String sql="select aab202,aab203,aab205,aab206,aab208 from ab02 where aab212='02' order by aab210 desc limit 8";
		return this.queryForList(sql);
	}
	/**
	 * ������Ʒid��ѯ��Ʒ����ϸ��Ϣ
	 * @author hug
	 * @return
	 * @throws Exception
	 */
	private Map<String, String> findByAab203() throws Exception
	{
		String sql="select y.aaa102,y.aab103,x.aab102,x.aab202,x.aab203,x.aab204,x.aab205,x.aab206,x.aab207,x.aab208,x.aab209 from ab02 x,ab01 y where y.aab102=x.aab102 and aab203=? order by aab210 desc";
		return this.queryForMap(sql,this.get("aab203"));
	}
	/**
	 * ���ݶ����Ʒid��ѯ �����Ʒ�Ĵ�����Ϣ
	 * @return
	 * @throws Exception
	 */
	private Map<String, String> findNameAndPriceByAab203() throws Exception
	{
		String sql="select aab202,aab203,aab205,aab208 from ab02 where aab203=?";
		return this.queryForMap(sql, this.get("aab203"));
	}
}
