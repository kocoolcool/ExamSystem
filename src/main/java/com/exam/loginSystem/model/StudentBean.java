package com.exam.loginSystem.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlTransient;

import org.springframework.web.multipart.MultipartFile;

/*學生表格的欄位
studentId	 學生ID為流水號
class	     EEITXXX:資策會學生
Normal       一般考生
NormalOld    一般考完試的學生
studentName  姓名
gender	            性別
address	            地址
phone	           電話號碼
email	    E-Mail
birthday	生日日期
education	學歷
photo	          大頭照
photoName	大頭照檔案名稱
Score	         考試分數========================>db內沒這一欄??
salary	                    工作要求薪資
startWorkDate	 開始工作日
classId	                     判斷學生身分,初始與Class相同"
whichIdentity	0:學生  1為考生
encryptURL 	           個人加密網址

*/

@Entity
@Table(name= "Student")
public class StudentBean {
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private Integer studentId;
   @Column(name= "class")
	private String thisIsClass;
	private String studentName;
	private String gender;
	private String address;
	private String phone;
	private String email;
	private Date birthday;
	private String education;
	private Blob photo;
	private String photoName;
	//private Integer Score;  //究竟是否有Score欄位??資料庫建置時沒看到欄位的問題
	private Integer salary;
	private Date startWorkDate;
	//private String classId;  學生表格和班級表格是多對一關係  @ManyToOne 我的FK是classID(同時是班級表格的PK)
	                                                //@Transient
	private Integer whichIdentity;
	private String encryptURL;
	private Integer score;
//   @ManyToOne  //開啟a部分
//   @JoinColumn(name="classId")//原本的private String classID  問題:必須和ClassBean.java裡面之classID一致
//	private ClassBean classbean;
//	
//	
//	@Transient//開啟b部分(a和b要一起開啟)
	private String classId;
	
	
	
	//為了上傳照片檔需新增以下程碼  p365
	@Transient//表示Bean在mapping(對應)資料庫時知道資料庫裡沒有這一行(省略之)
	@XmlTransient
	private MultipartFile  studentImage;//
	
	
	public MultipartFile getStudentImage() {
		return studentImage;
	}
	
	public void setStudentImage(MultipartFile studentImage) {
		this.studentImage = studentImage;
	}
	//為了上傳照片檔需新增以上程碼
	
	
	public StudentBean() {//無參數之建構元
		
	}
	
	
	//有參數之建構元(預防未來可能用到)
	public StudentBean(Integer studentId, String thisIsClass, String studentName, String gender, String address,
			String phone, String email, Date birthday, String education, Blob photo, String photoName, Integer score,
			Integer salary, Date startWorkDate, String classId, Integer whichIdentity, String encryptURL) {
		super();
		this.studentId = studentId;
		this.thisIsClass = thisIsClass;
		this.studentName = studentName;
		this.gender = gender;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.birthday = birthday;
		this.education = education;
		this.photo = photo;
		this.photoName = photoName;
		this.score = score;
		this.salary = salary;
		this.startWorkDate = startWorkDate;
		this.classId = classId;
		this.whichIdentity = whichIdentity;
		this.encryptURL = encryptURL;
	}
	
	
	//除錯方便用  ->會把資料都顯示出來
	@Override
	public String toString() {/*  若有Score=" + Score + ", 放於photoName之後*/
		return "StudentBean [studentId=" + studentId + ", thisIsClass=" + thisIsClass + ", studentName=" + studentName
				+ ", gender=" + gender + ", address=" + address + ", phone=" + phone 
				+ ", email=" + email + ", birthday=" + birthday + ", education=" + education 
				+ ", photo=" + photo + ", photoName=" + photoName + "Score=" + score 
				+ ", salary=" + salary + ", startWorkDate=" + startWorkDate + ", classId=" + classId 
				+ ", whichIdentity=" + whichIdentity + ", encryptURL=" + encryptURL + "]";
	}//
	
	
	//get和set方式
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public String getThisIsClass() {
		return thisIsClass;
	}
	public void setThisIsClass(String thisIsClass) {
		this.thisIsClass = thisIsClass;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public Blob getPhoto() {
		return photo;
	}
	public void setPhoto(Blob photo) {
		this.photo = photo;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public Integer getSalary() {
		return salary;
	}
	public void setSalary(Integer salary) {
		this.salary = salary;
	}
	public Date getStartWorkDate() {
		return startWorkDate;
	}
	public void setStartWorkDate(Date startWorkDate) {
		this.startWorkDate = startWorkDate;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public Integer getWhichIdentity() {
		return whichIdentity;
	}
	public void setWhichIdentity(Integer whichIdentity) {
		this.whichIdentity = whichIdentity;
	}
	public String getEncryptURL() {
		return encryptURL;
	}
	public void setEncryptURL(String encryptURL) {
		this.encryptURL = encryptURL;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	} 


	
}
