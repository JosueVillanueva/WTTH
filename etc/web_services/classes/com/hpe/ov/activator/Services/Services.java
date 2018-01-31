package com.hpe.ov.activator.Services;

import com.hp.ov.activator.mwfm.WFAuthenticator;
import com.hp.ov.activator.mwfm.WFManager;
import com.hp.ov.activator.mwfm.component.WFConfigException;
import com.hp.ov.activator.mwfm.component.WFException;
import com.hp.ov.activator.mwfm.engine.module.AuthException;

import java.io.File;
import java.io.IOException;

import java.net.MalformedURLException;

import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;

import java.security.Principal;

import java.util.*;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

import javax.servlet.http.HttpServletRequest;

import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;


/**
 *
 *
 * Generated Web service class
 * @author Code generated using HPSA WebServiceDesigner
 *         Hewlett-Packard Company<br>
 *         (c) Copyright 2007 Hewlett-Packard Development Company, L.P.
 */

@WebService(name = "Services")
@SOAPBinding(style = SOAPBinding.Style.RPC)
public class Services {
    private static long fileId = System.currentTimeMillis();
    private static Properties props = new Properties();
    public static final String JBOSSWS_CONFIG_FILE = "jbossws_config.properties";

    /**
     * Loading properties from JBOSSWS_CONFIG_FILE into props.
     */
    private static void getProperties() {
        java.io.FileInputStream istream = null;

        try {
            String f = System.getProperty("activator.dir.config");

            if (f == null) {
                throw new Exception(
                    "Unable to get system property activator.dir.config");
            }

            System.out.println("Reading properties from " +
                JBOSSWS_CONFIG_FILE);
            istream = new java.io.FileInputStream(new File(System.getProperty(
                            "activator.dir.config") + "/" +
                        JBOSSWS_CONFIG_FILE));
            props.load(istream);

            String[] proplist = props.keySet().toArray(new String[0]);

            for (int i = 0; i < proplist.length; i++) {
                System.out.println(proplist[i] + " = " +
                    props.getProperty(proplist[i]));
            }
        } catch (Exception exp) {
            exp.printStackTrace();
        } finally {
            if (istream != null) {
                try {
                    istream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private static String getProperty(String property) {
        if (props.isEmpty()) {
            getProperties();
        }

        return props.getProperty(property);
    }

    /**
       * WebServices to receive the XML file
       *
       * @param xml_message : xml_message with information about services to be processed.
       *
       * @return HashMapWrap contains the case packet where the keys are the variable names and the values are the variable values.
       *         Available keys:
       *           TransactionId: .
       *           ErrorCode: .
       *           Description: .
           */

    @WebMethod
    @WebResult(name = "ReturnTypeActivateServices")
    public ReturnTypeActivateServices activateServices( @WebParam(name = "userName") String userName, @WebParam(name = "password") String password ,  
        
    @WebParam(name = "xml_message") 
    String xml_message)
        throws RemoteException, AuthException, WFException, WFConfigException, 
            MalformedURLException, NotBoundException {
        WFManager wfm = connect(userName, password);

        if (wfm == null) {
            throw new AuthException(
                "Authentication failure. Invalid credentials specified.");
        }

        HashMap<String, Object> casePacket = new HashMap<String, Object>();
        String paramValxml_message = xml_message;

        casePacket.put("xml_message", paramValxml_message);

        HashMap tempMap = wfm.startAndWaitForJob("WTTH_CONTROLLER", casePacket);
        ReturnTypeActivateServices bean = new ReturnTypeActivateServices();
        String nameTransactionId = "JOB_ID";
        bean.setTransactionId((Long) tempMap.get(nameTransactionId));

        String nameErrorCode = "wtth_result_code";
        bean.setErrorCode((Long) tempMap.get(nameErrorCode));

        String nameDescription = "wtth_result_desc";
        bean.setDescription((String) tempMap.get(nameDescription));

        return bean;
    }

    /**
       *
       *
       * @param xml_message : .
       *
       * @return HashMapWrap contains the case packet where the keys are the variable names and the values are the variable values.
       *         Available keys:
       *           xml_outputmessage: .
           */

    @WebMethod
    @WebResult(name = "ReturnTypeViewServices")
    public ReturnTypeViewServices viewServices( @WebParam(name = "userName") String userName, @WebParam(name = "password") String password ,  
        
    @WebParam(name = "xml_message") 
    String xml_message)
        throws RemoteException, AuthException, WFException, WFConfigException, 
            MalformedURLException, NotBoundException {
        WFManager wfm = connect(userName, password);

        if (wfm == null) {
            throw new AuthException(
                "Authentication failure. Invalid credentials specified.");
        }

        HashMap<String, Object> casePacket = new HashMap<String, Object>();
        String paramValxml_message = xml_message;

        casePacket.put("xml_message", paramValxml_message);

        HashMap tempMap = wfm.startAndWaitForJob("WTTH_CONTROLLER", casePacket);
        ReturnTypeViewServices bean = new ReturnTypeViewServices();
        String nameXml_outputmessage = "wtth_result_code";
        bean.setXml_outputmessage((String) tempMap.get(nameXml_outputmessage));

        return bean;
    }

    /**
     * This method is used if the user name and password have been supplied
     * as part of the method. It connects with the mwfm and authenticates the user.
     *
     * @param userId
     *          The name of the user who must be authenticated
     * @param password
     *          The password of the user who must be authenticated
     * @return WFManager The obtained instance of the WFManager once the user has been authenticated
     * @throws RemoteException
     * @throws NotBoundException
     * @throws AuthException
     *           if user is not authenticated in the mwfm
     * @throws MalformedURLException
     */
    private static WFManager connect(String userId, String password)
        throws RemoteException, AuthException, MalformedURLException, 
            NotBoundException {
        String dest = getProperty("mwfm_url");
        WFAuthenticator wfAuth = null;
        wfAuth = (WFAuthenticator) Naming.lookup(dest);

        WFManager wfm = wfAuth.login(userId, password);

        if (wfm == null) {
            throw new AuthException("Username and/or password is not valid");
        }

        return wfm;
    }

    /**
     * Converts a HashMap<String, Object> to a HashMap<String, String>.
     * Complex objects contained as values like HashMap, Arrays, etc.
     * will be lost since the conversion from Object to String will not
     * be the Object serialization but an invocation of the toString()
     * method. The reason for not serializing the Object is that the
     * values inserted in the HashMap should be deserialized including
     * simple types. If a complex type must be returned as result of
     * the web service method, then use the "Bean" value for the
     * "returnType" attribute in the WebServiceDesigner.
     */
    private HashMapWrap getHashMapWrapFromResult(HashMap<String, Object> finalmap) {
        HashMapWrap result = new HashMapWrap();
        HashMap<String, String> newmap = new HashMap<String, String>();
        String[] keys = finalmap.keySet().toArray(new String[0]);

        for (int i = 0; i < keys.length; i++) {
            String key = new String(keys[i]);
            newmap.put(key,
                (finalmap.get(key) == null) ? null : ("" + finalmap.get(key)));
        }

        result.setMap(newmap);

        return result;
    }
}
