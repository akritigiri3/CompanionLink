package com.companionlink.model;
import java.time.LocalDateTime;
public class SafetyReport {
 private int id,seniorId; private Integer volunteerId; private String seniorName,volunteerName,description,status,adminNotes; private LocalDateTime createdAt;
 public int getId(){return id;} public void setId(int v){id=v;} public int getSeniorId(){return seniorId;} public void setSeniorId(int v){seniorId=v;}
 public String getSeniorName(){return seniorName;} public void setSeniorName(String v){seniorName=v;} public Integer getVolunteerId(){return volunteerId;} public void setVolunteerId(Integer v){volunteerId=v;}
 public String getVolunteerName(){return volunteerName;} public void setVolunteerName(String v){volunteerName=v;} public String getDescription(){return description;} public void setDescription(String v){description=v;}
 public String getStatus(){return status;} public void setStatus(String v){status=v;} public String getAdminNotes(){return adminNotes;} public void setAdminNotes(String v){adminNotes=v;} public LocalDateTime getCreatedAt(){return createdAt;} public void setCreatedAt(LocalDateTime v){createdAt=v;}
}
