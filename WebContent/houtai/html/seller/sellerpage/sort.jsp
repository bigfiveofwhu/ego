<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@include file="/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="renderer" content="webkit" />
<title>ѡ����Ʒ���ڷ���</title>
<link rel="stylesheet" href="<%=path %>/houtai/css/style1.css" />
<script type="text/javascript" src="<%=path %>/houtai/plugins/jQuery/jquery.min.js"></script>
</head>
<body>
<div class="contains">
	<!--���м����-->
	<div class="crumbNav">
		<a href="<%=path %>/houtai/html/seller/sellerpage/goods_edit.jsp">����</a>
		<font>&gt;</font>
		������Ʒ
		<font>&gt;</font>
		ѡ����Ʒ���ڷ���
	</div>
	<!--��Ʒ����-->
    <div class="wareSort clearfix">
		<ul id="sort1"></ul>
		<ul id="sort2" style="display: none;"></ul>
		<ul id="sort3" style="display: none;"></ul>
	</div>
	<div class="selectedSort"><b>����ǰѡ�����Ʒ����ǣ�</b><i id="selectedSort"></i></div>
	<div class="wareSortBtn">
		<input id="releaseBtn" type="button" value="��һ��" disabled="disabled" />
	</div>
	<script src="<%=path %>/houtai/js/pages/sort.js"></script>
</div>

</body>
<script>
var expressP, expressC, expressD, expressArea, areaCont;
var arrow = "-";

/*��ʼ��һ��Ŀ¼*/
function intProvince() {
	areaCont = "";
	for (var i=0; i<province.length; i++) {
		areaCont += '<li onClick="selectP(' + i + ');"><a href="javascript:void(0)">' + province[i] + '</a></li>';
	}
	$("#sort1").html(areaCont);
}
intProvince();

/*ѡ��һ��Ŀ¼*/
function selectP(p) {
	areaCont = "";
	for (var j=0; j<city[p].length; j++) {
		areaCont += '<li onClick="selectC(' + p + ',' + j + ');"><a href="javascript:void(0)">' + city[p][j] + '</a></li>';
	}
	$("#sort2").html(areaCont).show();
	$("#sort3").hide();
	$("#sort1 li").eq(p).addClass("active").siblings("li").removeClass("active");
	expressP = province[p];
	$("#selectedSort").html(expressP);
	$("#releaseBtn").attr("disabled",true) ;
}

/*ѡ�����Ŀ¼*/
function selectC(p,c) {
	areaCont = "";
	expressC = "";
	for (var k=0; k<district[p][c].length; k++) {
		areaCont += '<li onClick="selectD(' + p + ',' + c + ',' + k + ');"><a href="javascript:void(0)">' + district[p][c][k] + '</a></li>';
	}
	$("#sort3").html(areaCont).show();
	$("#sort2 li").eq(c).addClass("active").siblings("li").removeClass("active");
	expressC = expressP + arrow + city[p][c];
	$("#selectedSort").html(expressC);
	$("#releaseBtn").attr("disabled",true) ;
}

/*ѡ������Ŀ¼*/
function selectD(p,c,d) {
	$("#sort3 li").eq(d).addClass("active").siblings("li").removeClass("active");
	expressD = expressC + arrow + district[p][c][d];
	$("#selectedSort").html(expressD);
	//$("#releaseBtn").attr("disabled") = false;
	$("#releaseBtn").attr("disabled",false) ;
}

/*�����һ��*/
$("#releaseBtn").click(function() {
	console.log(expressD);
	var releaseS = $(this).prop("disabled");
	if (releaseS == false){//δ������
		location.href = "getProSort.html?sortName="+expressD;//��ת����һҳ
	}
});

</script>
</html>
