package com.ego.services.impl;

import com.ego.services.JdbcServicesSupport;
import com.ego.system.tools.Tools;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理1对多通知公告
 * ae01:通知公告表
 * ae03:状态表
 *
 * aae101:流水号
 * aae102:消息内容
 * aae103:发布人
 * aae104:发布时间
 * aae105:标题
 * aae106:姓名
 * aae107:类型
 *
 * aae302:接收人
 * aae303:状态  01-未读 02-已读
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
        if(qtype.equalsIgnoreCase("queryPastSentMessage"))
            return queryPastSentMessage();
        throw new Exception("Ae01ServicesImpl qtype:"+qtype);
    }

    /**
     * 查看当前用户所有通知公告
     *
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> getAllMessages() throws Exception
    {
        StringBuilder sql = new StringBuilder()
                .append("   SELECT aae301,aae103,aae302,aae102,aae104,aae303,aae105,aae106")
                .append("     FROM ae01,ae03")
                .append("    WHERE ae01.aae101=ae03.aae101 AND aae302=?");

        //商家/服务商
        if(this.isNotNull(this.get("ShopOrService")))
        {
            sql.append(" AND aae107='2'");
        }

        sql.append(" ORDER BY aae104 DESC");
        Object[] args = {
                this.get("aaa102")
        };
        return this.queryForList(sql.toString(), args);
    }

    /**
     * 一对多消息，批处理添加消息
     *
     * 系统消息：this.get("to")：1id（1后面接id）
     *           this.get("aae102")：内容
     *           this.get("aae103"),：发送人id(系统默认0)
     *           this.get("aae105")：标题
     *
     * @return
     * @throws Exception
     */
    private boolean insert() throws Exception
    {
        Object[] args3 = this.getUsersToSend().toArray();
        if(args3.length==0)
            throw new Exception("没有粉丝");

        String aae101 = String.valueOf(Tools.getIncrementId("ae01"));
        StringBuilder sql1 = new StringBuilder()
                .append("INSERT INTO ae01 (aae101,aae102,aae103,aae104,aae105,aae106,aae107)")
                .append("     VALUES (?,?,?,CURRENT_TIMESTAMP,?,?,?)")
                ;

        Object[] args1 = {
                aae101,
                this.get("aae102"),
                this.get("aae103"),
                this.get("aae105"),
                getName(),
                ((String)this.get("to")).substring(0,1)
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
     * 修改公告通知的状态
     * @return
     * @throws Exception
     */
    private boolean modify() throws Exception
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
     * 获取消息接收人
     *
     *   type:信息类型（接收者类型）
     *      1：系统发的1对1消息（例如物流通知等）
     *      2：管理员发的全体消息
     *      3：针对商铺粉丝的群体消息
     *      4：针对商品粉丝的群体消息
     *      5：针对服务商粉丝的群体消息
     *      6：针对服务粉丝的群体消息
     *
     *     to: 消息接收者
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
                rows=this.queryForList(sql.toString(),"02",to);
                break;
            case "4":
                rows=this.queryForList(sql.toString(),"01",to);
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
     * 获取发送者可选择的接收者列表
     *
     * type  1:用户
     *       2:商铺
     *       3:服务商
     *       4:管理员
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
                    .append("SELECT aab203 id,CONCAT(aab202,'_',aab203,'-粉丝') name,4 type")
                    .append("  FROM ab02")
                    .append(" WHERE aab102=? AND aab212='02'");
            map.put("id", String.valueOf(aab102));
            map.put("name","商铺-粉丝");
            map.put("type","3");

            list.add(map);
            list.addAll(this.queryForList(sql.toString(),aab102));
            return list;
        }
        else if(type.equals("3")&&this.isNotNull(aac102))
        {
            StringBuilder sql=new StringBuilder()
                    .append("SELECT aac202 id,CONCAT(aac203,'_',aac202,'-粉丝') name,6 type")
                    .append("  FROM ac02")
                    .append(" WHERE aac102=? AND aac208='02'");
            map.put("id", String.valueOf(aac102));
            map.put("name","服务商-粉丝");
            map.put("type","5");

            list.add(map);
            list.addAll(this.queryForList(sql.toString(),aac102));
            return list;
        }
        else if(type.equals("4"))
        {
            map.put("id","0");
            map.put("name","全体成员");
            map.put("type","2");

            list.add(map);
            return list;
        }
        throw new Exception("Ae01ServicesImpl.getUserList()");
    }

    /**
     * 获取发送人名字
     * @return
     * @throws Exception
     */
    private String getName() throws Exception {
        String type=((String)this.get("to")).substring(0,1);
        Object from= this.get("aae103");
        if(type.equals("1"))
            return "系统";
        if(type.equals("2"))
            return "管理员";
        //店铺
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
        //服务商
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

    /**
     * 查询商铺/服务商/管理员发过的通知公告
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> queryPastSentMessage() throws Exception {
        Object aab102=this.get("aab102");
        Object aac102=this.get("aac102");
        Object type=this.get("type");
        if(type==null)
            throw new Exception("Ae01ServicesImpl.queryPastSentMessage()");

        StringBuilder sql=new StringBuilder()
                .append("SELECT aae104,aae105,aae102,COUNT(*) count,COUNT(IF(aae303=02,1,null)) see")
                .append("  FROM ae01 a1,ae03 a3")
                .append(" WHERE a1.aae101=a3.aae101")
                ;

        //商铺
        if(type.equals("2")&&this.isNotNull(aab102))
        {
            sql.append(" AND (aae107=3 OR aae107=4) AND aae103=? GROUP BY a1.aae101  ORDER BY aae104 DESC");
            return this.queryForList(sql.toString(),aab102);
        }
        //服务商
        else if(type.equals("3")&&this.isNotNull(aac102))
        {
            sql.append(" AND (aae107=5 OR aae107=6) AND aae103=? GROUP BY a1.aae101  ORDER BY aae104 DESC");
            return this.queryForList(sql.toString(),aac102);
        }
        //管理员
        else if(type.equals("4"))
        {
            sql.append(" AND aae107=2 GROUP BY a1.aae101  ORDER BY aae104 DESC");
            return this.queryForList(sql.toString());
        }
        throw new Exception("Ae01ServicesImpl.queryPastSentMessage()");
    }
}
