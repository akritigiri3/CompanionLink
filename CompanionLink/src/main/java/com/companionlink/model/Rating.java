package com.companionlink.model;
public class Rating {
 private int id,visitId,seniorId,volunteerId,stars; private String comment;
 public int getId(){return id;} public void setId(int v){id=v;} public int getVisitId(){return visitId;} public void setVisitId(int v){visitId=v;}
 public int getSeniorId(){return seniorId;} public void setSeniorId(int v){seniorId=v;} public int getVolunteerId(){return volunteerId;} public void setVolunteerId(int v){volunteerId=v;}
 public int getStars(){return stars;} public void setStars(int v){stars=v;} public String getComment(){return comment;} public void setComment(String v){comment=v;}
}
