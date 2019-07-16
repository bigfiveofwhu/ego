package com.ego.services.impl;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

import java.util.ArrayList;
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
        throw new Exception("Ae01 utype:"+utype);
    }

    /**
     * �鿴��ǰ�û�����֪ͨ����
     *
     * @return
     * @throws Exception
     */
    @Override
    public List<Map<String, String>> query() throws Exception
    {
        StringBuilder sql = new StringBuilder()
                .append("   SELECT aae301,aae103,aae302,aae102,aae104,aae303,aae105")
                .append("     FROM ae01,ae03")
                .append("    WHERE ae01.aae101=ae03.aae101 AND aae302=?")
                .append(" ORDER BY aae104 DESC")
                ;

        Object[] args = {
                this.get("qaae302")
        };
        return this.queryForList(sql.toString(), args);
    }


    /**
     * һ�Զ���Ϣ�������������Ϣ
     *
     * @return
     * @throws Exception
     */
    public boolean insert() throws Exception
    {
        String aae101 = String.valueOf(Tools.getIncrementId("ae01"));
        StringBuilder sql1 = new StringBuilder()
                .append("INSERT INTO ae01 (aae101,aae102,aae103,aae104,aae105)")
                .append("     VALUES (?,?,?,CURRENT_TIMESTAMP,?)")
                ;

        Object[] args1 = {
                aae101,
                this.get("aae102"),
                this.get("aae103"),
                this.get("aae105")
        };

        StringBuilder sql2 = new StringBuilder()
                .append("INSERT INTO ae03 (aae101,aae303,aae302)")
                .append("     VALUES (?,?,?)")
                ;

        Object[] args2 = {
                aae101,
                "01",
        };

//        Object[] args3 = ((String) this.get("aae302")).split(",");
        Object[] args3 = this.getUsersToSend().toArray();

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
        String type=(String) this.get("type");
        String to=(String)this.get("aae302");

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
}
