/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ucan.edu.sdpi.postamq.connections;
 
import javax.jms.TextMessage;
import javax.jms.Topic;
import javax.jms.TopicConnection;
import javax.jms.TopicConnectionFactory;
import javax.jms.TopicPublisher;
import javax.jms.TopicSession; 
import javax.naming.Context;
import javax.naming.InitialContext;
import java.util.Properties; 
import lombok.Getter;

/**
 *
 * @author ismaeldev
 */
public class ActiveMQConnection{
    
    @Getter
    private TopicConnection connection;
    @Getter
    private TopicSession session;
    @Getter
    private Topic topic;
    
    private TopicPublisher publisher;

    public ActiveMQConnection(String topicName, String providerUrl) throws Exception{
         
            var properties = new Properties();
            properties.setProperty(Context.INITIAL_CONTEXT_FACTORY, ConnectionEnv.INITIAL_CONTEXT);
            properties.setProperty(Context.PROVIDER_URL, providerUrl);
            Context context = new InitialContext(properties);
            TopicConnectionFactory factory = (TopicConnectionFactory) context.lookup("ConnectionFactory");
            connection = factory.createTopicConnection();
            session = connection.createTopicSession(false, session.AUTO_ACKNOWLEDGE);
            this.topic = session.createTopic(topicName);
            publisher = session.createPublisher(topic); 
            // Iniciar a conexão JMS
            connection.start(); 
    }

    public void sendMessage(String text) {
        try {
            TextMessage message = session.createTextMessage();
            message.setText(text);
            publisher.publish(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
}
