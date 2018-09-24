package com.exam.mailCalendarChat.model;

import java.sql.Blob;

public class CMBeanForShow {

	private String linkURL;
	private String title;
	private String base64image;
	
	public String getLinkURL() {
		return linkURL;
	}
	public void setLinkURL(String linkURL) {
		this.linkURL = linkURL;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBase64image() {
		return base64image;
	}
	public void setBase64image(String base64image) {
		this.base64image = base64image;
	}
	
	
}
