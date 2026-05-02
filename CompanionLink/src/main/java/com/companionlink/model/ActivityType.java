package com.companionlink.model;
public class ActivityType {
 private int id; private String name,description; private boolean active;
 public int getId(){return id;} public void setId(int id){this.id=id;}
 public String getName(){return name;} public void setName(String v){name=v;}
 public String getDescription(){return description;} public void setDescription(String v){description=v;}
 public boolean isActive(){return active;} public void setActive(boolean v){active=v;}
}
