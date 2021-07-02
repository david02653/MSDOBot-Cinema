package EurekaServer;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.SQLOutput;
import java.util.concurrent.TimeoutException;

import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import org.json.JSONArray;
import org.json.JSONObject;

/*#####################################################
###	2019/10/14										###
###	created by jimting								###
###	for MSABot project, and my graduate paper QAQ	###
#######################################################*/


public class MSABotSender {

	private static final String EXCHANGE_NAME = "eurekaserver";
    
//   	public static boolean send(String mqip, int mqport, String roomID, String appName, String status)
//	{
//   		ConnectionFactory factory = new ConnectionFactory();
//		factory.setHost(mqip);
//		factory.setPort(mqport);
//
//		JSONObject obj = new JSONObject();
//        obj.put("roomID", roomID);
//        obj.put("appName", appName);
//		obj.put("status", status);
//
//		String result = obj.toString();
//
//		try (Connection connection = factory.newConnection();
//	             	Channel channel = connection.createChannel()) {
//	           	channel.exchangeDeclare(EXCHANGE_NAME, "fanout");
//			channel.basicPublish(EXCHANGE_NAME, "", null, result.getBytes("UTF-8"));
//	           	System.out.println(" [x] Sent '" + result + "'");
//			return true;
//	        } catch (IOException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		} catch (TimeoutException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
//		return false;
//	}

	public static boolean send(String mqip, int mqport, String routingKey, String appName, String status){
		ConnectionFactory factory = new ConnectionFactory();
		factory.setHost(mqip);
		factory.setPort(mqport);

		JSONObject obj = new JSONObject();
		obj.put("appName", appName);
		obj.put("status", status);

		String result = obj.toString();

		try(Connection connection = factory.newConnection(); Channel channel = connection.createChannel()){
			channel.exchangeDeclare(EXCHANGE_NAME, "topic", true);
			channel.basicPublish(EXCHANGE_NAME, routingKey, null, result.getBytes(StandardCharsets.UTF_8));
			System.out.println(" [x] Sent '" + result + "'");
			return true;
		}catch (IOException | TimeoutException ioe){
			ioe.printStackTrace();
		}
		return false;
	}

}


