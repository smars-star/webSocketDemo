<!DOCTYPE html>
<%@ page language="java" pageEncoding="UTF-8"%>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>页面标题</title>

  </head>
  <body>

    <div class="main">
      <h1>欢迎使用WebSocket</h1>
		<p>
	      <input id="text" type="text"/>
	      <button onclick="send()">发送消息</button>
	      <hr/>
	      <button onclick="closeWebSocket()">关闭WebSocket连接</button>
	      <hr/>
	      <div id="message"></div>
		  <script type="text/javascript">
			var websocket = null;
		    //判断当前浏览器是否支持WebSocket
		    if ('WebSocket' in window) {
		        websocket = new WebSocket("ws://localhost:8080/websocket");
		    }else {
		        alert('当前浏览器 Not support websocket');
		    }

		    //连接发生错误的回调方法
		    websocket.onerror = function () {
		        setMessageInnerHTML("WebSocket连接发生错误");
		    };

		    //连接成功建立的回调方法
		    websocket.onopen = function () {
		        setMessageInnerHTML("WebSocket连接成功");
		    }

		    //接收到消息的回调方法
		    websocket.onmessage = function (event) {
		        setMessageInnerHTML(event.data);
		    }

		    //连接关闭的回调方法
		    websocket.onclose = function () {
		        setMessageInnerHTML("WebSocket连接关闭");
		    }

		    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
		    window.onbeforeunload = function () {
		        closeWebSocket();
		    }

		    //将消息显示在网页上
		    function setMessageInnerHTML(innerHTML) {
		        document.getElementById('message').innerHTML = innerHTML + '<br/>';
		    }

		    //关闭WebSocket连接
		    function closeWebSocket() {
		        websocket.close();
		    }

		    //发送消息
		    function send() {
		        var message = document.getElementById('text').value;
		        websocket.send(message);
		    }
		  </script>
		</p>
	</div>
    
    
  </body>
</html>