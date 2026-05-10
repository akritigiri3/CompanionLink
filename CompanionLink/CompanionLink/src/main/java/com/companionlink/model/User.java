package com.companionlink.model;
import java.time.LocalDate;
import java.time.LocalDateTime;
public class User {
  private int id; private String fullName,email,phone,passwordHash,role,status,address,healthNotes,emergencyContact,bio,skills,availability; private LocalDate dateOfBirth; private double averageRating; private LocalDateTime createdAt;
  public int getId(){return id;} public void setId(int id){this.id=id;}
  public String getFullName(){return fullName;} public void setFullName(String v){fullName=v;}
  public String getEmail(){return email;} public void setEmail(String v){email=v;}
  public String getPhone(){return phone;} public void setPhone(String v){phone=v;}
  public LocalDate getDateOfBirth(){return dateOfBirth;} public void setDateOfBirth(LocalDate v){dateOfBirth=v;}
  public String getPasswordHash(){return passwordHash;} public void setPasswordHash(String v){passwordHash=v;}
  public String getRole(){return role;} public void setRole(String v){role=v;}
  public String getStatus(){return status;} public void setStatus(String v){status=v;}
  public String getAddress(){return address;} public void setAddress(String v){address=v;}
  public String getHealthNotes(){return healthNotes;} public void setHealthNotes(String v){healthNotes=v;}
  public String getEmergencyContact(){return emergencyContact;} public void setEmergencyContact(String v){emergencyContact=v;}
  public String getBio(){return bio;} public void setBio(String v){bio=v;}
  public String getSkills(){return skills;} public void setSkills(String v){skills=v;}
  public String getAvailability(){return availability;} public void setAvailability(String v){availability=v;}
  public double getAverageRating(){return averageRating;} public void setAverageRating(double v){averageRating=v;}
  public LocalDateTime getCreatedAt(){return createdAt;} public void setCreatedAt(LocalDateTime v){createdAt=v;}
  public boolean isAdmin(){return "ADMIN".equalsIgnoreCase(role);} public boolean isSenior(){return "SENIOR".equalsIgnoreCase(role);} public boolean isVolunteer(){return "VOLUNTEER".equalsIgnoreCase(role);} public boolean isActive(){return "ACTIVE".equalsIgnoreCase(status);}
}
