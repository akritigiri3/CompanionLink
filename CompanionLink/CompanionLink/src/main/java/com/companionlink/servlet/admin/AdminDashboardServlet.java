package com.companionlink.servlet.admin;
import com.companionlink.dao.AdminDAO; import com.companionlink.servlet.BaseServlet; import jakarta.servlet.*; import jakarta.servlet.annotation.WebServlet; import jakarta.servlet.http.*; import java.io.IOException;
@WebServlet("/admin/dashboard") public class AdminDashboardServlet extends BaseServlet { private final AdminDAO dao=new AdminDAO(); protected void doGet(HttpServletRequest r,HttpServletResponse h)throws ServletException,IOException{r.setAttribute("summary",dao.buildSummary());forward(r,h,"admin/dashboard");}}
