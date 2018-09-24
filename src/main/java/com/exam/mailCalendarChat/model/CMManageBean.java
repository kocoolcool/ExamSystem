package com.exam.mailCalendarChat.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="CMManage")
public class CMManageBean implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String imageName;
	private Blob image;
	private String linkURL;
	private String title;
	private String description;
	private int sortNumber;
	
	
	@Transient
	private MultipartFile  uploadImage;
	
	public MultipartFile getUploadImage() {
		return uploadImage;
	}
	public void setUploadImage(MultipartFile uploadImage) {
		this.uploadImage = uploadImage;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getSortNumber() {
		return sortNumber;
	}
	public void setSortNumber(int sortNumber) {
		this.sortNumber = sortNumber;
	}
	

}
