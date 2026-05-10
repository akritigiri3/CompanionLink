package com.companionlink.servlet.senior;
import com.companionlink.dao.VisitDAO; import com.companionlink.servlet.BaseServlet; import jakarta.servlet.*; import jakarta.servlet.annotation.WebServlet; import jakarta.servlet.http.*; import java.io.IOException;
@WebServlet("/senior/visits") public class SeniorVisitsServlet extends BaseServlet { private final VisitDAO dao=new VisitDAO(); protected void doGet(HttpServletRequest r,HttpServletResponse h)throws ServletException,IOException{r.setAttribute("visits",dao.findBySenior(currentUser(r).getId()));forward(r,h,"senior/visits");}}
