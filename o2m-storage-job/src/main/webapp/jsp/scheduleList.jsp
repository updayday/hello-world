<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/header.jsp"%>
<%@ include file="/inc/resource.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript">
	var win;
	function openWin() {
		win = $.messager.progress({
			title : 'Please waiting',
			msg : 'Loading data...'
		});
	};

	function closeWin() {
		$.messager.progress('close');
	};
	
	
	function pushSPU(){
		 $.messager.progress({
            title: '请稍候',
            msg: '任务调度中...'
        });
		 $.post("${ctx}/schedule/pushSPU",
					function(msg){
						 setTimeout(function() {
                               $.messager.progress('close');
                           }, 100);
						if(msg == "success"){
							$.messager.alert('提示:','任务调度成功!');
						}else{
							$.messager.alert('提示:','任务出现异常!');
						}
					});
	};
	
	
	
	function pushSkU(){
		 $.messager.progress({
            title: '请稍候',
            msg: '任务调度中...'
        });
		 $.post("${ctx}/schedule/pushSkU",
					function(msg){
						 setTimeout(function() {
                               $.messager.progress('close');
                           }, 100);
						if(msg == "success"){
							$.messager.alert('提示:','任务调度成功!');
						}else{
							$.messager.alert('提示:','任务出现异常!');
						}
					});
	};
	

	function pushBackCategories(){
		 $.messager.progress({
           title: '请稍候',
           msg: '任务调度中...'
       });
		 $.post("${ctx}/schedule/pushBackCategories",
					function(msg){
						 setTimeout(function() {
                              $.messager.progress('close');
                          }, 100);
						if(msg == "success"){
							$.messager.alert('提示:','任务调度成功!');
						}else{
							$.messager.alert('提示:','任务出现异常!');
						}
					});
	};
	
	function pushBrand(){
		 $.messager.progress({
           title: '请稍候',
           msg: '任务调度中...'
       	});
		 $.post("${ctx}/schedule/pushBrand",
					function(msg){
						 setTimeout(function() {
                              $.messager.progress('close');
                          }, 100);
						if(msg == "success"){
							$.messager.alert('提示:','任务调度成功!');
						}else{
							$.messager.alert('提示:','任务出现异常!');
						}
					});
	};
	
	function transferUpdownStatusToWD(){
		 $.messager.progress({
          title: '请稍候',
          msg: '任务调度中...'
      	});
		 $.post("${ctx}/schedule/transferUpdownStatusToWD",
					function(msg){
						 setTimeout(function() {
                             $.messager.progress('close');
                         }, 100);
						if(msg == "success"){
							$.messager.alert('提示:','任务调度成功!');
						}else{
							$.messager.alert('提示:','任务出现异常!');
						}
					});
	};
	
	function transferHotSpus(){
		 $.messager.progress({
         title: '请稍候',
         msg: '任务调度中...'
     	});
		 $.post("${ctx}/schedule/transferHotSpus",
					function(msg){
						 setTimeout(function() {
                            $.messager.progress('close');
                        }, 100);
						if(msg == "success"){
							$.messager.alert('提示:','任务调度成功!');
						}else{
							$.messager.alert('提示:','任务出现异常!');
						}
					});
	};
	
</script>
</head>
<body>
<div align="center">
	<table class="easyui-datagrid" style="width:800px;height:250px"  data-options="fitColumns:true, singleSelect:true">   
	    <thead>   
	        <tr  align="center">   
	            <th data-options="field:'code',width:250" align="center">任务名称</th>   
	            <th data-options="field:'price',width:450,align:'center'">立即执行</th>   
	        </tr>   
	    </thead>
	    <tbody align="center">    
	      	 <tr>   
	            <td align="center">SPU信息推送</td><td><input type="button" value="启动" onclick="pushSPU();" width="50px"></td> 
	        </tr>
	        
	        <tr>   
	            <td align="center">SKU信息推送</td><td><input type="button" value="启动" onclick="pushSkU();" width="50px"></td>   
	        </tr> 
	         <tr>   
	            <td align="center">推送后台类目</td><td><input type="button" value="启动" onclick="pushBackCategories();" width="50px"></td>   
	        </tr>
	         <tr>   
	            <td align="center">推送品牌</td><td><input type="button" value="启动" onclick="pushBrand();" width="50px"></td>   
	        </tr>
	        <tr>   
	            <td align="center">上下架状态</td><td><input type="button" value="启动" onclick="transferUpdownStatusToWD();" width="50px"></td>   
	        </tr>
	         <tr>   
	            <td align="center">首页热销商品推送</td><td><input type="button" value="启动" onclick="transferHotSpus();" width="50px"></td>   
	        </tr>
	    </tbody>   
	</table>  
</div>
</body>
</html>
