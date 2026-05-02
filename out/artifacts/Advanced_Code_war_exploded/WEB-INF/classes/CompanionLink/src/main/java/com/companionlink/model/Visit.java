package com.companionlink.model;
import java.time.LocalDateTime;
public class Visit {
 private int id,requestId,seniorId,volunteerId; private String seniorName,volunteerName,activityName,status,volunteerNotes,ratingComment; private LocalDateTime scheduledAt,completedAt; private Integer actualDurationMinutes,ratingStars;
 public int getId(){return id;} public void setId(int v){id=v;} public int getRequestId(){return requestId;} public void setRequestId(int v){requestId=v;}
 public int getSeniorId(){return seniorId;} public void setSeniorId(int v){seniorId=v;} public String getSeniorName(){return seniorName;} public void setSeniorName(String v){seniorName=v;}
 public int getVolunteerId(){return volunteerId;} public void setVolunteerId(int v){volunteerId=v;} public String getVolunteerName(){return volunteerName;} public void setVolunteerName(String v){volunteerName=v;}
 public String getActivityName(){return activityName;} public void setActivityName(String v){activityName=v;} public LocalDateTime getScheduledAt(){return scheduledAt;} public void setScheduledAt(LocalDateTime v){scheduledAt=v;}
 public String getStatus(){return status;} public void setStatus(String v){status=v;} public Integer getActualDurationMinutes(){return actualDurationMinutes;} public void setActualDurationMinutes(Integer v){actualDurationMinutes=v;}
 public String getVolunteerNotes(){return volunteerNotes;} public void setVolunteerNotes(String v){volunteerNotes=v;} public LocalDateTime getCompletedAt(){return completedAt;} public void setCompletedAt(LocalDateTime v){completedAt=v;}
 public Integer getRatingStars(){return ratingStars;} public void setRatingStars(Integer v){ratingStars=v;} public String getRatingComment(){return ratingComment;} public void setRatingComment(String v){ratingComment=v;}
}
