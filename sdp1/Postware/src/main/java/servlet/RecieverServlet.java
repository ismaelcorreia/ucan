/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import jakarta.annotation.Resource;
import jakarta.inject.Inject;
import jakarta.jms.ConnectionFactory;
import jakarta.jms.JMSConsumer;
import jakarta.jms.JMSContext;
import jakarta.jms.JMSException;
import jakarta.jms.Message;
import jakarta.jms.MessageConsumer;
import jakarta.jms.MessageListener;
import jakarta.jms.Queue;
import jakarta.jms.Session;
import jakarta.jms.TextMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet; 
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author ismaeldev
 */

public class RecieverServlet extends HttpServlet implements MessageListener {

    
    @Inject
    private JMSContext context;

    
    @Resource(lookup = "java:jboss/exported/jms/Post")
    private Queue queue;

    private JMSConsumer consumer;
    
    List<String> messagesRecieved;

    @Override
    public void init() throws ServletException {
        messagesRecieved = new ArrayList<>();
        consumer = context.createConsumer(queue);
        consumer.setMessageListener(this);
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            if (messagesRecieved.size()<0) 
            {
                out.println("<h1>NÃO HÁ MENSAGENS RECEBIDAS</h1>");
            }
            else 
            {
                out.println("<h1>MENSAGENS RECEBIDAS ("+messagesRecieved.size() +")</h1>");
                
                out.println("<ul>");
                
                for (String message: messagesRecieved) {
                    out.println("<li>"+message+"</li>");
                }
                out.println("</ul>");
            }
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    @Override
    public void onMessage(Message message) {
        try {
            
            // Processar a mensagem recebida
            if (message instanceof TextMessage) {
                String text = ((TextMessage) message).getText();
                messagesRecieved.add(text);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void destroy() {
        if (consumer != null) {
            consumer.close();
        }
    }
}