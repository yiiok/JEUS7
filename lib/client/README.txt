CLIENT LIBRARIES

(1) This directory contains client libraries for standalone/applet clients. The libraries listed alphabetically:

clientcontainer.jar - application client container library specified by the Java EE spec.
jclient.jar - client library including MBean interfaces, javaee.jar and jeusutil.jar
jclient_jaxb.jar - JAXB classes for the client


(2) If you want to use some Java EE services(JMS, web service, and JMX) through the application client, you shall include other libraries(.jar files). Those files are normally in the JEUS_HOME/lib/system(SYSTEM_LIB_DIR).

(2-1) JMS(Java Message Service)
SYSTEM_LIB_DIR/jms.jar

(2-2) Web Service
SYSTEM_LIB_DIR/jeus-ws.jar, activation.jar, mail.jar, webservices-rt.jar

(2-3) JMX(Java Management eXtensions)
SYSTEM_LIB_DIR/jmxremote.jar
