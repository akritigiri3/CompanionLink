package com.companionlink.model;
import java.time.LocalDateTime;
public class ContactEnquiry {
 private int id; private String name,email,message,status; private LocalDateTime createdAt;
 public int getId(){return id;} public void setId(int v){id=v;} public String getName(){return name;} public void setName(String v){name=v;}
 public String getEmail(){return email;} public void setEmail(String v){email=v;} public String getMessage(){return message;} public void setMessage(String v){message=v;}
 public String getStatus(){return status;} public void setStatus(String v){status=v;} public LocalDateTime getCreatedAt(){return createdAt;} public void setCreatedAt(LocalDateTime v){createdAt=v;}
}
