/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ucan.edu.sdpi.postamq.connections;

/**
 *
 * @author ismaeldev
 */
public class ConnectionEnv {
    
    public static final String TOPIC_MESSAGE = "post"; //write here your topic by it servlet
    public static final String PROTOCOL = "tcp";
    public static final String HOST = "localhost"; // your address
    public static final String PORT = "61616";
    public static final String URL = PROTOCOL+"://"+HOST+":"+PORT;
    public static final String INITIAL_CONTEXT = "org.apache.activemq.jndi.ActiveMQInitialContextFactory";
    public static final String TOPIC = "topico";
}
