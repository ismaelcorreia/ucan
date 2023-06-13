/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet; 
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import messages.JMSSender;

/**
 *
 * @author ismaeldev
 */
@WebServlet("/Sender")
public class SenderServlet extends HttpServlet { 
    
    @Inject
    JMSSender jmsSender; 
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  
            String messageText = request.getParameter("message");
            jmsSender.sendMessage(messageText); 
    }
    
    @Override 
    public void init() throws ServletException {
        jmsSender = new JMSSender();
    }
}
