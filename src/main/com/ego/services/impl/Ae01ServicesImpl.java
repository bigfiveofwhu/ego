package com.ego.services.impl;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ����1�Զ�֪ͨ����
 * ae01:֪ͨ�����
 * ae03:״̬��
 *
 * aae101:��ˮ��
 * aae102:��Ϣ����
 * aae103:������
 * aae104:����ʱ��
 *
 * aae302:������
 * aae303:״̬  01-δ�� 02-�Ѷ�
 */
public class Ae01ServicesImpl extends JdbcServicesSupport {
    @Override
    public boolean update(String utype) throws Exception {
        if(utype.equalsIgnoreCase("insert"))
            return this.insert();
        if(utype.equalsIgnoreCase("modify"))
            return this.modify();
        throw new Exception("Ae01ServicesImpl utype:"+utype);
    }

    @Override
    public List<Map<String, String>> query(String qtype) throws Exception {
        if(qtype.equalsIgnoreCase("getAllMessages"))
            return getAllMessages();
        if(qtype.equalsIgnoreCase("getUserList"))
            return getUserList();
        return null;
    }

    /**
     * �鿴��ǰ�û�����֪ͨ����
     *
     * @return
     * @throws Exception
     */
    public List<Map<String, String>> getAllMessages() throws Exception
    {
        StringBuilder sql = new StringBuilder()
                .append("   SELECT aae301,aae103,aae302,aae102,aae104,aae303,aae105,aae106")
                .append("     FROM ae01,ae03")
                .append("    WHERE ae01.aae101=ae03.aae101 AND aae302=?")
                .append(" ORDER BY aae104 DESC")
                ;

        Object[] args = {
                this.get("aae302")
        };
        return this.queryForList(sql.toString(), args);
    }

    /**
     * һ�Զ���Ϣ�������������Ϣ
     *
     * ϵͳ��Ϣ��this.get("to")��1id��1�����id��
     *           this.get("aae102")������
     *           this.get("aae103"),��������id
     *           this.get("aae105")������
     *
     * @return
     * @throws Exception
     */
    public boolean insert() throws Exception
    {
        Object[] args3 = this.getUsersToSend().toArray();
        if(args3.length==0)
            return false;

        String aae101 = String.valueOf(Tools.getIncrementId("ae01"));
        StringBuilder sql1 = new StringBuilder()
                .append("INSERT INTO ae01 (aae101,aae102,aae103,aae104,aae105,aae106)")
                .append("     VALUES (?,?,?,CURRENT_TIMESTAMP,?,?)")
                ;

        Object[] args1 = {
                aae101,
                this.get("aae102"),
                this.get("aae103"),
                this.get("aae105"),
                getName()
        };

        StringBuilder sql2 = new StringBuilder()
                .append("INSERT INTO ae03 (aae101,aae303,aae302)")
                .append("     VALUES (?,?,?)")
                ;

        Object[] args2 = {
                aae101,
                "01",
        };

        return this.executeUpdate(sql1.toString(), args1) && this.batchUpdate(sql2.toString(), args2, args3);
    }

    /**
     * �޸Ĺ���֪ͨ��״̬
     * @return
     * @throws Exception
     */
    public boolean modify() throws Exception
    {
        StringBuilder sql = new StringBuilder()
                .append("UPDATE ae03")
                .append("   SET aae303=?")
                .append(" WHERE aae301=?")
                ;

        Object[] args={
                "02",
                this.get("aae301")
        };
        return this.executeUpdate(sql.toString(),args);
    }

    /**
     * ��ȡ��Ϣ������
     *
     *   type:��Ϣ���ͣ����������ͣ�
     *      1��ϵͳ����1��1��Ϣ����������֪ͨ�ȣ�
     *      2������Ա����ȫ����Ϣ
     *      3��������̷�˿��Ⱥ����Ϣ
     *      4�������Ʒ��˿��Ⱥ����Ϣ
     *      5����Է����̷�˿��Ⱥ����Ϣ
     *      6����Է����˿��Ⱥ����Ϣ
     *
     *     to: ��Ϣ������
     * @return
     * @throws Exception
     */
    private ArrayList<String> getUsersToSend() throws Exception
    {
        ArrayList<String> users=new ArrayList<>();
        String type=((String)this.get("to")).substring(0,1);
        String to=((String)this.get("to")).substring(1);

        StringBuilder sql=new StringBuilder()
                .append("SELECT aaa102 FROM aa03")
                .append(" WHERE aaa302=? AND aaa303=?")
                ;
        List<Map<String, String>> rows;
        switch (type)
        {
            case "1":
                users.add(to);
                return users;
            case "2":
                rows=this.queryForList("SELECT aaa102 FROM aa01");
                break;
            case "3":
                rows=this.queryForList(sql.toString(),"01",to);
                break;
            case "4":
                rows=this.queryForList(sql.toString(),"02",to);
                break;
            case "5":
                rows=this.queryForList(sql.toString(),"03",to);
                break;
            case "6":
                rows=this.queryForList(sql.toString(),"04",to);
                break;
            default:
                throw new Exception("Ae01 getUsersToSend:"+type);
        }
        for (Map<String, String> row : rows)
            users.add(row.get("aaa102"));
        return users;
    }

    /**
     * ��ȡ�����߿�ѡ��Ľ������б�
     *
     * type  1:�û�
     *       2:����
     *       3:������
     *       4:����Ա
     * @return
     */
    private List<Map<String, String>> getUserList() throws Exception {
        Object type=this.get("type");
        Object aab102=this.get("aab102");
        Object aac102=this.get("aac102");
        List<Map<String, String>> list=new ArrayList<>();
        Map<String,String> map=new HashMap<>();

        if(type.equals("2")&&this.isNotNull(aab102))
        {
            StringBuilder sql=new StringBuilder()
                    .append("SELECT aab203 id,CONCAT(aab202,'_',aab203,'-��˿') name,4 type")
                    .append("  FROM ab02")
                    .append(" WHERE aab102=?");
            map.put("id", String.valueOf(aab102));
            map.put("name","����-��˿");
            map.put("type","3");

            list.add(map);
            list.addAll(this.queryForList(sql.toString(),aab102));
            return list;
        }
        else if(type.equals("3")&&this.isNotNull(aac102))
        {
            StringBuilder sql=new StringBuilder()
                    .append("SELECT aac202 id,CONCAT(aac203,'_',aac202,'-��˿') name,6 type")
                    .append("  FROM ac02")
                    .append(" WHERE aac102=?");
            map.put("id", String.valueOf(aac102));
            map.put("name","������-��˿");
            map.put("type","5");

            list.add(map);
            list.addAll(this.queryForList(sql.toString(),aac102));
            return list;
        }
        else if(type.equals("4"))
        {
            map.put("id","0");
            map.put("name","ȫ���Ա");
            map.put("type","2");

            list.add(map);
            return list;
        }
        throw new Exception("Ae01ServicesImpl.getUserList()");
    }

    /**
     * ��ȡ����������
     * @return
     * @throws Exception
     */
    private String getName() throws Exception {
        String type=((String)this.get("to")).substring(0,1);
        Object from= this.get("aae103");
        if(type.equals("1"))
            return "ϵͳ";
        if(type.equals("2"))
            return "����Ա";
        //����
        if(type.equals("3")||type.equals("4"))
        {
            StringBuilder sql=new StringBuilder()
                    .append("SELECT aab103")
                    .append("  FROM ab01")
                    .append(" WHERE aab102=?");
            Map<String, String> map = this.queryForMap(sql.toString(), from);
            if(map!=null)
                return map.get("aab103");
        }
        //������
        else if(type.equals("5")||type.equals("6"))
        {
            StringBuilder sql=new StringBuilder()
                    .append("SELECT aac103")
                    .append("  FROM ac01")
                    .append(" WHERE aac102=?");
            Map<String, String> map = this.queryForMap(sql.toString(), from);
            if(map!=null)
                return map.get("aac103");
        }
        throw new Exception("Ae01ServicesImpl.getName()");
    }
}
