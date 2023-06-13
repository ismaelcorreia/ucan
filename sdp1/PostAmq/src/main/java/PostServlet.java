/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage; 
import java.io.IOException;
import java.io.PrintWriter; 
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ucan.edu.sdpi.postamq.connections.ActiveMQConnection;
import ucan.edu.sdpi.postamq.connections.ConnectionEnv;

/**
 *
 * @author ismaeldev
 */
public class PostServlet extends HttpServlet  implements MessageListener{
    
    private HttpServletResponse globalResponse;
    private ActiveMQConnection mqConnection;
    private List<String> receivedMessages;
    
    @Override
    public void init() throws ServletException { 
        try { 
            receivedMessages = new ArrayList<>();
            mqConnection = new ActiveMQConnection(ConnectionEnv.TOPIC, ConnectionEnv.URL);
            var session = mqConnection.getSession();
            var topic = mqConnection.getTopic();
            var subscriber = session.createSubscriber(topic);
            subscriber.setMessageListener(this);   
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
        }
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("room.jsp");
        this.globalResponse = response;
        globalResponse.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>CHAT</title>");            
            out.println("</head>");
            out.println("<body>");
            if (receivedMessages.size()==0){
                out.println("<h1>SEM MENSAGENS NOVAS</h1>");
            }else {
                out.println("<ul>");
                for(String message: receivedMessages) {
                    out.println("<li>"+message+"</li>");
                }
                out.println("</ul>");
            }
            out.println("</body>");
            out.println("</html>");
        }
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    
    @Override
    public void onMessage(Message message) {
        try {
            if (message instanceof TextMessage) {
                TextMessage textMessage = (TextMessage) message;
                var msg = textMessage.getText();
                System.out.println("Mensagem recebida: " +msg); 
                receivedMessages.add(msg);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
