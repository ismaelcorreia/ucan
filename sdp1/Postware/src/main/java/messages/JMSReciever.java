/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package messages;

import jakarta.annotation.Resource;
import jakarta.inject.Inject;
import jakarta.jms.ConnectionFactory;
import jakarta.jms.JMSConsumer;
import jakarta.jms.JMSContext;
import jakarta.jms.Message;
import jakarta.jms.MessageConsumer;
import jakarta.jms.MessageListener;
import jakarta.jms.Queue;
import jakarta.jms.TextMessage;

/**
 *
 * @author ismaeldev
 */
public class JMSReciever implements MessageListener {
    
    @Inject
    private JMSContext context;
    
    
    @Resource(lookup = "java:jboss/exported/jms/Post")
    private Queue queue;

    
    public void startReceivingMessages() {
        try {
            // Crie um receptor JMS para a fila
            JMSConsumer consumer = context.createConsumer(queue);
            // Defina o receptor como o ouvinte das mensagens
            consumer.setMessageListener(this);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void onMessage(Message message) {
        try {
            // Processar a mensagem recebida
            if (message instanceof TextMessage) {
                String text = ((TextMessage) message).getText();
                System.out.println("Received message: " + text);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
