package com.companionlink.servlet;
import com.companionlink.dao.UserDAO;
import com.companionlink.model.User;
import com.companionlink.util.ValidationUtils;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
@WebServlet("/register")
public class RegisterServlet extends BaseServlet {
 private final UserDAO dao=new UserDAO();
 protected void doGet(HttpServletRequest r,HttpServletResponse h)
         throws ServletException,IOException{forward(r,h,"auth/register");}
 protected void doPost(HttpServletRequest r,HttpServletResponse h)
         throws ServletException,IOException{
  try{String name=r.getParameter("fullName"),email=r.getParameter("email"),phone=r.getParameter("phone"),role=r.getParameter("role"),pass=r.getParameter("password");
   String dobStr = r.getParameter("dateOfBirth");
   LocalDate dob = (dobStr != null && !dobStr.isEmpty()) ? LocalDate.parse(dobStr) : LocalDate.of(2000, 1, 1);
   if(!ValidationUtils.isAlphaSpaceName(name))
    throw new IllegalArgumentException("Full name must contain alphabets and spaces only.");
   if(!ValidationUtils.isValidEmail(email))
    throw new IllegalArgumentException("Enter a valid email.");
   if(!ValidationUtils.isValidPhone(phone))
    throw new IllegalArgumentException("Enter a valid phone number.");
   if(!"SENIOR".equals(role)&&!"VOLUNTEER".equals(role))
    throw new IllegalArgumentException("Choose senior or volunteer.");
   if(!ValidationUtils.isStrongPassword(pass))
    throw new IllegalArgumentException("Password must be at least 6 characters and contain letters and numbers.");
   if(!pass.equals(r.getParameter("confirmPassword")))
    throw new IllegalArgumentException("Passwords do not match.");
   if("VOLUNTEER".equals(role)&&!ValidationUtils.isAdult(dob))
    throw new IllegalArgumentException("Volunteers must be at least 18.");
   if(dao.emailExists(email))
    throw new IllegalArgumentException("Email already registered.");
   if(dao.phoneExists(phone))
    throw new IllegalArgumentException("Phone already registered.");
   User u=new User();u.setFullName(name.trim());u.setEmail(email.trim());
   u.setPhone(phone.trim());u.setDateOfBirth(dob);u.setRole(role);
   u.setAddress(r.getParameter("address"));
   u.setHealthNotes(r.getParameter("healthNotes"));
   u.setEmergencyContact(r.getParameter("emergencyContact"));
   u.setBio(r.getParameter("bio"));
   u.setSkills(r.getParameter("skills"));
   u.setAvailability(r.getParameter("availability"));
   dao.createUser(u, pass);
   h.setContentType("application/json");
   h.setCharacterEncoding("UTF-8");
   h.getWriter().print("{\"success\":true}");

  } catch (Exception e) {
   e.printStackTrace();
   String msg = e.getMessage() == null ? "" : e.getMessage();
   boolean dupEmail = msg.contains("Email already registered");
   boolean dupPhone = msg.contains("Phone already registered");
   h.setContentType("application/json");
   h.setCharacterEncoding("UTF-8");
   h.getWriter().print(
           "{\"success\":false,\"duplicateEmail\":" + dupEmail +
                   ",\"duplicatePhone\":" + dupPhone +
                   ",\"message\":\"" + msg.replace("\"", "'") + "\"}"
   );
  }
  }
}
