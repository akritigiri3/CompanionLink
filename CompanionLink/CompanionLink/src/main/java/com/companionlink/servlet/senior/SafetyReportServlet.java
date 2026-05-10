package com.companionlink.servlet.senior;
import com.companionlink.dao.*; import com.companionlink.model.SafetyReport; import com.companionlink.servlet.BaseServlet; import com.companionlink.util.ValidationUtils;
import jakarta.servlet.*; import jakarta.servlet.annotation.WebServlet; import jakarta.servlet.http.*; import java.io.IOException;
@WebServlet("/senior/report") public class SafetyReportServlet extends BaseServlet {
 private final UserDAO users=new UserDAO(); private final SafetyReportDAO reports=new SafetyReportDAO();
 protected void doGet(HttpServletRequest r,HttpServletResponse h)throws ServletException,IOException{r.setAttribute("volunteers",users.searchApprovedVolunteers(null));forward(r,h,"senior/report");}
 protected void doPost(HttpServletRequest r,HttpServletResponse h)throws ServletException,IOException{try{if(ValidationUtils.isBlank(r.getParameter("description")))throw new IllegalArgumentException("Please describe the concern."); SafetyReport sr=new SafetyReport();sr.setSeniorId(currentUser(r).getId());String vid=r.getParameter("volunteerId"); if(vid!=null&&!vid.isBlank())sr.setVolunteerId(Integer.parseInt(vid));sr.setDescription(r.getParameter("description"));reports.create(sr);ok(r,h,"/senior/dashboard","Safety report submitted to admin.");}catch(Exception e){r.setAttribute("error",e.getMessage());doGet(r,h);}}
}
