package com.ego.system.utils;

import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ego.services.BaseServices;

public class GeneJSP 
{
	public static void geneJSP(BaseServices service)
	{
		OutputStreamWriter writer=null;
		try(FileOutputStream fileOutput=new FileOutputStream("WebContent/home/productType.jsp");)
		{
			writer=new OutputStreamWriter(fileOutput,"GBK");
			writer.write("<%@ page language=\"java\" pageEncoding=\"GBK\"%>\r\n");
			Map<String,Object> DTO=new HashMap<>();
			DTO.put("fname", "aab204");
			DTO.put("pfcode", "0");
			service.setMapDto(DTO);
			List<Map<String,String>> rows=service.query();
			int n=rows.size();
			System.out.println(n+"  "+rows);
			for(int i=0;i<n;i++)
			{
				String t=rows.get(i).get("fvalue");
				String tmp=rows.get(i).get("fcode");
				writer.write("<li class=\"appliance js_toggle relative first\">\r\n");
				writer.write("	<div class=\"category-info\">\r\n");
				writer.write("		<h3 class=\"category-name b-category-name\">\r\n"); 
				writer.write("			<i><img src=\"<%=path%>/images/cake.png\"> </i>\r\n"); 
				writer.write("			<a class=\"ml-22 productType\" ptype_id=\""+tmp+"\" title=\""+t+"\">"+t+"</a>\r\n"); 
				writer.write("		</h3>\r\n"); 
				writer.write("		<em>&gt;</em>\r\n");
				writer.write("	</div>\r\n");
				writer.write("	<div class=\"menu-item menu-in top\">\r\n");
				writer.write("		<div class=\"area-in\">\r\n");
				writer.write("			<div class=\"area-bg\">\r\n");
				writer.write("				<div class=\"menu-srot\">\r\n");
				writer.write("					<div class=\"sort-side\">\r\n");
				DTO.put("pfcode", tmp);
				List<Map<String,String>> subRows=service.query();
				int p=subRows.size();
				System.out.println(p+"  "+subRows);
				for(int j=0;j<p;j++)
				{
					t=subRows.get(j).get("fvalue");
					tmp=subRows.get(j).get("fcode");
					writer.write("						<dl class=\"dl-sort\">\r\n");
					writer.write("							<dt>\r\n"); 
					writer.write("								<span class=\"productType\"  ptype_id=\""+tmp+"\" title=\""+t+"\">"+t+"</span>\r\n");
					writer.write("							</dt>\n");
					DTO.put("pfcode", tmp);
					List<Map<String,String>> sSubRows=service.query();
					int q=sSubRows.size();
					System.out.println(q+"  "+sSubRows);
					for(int m=0;m<q;m++)
					{
						t=sSubRows.get(m).get("fvalue");
						tmp=sSubRows.get(m).get("fcode");
						writer.write("							<dd>\r\n");
						writer.write("								<a class=\"productType\" ptype_id=\""+tmp+"\" title=\""+t+"\" href=\"#\"><span>"+t+"</span> </a>\r\n");
						writer.write("							</dd>\r\n");
					}
					writer.write("						</dl>\r\n");
				}
				writer.write("					</div>\r\n");
				writer.write("					<div class=\"brand-side\">\r\n");  //==================实力商家推荐==============
				writer.write("					</div>\r\n");
				writer.write("				</div>\r\n");
				writer.write("			</div>\r\n");
				writer.write("		</div>\r\n");
				writer.write("	</div>\r\n");
				writer.write("</li>\r\n");
			}
			writer.flush();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}
