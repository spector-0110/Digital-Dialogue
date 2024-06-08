package com.blog.helper;

import java.util.Properties;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class EmailSender {

	public static boolean getEmailSender(String to, String from, String subject, String text) {

		boolean flag = false;

		// logic

		// smtp properties

		Properties properties = new Properties();
		properties.put("mail.smtp.auth", true);
		properties.put("mail.smtp.starttls.enable", true);
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.host", "smtp.gmail.com");

		// session from
		// String username = "spectorcodes@gmail.com";
		String password = "hdiw jggi lnhb albg";

		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setFrom(new InternetAddress(from));
			message.setSubject(subject);
			message.setText(text);
			Transport.send(message);
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;

	}

}
