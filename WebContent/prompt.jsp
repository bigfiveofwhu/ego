<%@ page language="java" pageEncoding="GBK"%>
<script>
var promptGlobal;
layui.use('layer', function(){ //�������layer����ִ����һ��
	  var $ = layui.jquery, layer = layui.layer; //�������layer����ִ����һ��
	  
	  //�����¼�
	  var active = {
	    setTop: function(){
	      var that = this; 
	      //�ര��ģʽ������ö�
	      layer.open({
	        type: 2 //�˴���iframe����
	        ,title: '����ѡ��ô���ʱ�����������'
	        ,area: ['390px', '260px']
	        ,shade: 0
	        ,maxmin: true
	        ,offset: [ //Ϊ����ʾ���������
	          Math.random()*($(window).height()-300)
	          ,Math.random()*($(window).width()-390)
	        ] 
	        ,content: '//layer.layui.com/test/settop.html'
	        ,btn: ['��������', 'ȫ���ر�'] //ֻ��Ϊ����ʾ
	        ,yes: function(){
	          $(that).click(); 
	        }
	        ,btn2: function(){
	          layer.closeAll();
	        }
	        
	        ,zIndex: layer.zIndex //�ص�1
	        ,success: function(layero){
	          layer.setTop(layero); //�ص�2
	        }
	      });
	    }
	    ,confirmTrans: function(){
	      //����һ��͸����ѯ�ʿ�
	      layer.msg('�󲿷ֲ������ǿ��Թ��õ�<br>������䣬չʾ��һ���ķ��', {
	        time: 20000, //20s���Զ��ر�
	        btn: ['������', '֪����', 'Ŷ']
	      });
	    }
	    ,notice: function(){
	      //ʾ��һ�������
	      layer.open({
	        type: 1
	        ,title: false //����ʾ������
	        ,closeBtn: false
	        ,area: '300px;'
	        ,shade: 0.8
	        ,id: 'LAY_layuipro' //�趨һ��id����ֹ�ظ�����
	        ,btn: ['����Χ��', '���ܾ̾�']
	        ,btnAlign: 'c'
	        ,moveType: 1 //��קģʽ��0����1
	        ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">��֪�����ף�<br>layer �� layui<br><br>layerֻ����ΪLayui��һ������ģ�飬�������û������ϴ����Գ�����������Ϊlayui��layerui<br><br>layer��Ȼ�ѱ� Layui �ձ�Ϊ���õĵ���ģ�飬����Ȼ����Ϊһ���������ȫ��ά����������<br><br>���Ǵ˺����;���ǳ��� ^_^</div>'
	        ,success: function(layero){
	          var btn = layero.find('.layui-layer-btn');
	          btn.find('.layui-layer-btn0').attr({
	            href: 'http://www.layui.com/'
	            ,target: '_blank'
	          });
	        }
	      });
	    }
	    ,offset: function(txt){
	      var type = "auto"
	      ,text = txt;
	      
	      layer.open({
	        type: 1
	        ,offset: type //�������òο���http://www.layui.com/doc/modules/layer.html#offset
	        ,id: 'layerDemo'+type //��ֹ�ظ�����
	        ,content: '<div style="padding: 20px 100px;">'+ text +'</div>'
	        ,btn: '�ر�'
	        ,btnAlign: 'c' //��ť����
	        ,shade: 0 //����ʾ����
	        ,yes: function(){
	          layer.closeAll();
	        }
	      });
	    }
	  };
	  
	  promptGlobal=function (txt){
	    var method ='offset';
	    active[method] ? active[method].call(this, txt) : '';
	  }
	});
</script>