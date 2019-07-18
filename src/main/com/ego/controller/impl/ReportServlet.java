package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.ReportServiceImpl;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReportServlet extends ControllerSupport
{
    public ReportServlet()
    {
        this.setServices(new ReportServiceImpl());
    }

    @Override
    public String execute() throws Exception
    {
        String path = "report/index";
        String servletPath = ((HttpServletRequest) this.dto.get("request")).getServletPath();
        String mapping = servletPath.substring(servletPath.lastIndexOf('/') + 1
                , servletPath.indexOf('.'));

        switch (mapping)
        {
            case "userReport":
                this.dealWithUser();
                break;

            case "shopperReport":
                this.dealWithShopperOrServiceProvider(true);
                break;

            case "serviceProviderReport":
                this.dealWithShopperOrServiceProvider(false);
                break;
            default:
                throw new Exception("ReportServlet�޷������������:" + mapping);
        }
        return path;
    }

    /**
     * �����û���ˮ��������:�������Ʒ��ˮ����ϸ��ÿ�죩
     *                      :����·�����ˮ
     *                      :�ϸ�����Ʒ��ˮ
     *                      :�ϸ��·�����ˮ
     *                      :������Ʒ��ˮ����ϸ���£�
     *                      :���������ˮ
     *                      :ȥ����Ʒ��ˮ
     *                      :ȥ���������ˮ
     *
     * ���ຯ�����ƣ����̰���Ʒ��һ��ϸ��
     *              �����̰������һ��ϸ��
     *
     * @throws Exception sql�쳣
     */
    private void dealWithUser() throws Exception
    {
        //��ǰ��/������
        this.dto.put("diff", 0);
        double[] d1 = convert(this.getServices().query("queryShopForMonth"), true);
        double[] d2 = convert(this.getServices().query("queryServiceForMonth"), true);
        double[] d3 = convert(this.getServices().query("queryShopForYear"), false);
        double[] d4 = convert(this.getServices().query("queryServiceForYear"), false);
        String s1 = dataFormat("���µ���", d1);
        String s2 = dataFormat("���·���", d2);
        String s3 = dataFormat("�����ܺ�", addArray(d1, d2));
        String s4 = dataFormat("�������", d3);
        String s5 = dataFormat("�������", d4);
        String s6 = dataFormat("�����ܺ�", addArray(d3, d4));

        //�ϸ���/������
        this.dto.put("diff", 1);
        double[] d5 = convert(this.getServices().query("queryShopForMonth"), true);
        double[] d6 = convert(this.getServices().query("queryServiceForMonth"), true);
        double[] d7 = convert(this.getServices().query("queryShopForYear"), false);
        double[] d8 = convert(this.getServices().query("queryServiceForYear"), false);
        String s7 = dataFormat("���µ���", d5);
        String s8 = dataFormat("���·���", d6);
        String s9 = dataFormat("�����ܺ�", addArray(d5, d6));
        String s10 = dataFormat("ȥ�����", d7);
        String s11 = dataFormat("ȥ�����", d8);
        String s12 = dataFormat("ȥ���ܺ�", addArray(d7, d8));

        this.saveAttribute("monthly", s1 + s2 + s3 + s7 + s8 + s9);
        this.saveAttribute("yearly", s4 + s5 + s6 + s10 + s11 + s12);
    }

    private void dealWithShopperOrServiceProvider(boolean tag) throws Exception
    {
        String queryForMonth = tag ? "queryShopForMonth" : "queryServiceForMonth";
        String queryForYear = tag ? "queryShopForYear" : "queryServiceForYear";
        StringBuilder monthly = new StringBuilder();
        StringBuilder yearly = new StringBuilder();
        //�¶��ܺ�
        double[] m_d1 = new double[31];
        double[] m_d2 = new double[31];
        //����ܺ�
        double[] y_d1 = new double[12];
        double[] y_d2 = new double[12];

        //��ǰ��/������
        this.dto.put("diff", 0);
        Map<String, double[]> m1 = convertMap(this.getServices().query(queryForMonth), true);
        Map<String, double[]> m2 = convertMap(this.getServices().query(queryForYear), false);
        for (String s : m1.keySet())
        {
            double[] d = m1.get(s);
            monthly.append(dataFormat("����_" + s, d));
            m_d1 = addArray(m_d1, d);
        }
        monthly.append(dataFormat("�����ܺ�", m_d1));

        for (String s : m2.keySet())
        {
            double[] d = m1.get(s);
            yearly.append(dataFormat("����_" + s, d));
            y_d1 = addArray(y_d1, d);
        }
        yearly.append(dataFormat("�����ܺ�", y_d1));

        //�ϸ���/������
        this.dto.put("diff", 1);
        Map<String, double[]> m3 = convertMap(this.getServices().query(queryForMonth), true);
        Map<String, double[]> m4 = convertMap(this.getServices().query(queryForYear), false);
        for (String s : m3.keySet())
        {
            double[] d = m3.get(s);
            monthly.append(dataFormat("����_" + s, d));
            m_d2 = addArray(m_d2, d);
        }
        monthly.append(dataFormat("�����ܺ�", m_d2));

        for (String s : m4.keySet())
        {
            double[] d = m4.get(s);
            yearly.append(dataFormat("ȥ��_" + s, d));
            y_d2 = addArray(y_d2, d);
        }
        yearly.append(dataFormat("ȥ���ܺ�", y_d2));

        this.saveAttribute("monthly", monthly.toString());
        this.saveAttribute("yearly", yearly.toString());
    }

    /**
     * �û�/����Ա
     * ��list�滻Ϊdouble����
     *
     * @param list sql���ص�list
     * @param tag  true:����һ������ÿ�����ˮ����ÿ��31����
     *             false:����һ����ÿ���µ���ˮ����ÿ��12������
     * @return ����double����
     */
    private double[] convert(List<Map<String, String>> list, boolean tag)
    {
        String s = tag ? "day" : "month";
        int l = tag ? 31 : 12;
        double[] result = new double[l];
        Map<String, String> tmp = new HashMap<>();

        for (Map<String, String> map : list)
        {
            tmp.put(map.get(s), map.get("sum"));
        }

        for (int i = 0; i < l; i++)
        {
            String sum = tmp.get(String.valueOf(i + 1));
            if (sum == null)
                result[i] = 0;
            else
                result[i] = Double.parseDouble(sum);
        }

        return result;
    }

    /**
     * ����/������
     * ��list�滻ΪMap��keyΪname��valueΪdouble���飬����Ʒ��/��������һ��ϸ��
     *
     * @param list sql���ص�list
     * @param tag  true:����һ������ÿ�����ˮ����ÿ��31����
     *             false:����һ����ÿ���µ���ˮ����ÿ��12������
     * @return ��װ��Ʒ/����������֮��Ӧ������
     */
    private Map<String, double[]> convertMap(List<Map<String, String>> list, boolean tag)
    {
        String s = tag ? "day" : "month";
        int l = tag ? 31 : 12;
        Map<String, double[]> result = new HashMap<>();
        Map<String, Map<String, String>> tmp = new HashMap<>();

        for (Map<String, String> map : list)
        {
            String name = map.get("name");
            Map<String, String> tmp2 = tmp.get(name);
            if (tmp2 == null)
            {
                tmp2 = new HashMap<>();
                tmp2.put(map.get(s), map.get("sum"));
                tmp.put(name, tmp2);
            }
            else
            {
                tmp2.put(map.get(s), map.get("sum"));
            }
        }

        for (String key : tmp.keySet())
        {
            Map<String, String> map = tmp.get(key);
            double[] d = new double[l];
            for (int i = 0; i < l; i++)
            {
                String sum = map.get(String.valueOf(i + 1));
                if (sum == null)
                    d[i] = 0;
                else
                    d[i] = Double.parseDouble(sum);
            }
            result.put(key, d);
        }
        return result;
    }

    /**
     * double�������
     * @param d1
     * @param d2
     * @return
     */
    private double[] addArray(double[] d1, double[] d2)
    {
        int l = d1.length;
        double[] result = new double[l];
        for (int i = 0; i < l; i++)
        {
            result[i] = d1[i] + d2[i];
        }
        return result;
    }

    /**
     * ת����Highcharts��Ҫ�ĸ�ʽ
     * @param name
     * @param d
     * @return
     */
    private String dataFormat(String name, double[] d)
    {
        StringBuilder str = new StringBuilder();
        for (double v : d)
        {
            str.append(",").append(v);
        }
        return "{ name: '" + name + "', data: [" + str.toString().substring(1) + "]},";
    }
}
