package com.companionlink.model;
import java.time.LocalDateTime;
public class CompanionRequest {
 private int id,seniorId,activityTypeId; private String seniorName,activityName,locationArea,notes,status; private LocalDateTime preferredDateTime,createdAt;
 public int getId(){return id;} public void setId(int v){id=v;} public int getSeniorId(){return seniorId;} public void setSeniorId(int v){seniorId=v;}
 public String getSeniorName(){return seniorName;} public void setSeniorName(String v){seniorName=v;} public int getActivityTypeId(){return activityTypeId;} public void setActivityTypeId(int v){activityTypeId=v;}
 public String getActivityName(){return activityName;} public void setActivityName(String v){activityName=v;} public LocalDateTime getPreferredDateTime(){return preferredDateTime;} public void setPreferredDateTime(LocalDateTime v){preferredDateTime=v;}
 public String getLocationArea(){return locationArea;} public void setLocationArea(String v){locationArea=v;} public String getNotes(){return notes;} public void setNotes(String v){notes=v;}
 public String getStatus(){return status;} public void setStatus(String v){status=v;} public LocalDateTime getCreatedAt(){return createdAt;} public void setCreatedAt(LocalDateTime v){createdAt=v;}
}
