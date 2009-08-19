package com.alex;
import java.net.Authenticator;
import java.net.PasswordAuthentication;

public class SmtpAuthenticator extends Authenticator {
	private String username;
	private char[] password;

	public SmtpAuthenticator(String username, char[] password) {
		super();
		this.username = username;
		this.password = password;
	}

	public PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(username, password);
	}
}