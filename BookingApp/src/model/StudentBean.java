package model;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StudentBean {
	
	private String Name, Email, Campus, School, AdvisorType, Week, WeekDay, Batch;
	private int StudentId;
	private long Phone;
	private String Title;
	
	//have a constructor with no arguments
	public StudentBean() {
		super();
	}

	public int getStudentId() {
		return StudentId;
	}

	public void setStudentId(int studentId) {//studentId is the key, why?
		StudentId = studentId;
	}
	
	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getCampus() {
		return Campus;
	}

	public void setCampus(String campus) {
		Campus = campus;
	}

	public String getSchool() {
		return School;
	}

	public void setSchool(String school) {
		School = school;
	}

	public String getAdvisorType() {
		return AdvisorType;
	}

	public void setAdvisorType(String advisorType) {
		AdvisorType = advisorType;
	}

	public String getWeek() {
		return Week;
	}

	public void setWeek(String week) {
		Week = week;
	}

	public String getWeekDay() {
		return WeekDay;
	}

	public void setWeekDay(String weekDay) {
		WeekDay = weekDay;
	}

	public String getBatch() {
		return Batch;
	}

	public void setBatch(String batch) {
		Batch = batch;
	}

	public long getPhone() {
		return Phone;
	}

	public void setPhone(long phone) {
		Phone = phone;
	}
	
	//validate the input data
	public boolean validate(){
			
		if((Integer.toString(StudentId).isEmpty())||Name.isEmpty()||(Long.toString(Phone)).isEmpty()||Email.isEmpty()||AdvisorType.isEmpty()||
				Batch.isEmpty()||School.isEmpty()||Campus.isEmpty()||Week.isEmpty()||WeekDay.isEmpty()){
			//System.out.println("debug b1");
			return false;
		}
				//System.out.println("debug b2");		
		if(!isValidEmailAddress(Email)){
			return false;


		}
		//System.out.println("debug b2");
		if(!isValidPhoneNumber(Phone)){
			return false;
		}
		//System.out.println("debug b2");
		return true;
	}
		
	public boolean isValidEmailAddress(String email) {
	                
	    Pattern p =Pattern.compile("[a-zA-Z0-9_.]*@[a-zA-Z]*.[a-zA-Z]*");
	    Matcher m = p.matcher(email);
	       
	    return m.matches();
	 }
		
	public static boolean isValidPhoneNumber(long phone){
			
		String regexStr = "^(1\\-)?[0-9]{3}\\-?[0-9]{3}\\-?[0-9]{4}$"; 
		String strPhone = String.valueOf(phone);
			
		if (strPhone.matches(regexStr)){
			return true;
		}else{
			return false;
		}
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}
}
