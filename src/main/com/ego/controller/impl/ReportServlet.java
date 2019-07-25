package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.ReportServiceImpl;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

public class ReportServlet extends ControllerSupport
{
    public ReportServlet()
    {
        this.setServices(new ReportServiceImpl());
    }

    @Override
    public String execute() throws Exception
    {
        String path;
        String servletPath = ((HttpServletRequest) this.dto.get("request")).getServletPath();
        String mapping = servletPath.substring(servletPath.lastIndexOf('/') + 1
                , servletPath.indexOf('.'));

        switch (mapping)
        {
            /***************************************************�µĴ����߼�************************************************************/
            //�°�
            case "userReport":
                this.dealWithUser();
                this.dealWithUser2();
                path = "report/userReport";
                break;

            case "shopperReport":
                this.dealWithShopperOrServiceProvider(true);
                this.dealWithShop2();
                path = "report/shopperReport";
                break;

            case "serviceProviderReport":
                this.dealWithShopperOrServiceProvider(false);
                this.dealWithService2();
                path = "report/serviceProviderReport";
                break;

            case "adminReport":
                this.dealWithUser();
                this.dealWithAdmin2();
                path = "report/adminReport";
                break;
            default:
                throw new Exception("ReportServlet�޷������������:" + mapping);
        }
        return path;
    }

    /**
     * �����û���ˮ��������:�������Ʒ��ˮ����ϸ��ÿ�죩
     * :����·�����ˮ
     * :�ϸ�����Ʒ��ˮ
     * :�ϸ��·�����ˮ
     * :������Ʒ��ˮ����ϸ���£�
     * :���������ˮ
     * :ȥ����Ʒ��ˮ
     * :ȥ���������ˮ
     * <p>
     * ���ຯ�����ƣ����̰���Ʒ��һ��ϸ��
     * �����̰������һ��ϸ��
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
            double[] d = m2.get(s);
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

        for (Map<String, String> map : list) {
            String name = map.get("name");
            Map<String, String> tmp2 = tmp.get(name);
            if (tmp2 == null) {
                tmp2 = new HashMap<>();
                tmp2.put(map.get(s), map.get("sum"));
                tmp.put(name, tmp2);
            } else {
                tmp2.put(map.get(s), map.get("sum"));
            }
        }

        for (String key : tmp.keySet()) {
            Map<String, String> map = tmp.get(key);
            double[] d = new double[l];
            for (int i = 0; i < l; i++) {
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
     *
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
     *
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

    /**
     * ת����Highcharts��Ҫ�ĸ�ʽ
     *
     * @param name
     * @param s
     * @return
     */
    private String dataFormat(String name, String[] s)
    {
        StringBuilder str = new StringBuilder();
        for (String v : s)
        {
            str.append(",").append(v);
        }
        if(str.length()==0)
            return "{ name: '" + name + "', data: []},";
        return "{ name: '" + name + "', data: [" + str.toString().substring(1) + "]},";
    }

    /***************************************************�µĴ����߼�************************************************************/
    /**
     * �µĴ����û���ˮ������
     * <p>
     * --1.����/�������������(�ı����ݱ�����һ������ֱ�ӵ�λ����ʾ)
     * ������������������ͳ��(��׼ͬ��)
     * <p>
     * --2.�������Ѽ�¼(���,��ϸ��ʾÿһ�ʽ��׵�ʱ��,���,����ȥ��(������Ʒ�����))
     *
     * @throws Exception
     */
    private void dealWithUser2() throws Exception
    {
        Map<String, Object> map = new HashMap<>();
        double d1 = getSumFromList(this.getServices().query("shopSumMonth"));
        double d2 = getSumFromList(this.getServices().query("shopSumYear"));
        double d3 = getSumFromList(this.getServices().query("shopSumAll"));

        double d4 = getSumFromList(this.getServices().query("serviceSumMonth"));
        double d5 = getSumFromList(this.getServices().query("serviceSumYear"));
        double d6 = getSumFromList(this.getServices().query("serviceSumAll"));

        map.put("shopSumMonth", d1);
        map.put("shopSumYear", d2);
        map.put("shopSumAll", d3);

        map.put("serviceSumMonth", d4);
        map.put("serviceSumYear", d5);
        map.put("serviceSumAll", d6);

        map.put("sumMonth", d1 + d4);
        map.put("sumYear", d2 + d5);
        map.put("sumAll", d3 + d6);

        //1
        this.saveAttribute("map", map);
        //2
        this.saveAttribute("userMonthlyReportDetail", this.getServices().query("userMonthlyReportDetail"));
    }

    /**
     * �µĴ���������ˮ������
     * <p>
     * --1.�����ʾ���������еĶ���(��Ʒ,���׶�,ʱ��)
     * --2.����/����ܽ������Ǯ��(�ı����ݱ�����һ������ֱ�ӵ�λ����ʾ)
     * --3.���¸���Ʒ�������佻�׶�(��״ͼ��ʾ),��ѡĳ��Ʒ��ʾ����Ʒ������
     * <p>
     * --4.һ���ڸ��·ݵ������������ͼ(����ͼ,
     * ͬʱ��ҳ���·���ʾ�����ڵ�����,���۶�(�ı�))
     * --5.���±�����������Ʒ�ĵ����(�����ʾ����),�����������Ӹߵ�����ʾ������Ʒ
     * ���� ����� ������ ���۶�
     *
     * @throws Exception
     */
    private void dealWithShop2() throws Exception
    {
        Map<String, Object> map = new HashMap<>();
        double d1 = getSumFromList(this.getServices().query("shopSumMonth"));
        double d2 = getSumFromList(this.getServices().query("shopSumYear"));
        double d3 = getSumFromList(this.getServices().query("shopSumAll"));

        map.put("shopSumMonth", d1);
        map.put("shopSumYear", d2);
        map.put("shopSumAll", d3);

        double[][] doubles = convert(this.getServices().query("shopYearlyReportDetail"));
        String s1 = dataFormat("���۶�", doubles[0]);
        String s2 = dataFormat("������", doubles[1]);

        StringBuilder s3 = new StringBuilder();
        StringBuilder s4 = new StringBuilder();
        Map<String, double[][]> m1 = convertMap(this.getServices().query("queryShopForMonth2"));
        ArrayList<String> tmp = new ArrayList<>();
        for (String s : m1.keySet())
        {
            tmp.add(s);
            double[][] d = m1.get(s);
            s3.append(dataFormat(s + " ���۶�", d[0]));
            s4.append(dataFormat(s + " ������", d[1]));
        }
        ArrayList<String> goods = getGoodsNameFormList(this.getServices().query("queryGoodsOfShop"));
        double[] zeros = new double[31];
        for (String good : goods)
        {
            if (!tmp.contains(good))
            {
                s3.append(dataFormat(good + " ���۶�", zeros));
                s4.append(dataFormat(good + " ������", zeros));
            }
        }

        //2
        this.saveAttribute("map", map);
        //1
        this.saveAttribute("shopMonthlyReportDetail", this.getServices().query("shopMonthlyReportDetail"));
        //5
        this.saveAttribute("shopMonthlyReportDetailForGoods", this.getServices().query("shopMonthlyReportDetailForGoods"));
        //4
        this.saveAttribute("yearlySum", s1);
        this.saveAttribute("yearlyCount", s2);
        //3
        this.saveAttribute("monthlySum", s3.toString());
        this.saveAttribute("monthlyCount", s4.toString());
    }

    /**
     * �µĴ����������ˮ������
     * <p>
     * --1.�������з��񶩵�(����,���׶�,ʱ��)
     * --2.���/�¶��ܳɽ��ܳɽ���
     *
     * @throws Exception
     */
    private void dealWithService2() throws Exception
    {
        Map<String, Object> map = new HashMap<>();
        double d1 = getSumFromList(this.getServices().query("serviceSumMonth"));
        double d2 = getSumFromList(this.getServices().query("serviceSumYear"));
        double d3 = getSumFromList(this.getServices().query("serviceSumAll"));

        map.put("serviceSumMonth", d1);
        map.put("serviceSumYear", d2);
        map.put("serviceSumAll", d3);

        //2
        this.saveAttribute("map", map);
        //1
        this.saveAttribute("serviceMonthlyDetail", this.getServices().query("serviceMonthlyDetail"));
    }

    /**
     * �µĴ������Ա����ˮ����
     * <p>
     * --1.ƽ̨һ���ڸ������ʽ�������(����ͼ)
     * --2.ƽ̨��һ�������Ʒ����,�ɽ���(����ͼ)
     * --3.ƽ̨��һ����·��񶩵���,�ɽ���(����ͼ)
     * --4.����ƽ̨����Ʒ��������ǰ5�ĵ���(��״ͼ)
     * --5.����ƽ̨����Ʒ���׶�����ǰ5�ĵ���(��״ͼ)
     * <p>
     * --6.ƽ̨���ڸ��µ�����ܺ�(����ͼ)
     *
     * @throws Exception
     */
    private void dealWithAdmin2() throws Exception
    {
        double[][] doubles1 = convert(this.getServices().query("shopYearlyReportDetail"));
        double[][] doubles2 = convert(this.getServices().query("serviceYearlyReportDetail"));
        String s1 = dataFormat("��Ʒ���۶�", doubles1[0]);
        String s2 = dataFormat("��Ʒ������", doubles1[1]);

        String s3 = dataFormat("�������۶�", doubles2[0]);
        String s4 = dataFormat("����������", doubles2[1]);

        String s5 = dataFormat("�����۶�", addArray(doubles1[0], doubles2[0]));
        String s6 = dataFormat("��������", addArray(doubles1[1], doubles2[1]));

        this.dto.put("tmp", "sum");
        String[][] strings1 = convert2(this.getServices().query("adminMonthlyReportDetail"), true);
        String s7 = dataFormat("���۶�", strings1[1]);

        this.dto.put("tmp", "count");
        String[][] strings2 = convert2(this.getServices().query("adminMonthlyReportDetail"), false);
        String s8 = dataFormat("������", strings2[1]);

        double[] d1 = convert(this.getServices().query("clickCount"), false);

        //2
        this.saveAttribute("shopSum", s1);
        this.saveAttribute("shopCount", s2);
        //3
        this.saveAttribute("serviceSum", s3);
        this.saveAttribute("serviceCount", s4);
        //1
        this.saveAttribute("allSum", s5);
        this.saveAttribute("allCount", s6);
        //5
        this.saveAttribute("sum", s7);
        this.saveAttribute("sum_x", arrayToString(strings1[0]));
        //4
        this.saveAttribute("count", s8);
        this.saveAttribute("count_x", arrayToString(strings2[0]));
        //6
        this.saveAttribute("clickCount", dataFormat("�����", d1));
    }

    /**
     * ��ȡlist�׸�map�����sumֵ����������
     *
     * @param list
     * @return
     */
    private double getSumFromList(List<Map<String, String>> list)
    {
        if (!list.isEmpty() && list.get(0).get("sum") != null)
            return Double.parseDouble(list.get(0).get("sum"));
        return 0;
    }

    /**
     * ��list�е�sum��count��ȡ����
     *
     * @param list
     * @return
     */
    private double[][] convert(List<Map<String, String>> list)
    {
        double[][] result = new double[2][12];
        Map<String, Map.Entry<Object, Object>> tmp = new HashMap<>();

        for (Map<String, String> map : list)
        {
            tmp.put(map.get("month"), new AbstractMap.SimpleEntry<>(map.get("sum"), map.get("count")));
        }

        for (int i = 0; i < 12; i++)
        {
            Map.Entry<Object, Object> entry = tmp.get(String.valueOf(i + 1));
            if (entry == null)
            {
                result[0][i] = 0;
                result[1][i] = 0;
            }
            else
            {
                result[0][i] = Double.parseDouble(String.valueOf(entry.getKey()));
                result[1][i] = Double.parseDouble(String.valueOf(entry.getValue()));
            }
        }

        return result;
    }

    /**
     * ���������۶�/����������ǰ5�ĵ���
     *
     * @param list Ҫ�����list
     * @param tag  true�����۶false��������
     * @return
     */
    private String[][] convert2(List<Map<String, String>> list, boolean tag)
    {
        String s = tag ? "sum" : "count";
        String[][] result = new String[2][list.size()];
        for (int i = 0; i < list.size(); i++)
        {
            Map<String, String> map = list.get(i);
            result[0][i] = map.get("name");
            result[1][i] = map.get(s);
        }
        return result;
    }

    /**
     * ��String����תΪString
     *
     * @param array
     * @return
     */
    private String arrayToString(String[] array)
    {
        if(array.length==0)
            return "";
        StringBuilder sb = new StringBuilder();
        for (String s : array)
            sb.append(",'").append(s).append("'");
        return sb.toString().substring(1);
    }

    /**
     * ȡ��list��name��Ӧ�� day��Ӧ��sum��count,0��sum,1��count
     *
     * @param list
     * @return
     */
    private Map<String, double[][]> convertMap(List<Map<String, String>> list)
    {
        Map<String, double[][]> result = new HashMap<>();
        Map<String, Map<String, Map.Entry<String, String>>> tmp = new HashMap<>();

        for (Map<String, String> map : list)
        {
            String name = map.get("name");
            Map<String, Map.Entry<String, String>> tmp2 = tmp.get(name);
            if (tmp2 == null)
            {
                tmp2 = new HashMap<>();
                tmp2.put(map.get("day"), new AbstractMap.SimpleEntry<>(map.get("sum"), map.get("count")));
                tmp.put(name, tmp2);
            }
            else
            {
                tmp2.put(map.get("day"), new AbstractMap.SimpleEntry<>(map.get("sum"), map.get("count")));
            }
        }

        for (String key : tmp.keySet())
        {
            Map<String, Map.Entry<String, String>> map = tmp.get(key);
            double[][] d = new double[2][31];
            for (int i = 0; i < 31; i++)
            {
                Map.Entry<String, String> sum = map.get(String.valueOf(i + 1));
                if (sum == null)
                {
                    d[0][i] = 0;
                    d[1][i] = 0;
                }
                else
                {
                    d[0][i] = Double.parseDouble(sum.getKey());
                    d[1][i] = Double.parseDouble(sum.getValue());
                }
            }
            result.put(key, d);
        }
        return result;
    }

    /**
     * ��list�л�ȡ��Ʒ��
     *
     * @param list
     * @return
     */
    private ArrayList<String> getGoodsNameFormList(List<Map<String, String>> list)
    {
        ArrayList<String> result = new ArrayList<>();
        for (Map<String, String> map : list)
        {
            result.add(map.get("name"));
        }
        return result;
    }
}
