package birra.modelo.utiles;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import birra.modelo.utiles.Mail;

public class Mailer {

	/**
	 * @param destinatarios
	 * @param asunto
	 * @param texto
	 * @throws MessagingException
	 */
	public static void enviarMensaje (Mail mail) {
		
		try	{
			
			String smtp = Constantes.smtp;
			
			//Get system properties
			Properties props = System.getProperties();
			
			//Setup mail server
			props.put("mail.smtp.host", smtp);
			
			//Get session
			Session session = Session.getDefaultInstance(props, null);

			//creo el mensaje
			Message msg = new MimeMessage(session);

			msg.setFrom(new InternetAddress(mail.getRemitente()));			

			//seteo los destinatarios
			InternetAddress[] to = new InternetAddress[mail.getDestinatarios().size()]; 
			for (int i = 0; i < mail.getDestinatarios().size(); i++){
				to[i] = new InternetAddress(mail.getDestinatarios().get(i));
			}
			msg.setRecipients(Message.RecipientType.TO, to);

			msg.setSubject(mail.getAsunto());
			msg.setText(mail.getMensaje());
			msg.setSentDate(new Date());

			Transport.send(msg);
			
		} catch (AddressException e) {
			e.printStackTrace();
			
		} catch (MessagingException e) {			
			e.printStackTrace();
		} 
	}
	
	public static void enviarMensajeHTML(Mail mail) throws MessagingException{
        
        String host = "smtp.inti.gob.ar";
        String from = mail.getRemitente();
        //String to = "nlemme@inti.gob.ar";
        String to = mail.getDestinatarios().get(0);
        //Get system properties
          Properties properties = System.getProperties();
        
          // Setup mail server
          properties.setProperty("mail.smtp.host", host);
        
          // Get the default Session object.
          Session s = Session.getDefaultInstance(properties);
          
          MimeMessage message = new MimeMessage(s);
          
          message.setFrom(new InternetAddress(from));
          message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
          message.setSubject(mail.getAsunto(),"utf-8");
        
         
          MimeBodyPart textPart = new MimeBodyPart();
          String mensaje = mail.getMensaje();
          
          textPart.setContent(mensaje,"text/html; charset=utf-8");
          
          Multipart multipart = new MimeMultipart("mixed");
          
          /*URL location = MailerAdjuntos.class.getProtectionDomain().getCodeSource().getLocation();
    
    
	      String path = location.getFile().substring(1,location.getFile().indexOf("/"+Constantes.proyecto));
	      path=path.replace("%20", " ");  
	      
          String filename = path+"/adjuntos/"+Constantes.proyecto+"/"+mail.getAdjunto();
          List<String> attachList = Arrays.asList(filename);         
          
          
          if (mail.getAdjunto()!=null){
                for (String str : attachList) {  
                         MimeBodyPart messageBodyPart = new MimeBodyPart();               
                         DataSource source = new FileDataSource(str);
                         messageBodyPart.setDataHandler(new DataHandler(source));
                         messageBodyPart.setFileName(source.getName());
                         multipart.addBodyPart(messageBodyPart);
                }
          }*/
    
          multipart.addBodyPart(textPart);       
                   
          message.setContent(multipart);                       
                           
          Transport.send(message);    
        
	} 

}