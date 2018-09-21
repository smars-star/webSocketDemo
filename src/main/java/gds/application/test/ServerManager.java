package gds.application.test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

public class ServerManager {

	private static Collection<WebSocketTest> servers = Collections
			.synchronizedCollection(new ArrayList<WebSocketTest>());

	public static void broadCast(String msg) {
		for (WebSocketTest WebSocketTest : servers) {
			try {
				WebSocketTest.sendMessage(msg);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public static int getTotal() {
		return servers.size();
	}

	public static void add(WebSocketTest server) {
		System.out.println("有新连接加入！ 当前总连接数是：" + servers.size());
		servers.add(server);
	}

	public static void remove(WebSocketTest server) {
		System.out.println("有连接退出！ 当前总连接数是：" + servers.size());
		servers.remove(server);
	}
}
