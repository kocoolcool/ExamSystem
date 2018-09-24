package com.exam.google;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;


public class GoogleVerify {
	private String userId;
	private String email;
	private String name;
	private String token;

	public GoogleVerify(String token){
		this.token = token;
	}

	public void googleVerify() throws GeneralSecurityException, IOException {
		
		
		String client_Id = "65257694703-upl97b2f58a3spn0ts8opmtefbkbgnkd.apps.googleusercontent.com";
		String verificationUrl = "accounts.google.com";
		
		JsonFactory jsonFactory = new JacksonFactory();
        HttpTransport transport = new NetHttpTransport();
	
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
			    // Specify the CLIENT_ID of the app that accesses the backend:
			    .setAudience(Collections.singletonList(client_Id))
        	    .build();


			GoogleIdToken idToken = verifier.verify(token);
			if (idToken != null) {
			  Payload payload = idToken.getPayload();//得到一Payload物件

			  // Print user identifier
			  //userId = payload.getSubject();
			  //System.out.println("User ID: " + userId);

			  // Get profile information from payload
			  email = payload.getEmail();//得到email
			  boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
			  //name = (String) payload.get("name");
//			  String pictureUrl = (String) payload.get("picture");
//			  String locale = (String) payload.get("locale");
//			  String familyName = (String) payload.get("family_name");
//			  String givenName = (String) payload.get("given_name");
             
			}
	
	}
	
	public String getUserId() {
		return userId;
	}

	

	public String getEmail() {
		return email;
	}

	

	public String getName() {
		return name;
	}

	
	
	
}
