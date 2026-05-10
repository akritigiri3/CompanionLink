package com.companionlink.servlet;
import com.companionlink.dao.ContactDAO; import com.companionlink.model.ContactEnquiry; import com.companionlink.util.ValidationUtils;
import jakarta.servlet.*; import jakarta.servlet.annotation.WebServlet; import jakarta.servlet.http.*; import java.io.IOException;
@WebServlet("/contact") public class ContactServlet extends BaseServlet {
 private final ContactDAO dao=new ContactDAO();
 protected void doGet(HttpServletRequest r,HttpServletResponse h)throws ServletException,IOException{forward(r,h,"public/contact");}
 protected void doPost(HttpServletRequest r,HttpServletResponse h)throws ServletException,IOException{try{if(ValidationUtils.isBlank(r.getParameter("name"))||!ValidationUtils.isValidEmail(r.getParameter("email"))||ValidationUtils.isBlank(r.getParameter("message")))throw new IllegalArgumentException("Please provide name, valid email and message."); ContactEnquiry e=new ContactEnquiry();e.setName(r.getParameter("name"));e.setEmail(r.getParameter("email"));e.setMessage(r.getParameter("message"));dao.create(e);ok(r,h,"/contact","Your enquiry has been submitted.");}catch(Exception e){r.setAttribute("error",e.getMessage());forward(r,h,"public/contact");}}
}
