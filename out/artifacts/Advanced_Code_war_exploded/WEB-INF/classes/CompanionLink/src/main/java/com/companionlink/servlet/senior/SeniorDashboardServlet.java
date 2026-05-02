package com.companionlink.servlet.senior;
import com.companionlink.dao.*; import com.companionlink.servlet.BaseServlet; import jakarta.servlet.*; import jakarta.servlet.annotation.WebServlet; import jakarta.servlet.http.*; import java.io.IOException;
@WebServlet("/senior/dashboard") public class SeniorDashboardServlet extends BaseServlet {
 private final RequestDAO req=new RequestDAO(); private final VisitDAO visit=new VisitDAO(); private final UserDAO user=new UserDAO();
 protected void doGet(HttpServletRequest r,HttpServletResponse h)throws ServletException,IOException{int id=currentUser(r).getId();r.setAttribute("requests",req.findBySenior(id));r.setAttribute("visits",visit.findBySenior(id));r.setAttribute("volunteers",user.searchApprovedVolunteers(null));forward(r,h,"senior/dashboard");}
}
