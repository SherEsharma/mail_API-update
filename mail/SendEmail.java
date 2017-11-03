package test;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
public class SendEmail {
	public static boolean send(final String from, final String password, String to, String sub, String msg) {
		// Get properties object
		System.out.println("Shubham Sharma");
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
		// get Session
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});
		
		try {
			System.out.println("try sent successfully");
			MimeMessage message = new MimeMessage(session);
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(sub);
			message.setText(msg);
			// send message
			Transport.send(message);
			System.out.println("message sent successfully");
			return true ;
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}


	/*public static void main(String[] args) {
		// from,password,to,subject,message
		String Rec_id="supriyagoswami17@gmail.com";
		String Subject="Mail varification";
		String trabaajo_id="jobsforshubham1@gmail.com";
		String trabaajo_password="Shubham@123";
		String name="supriya";
		String test="Hello "+name +"Click here for varification Trabaajo";
		SendEmail .send(trabaajo_id,trabaajo_password, Rec_id, Subject, test);
		// change from, password and to
	}*/
	
}