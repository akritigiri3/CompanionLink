package com.companionlink.servlet.admin;
import com.companionlink.dao.*; import com.companionlink.servlet.BaseServlet; import jakarta.servlet.*; import jakarta.servlet.annotation.WebServlet; import jakarta.servlet.http.*; import java.io.IOException;
@WebServlet("/admin/monitoring") public class AdminMonitoringServlet extends BaseServlet {
 private final RequestDAO req=new RequestDAO(); private final VisitDAO visit=new VisitDAO(); private final SafetyReportDAO report=new SafetyReportDAO(); private final ContactDAO contact=new ContactDAO();
 protected void doGet(HttpServletRequest r,HttpServletResponse h)throws ServletException,IOException{r.setAttribute("requests",req.findAll(r.getParameter("requestStatus")));r.setAttribute("visits",visit.findAll(r.getParameter("visitStatus")));r.setAttribute("reports",report.findAll(r.getParameter("reportStatus")));r.setAttribute("enquiries",contact.findAll());forward(r,h,"admin/monitoring");}
 protected void doPost(HttpServletRequest r,HttpServletResponse h)throws IOException{report.updateStatus(Integer.parseInt(r.getParameter("id")),r.getParameter("status"),r.getParameter("adminNotes"));ok(r,h,"/admin/monitoring","Safety report updated.");}
}
