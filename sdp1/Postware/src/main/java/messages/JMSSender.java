/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package messages;

import jakarta.annotation.Resource;
import jakarta.inject.Inject;
import jakarta.jms.JMSContext;
import jakarta.jms.JMSProducer;
import jakarta.jms.Message;
import jakarta.jms.Queue;

/**
 *
 * @author ismaeldev
 */
public class JMSSender {
    
    @Inject
    private JMSContext context;
    
    
    @Resource(lookup = "java:jboss/exported/jms/Post")
    private Queue queue;

    public void sendMessage(String messageText) {
        Message message = context.createTextMessage(messageText); // Tratar exceção
        JMSProducer producer = context.createProducer();
        producer.send(queue, message);
    }
}
