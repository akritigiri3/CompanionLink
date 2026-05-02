package com.companionlink.servlet.senior;
import com.companionlink.dao.*; import com.companionlink.model.CompanionRequest; import com.companionlink.servlet.BaseServlet; import com.companionlink.util.ValidationUtils;
import jakarta.servlet.*; import jakarta.servlet.annotation.WebServlet; import jakarta.servlet.http.*; import java.io.IOException; import java.time.LocalDateTime;
@WebServlet("/senior/requests") public class SeniorRequestsServlet extends BaseServlet {
 private final RequestDAO req=new RequestDAO(); private final ActivityTypeDAO act=new ActivityTypeDAO();
 protected void doGet(HttpServletRequest r,HttpServletResponse h)throws ServletException,IOException{r.setAttribute("activities",act.findAll(true));r.setAttribute("requests",req.findBySenior(currentUser(r).getId()));forward(r,h,"senior/requests");}
 protected void doPost(HttpServletRequest r,HttpServletResponse h)throws ServletException,IOException{try{if(ValidationUtils.isBlank(r.getParameter("locationArea")))throw new IllegalArgumentException("Approximate location is required."); CompanionRequest cr=new CompanionRequest(); cr.setSeniorId(currentUser(r).getId());cr.setActivityTypeId(Integer.parseInt(r.getParameter("activityTypeId")));cr.setPreferredDateTime(LocalDateTime.parse(r.getParameter("preferredDateTime")));cr.setLocationArea(r.getParameter("locationArea"));cr.setNotes(r.getParameter("notes"));req.create(cr);ok(r,h,"/senior/requests","Request posted and visible to approved volunteers.");}catch(Exception e){r.setAttribute("error",e.getMessage());doGet(r,h);}}
}
