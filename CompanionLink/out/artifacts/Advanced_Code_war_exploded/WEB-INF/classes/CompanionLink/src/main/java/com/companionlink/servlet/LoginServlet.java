package com.companionlink.servlet;
import com.companionlink.dao.UserDAO; import com.companionlink.model.User; import com.companionlink.util.*;
import jakarta.servlet.*; import jakarta.servlet.annotation.WebServlet; import jakarta.servlet.http.*; import java.io.IOException;
@WebServlet("/login") public class LoginServlet extends BaseServlet {
 private final UserDAO dao=new UserDAO();
 protected void doGet(HttpServletRequest r,HttpServletResponse h)throws ServletException,IOException{ if(r.getParameter("error")!=null)r.setAttribute("error",r.getParameter("error")); forward(r,h,"auth/login");}
 protected void doPost(HttpServletRequest r,HttpServletResponse h)throws ServletException,IOException{User u=dao.findByEmail(r.getParameter("email")); if(u==null||!PasswordUtils.matches(r.getParameter("password"),u.getPasswordHash())){r.setAttribute("error","Invalid email or password.");forward(r,h,"auth/login");return;} if(!u.isActive()){r.setAttribute("error","Your account status is "+u.getStatus()+". Please wait for admin approval.");forward(r,h,"auth/login");return;} SessionUtils.login(r,u); if(u.isAdmin())redirect(r,h,"/admin/dashboard"); else if(u.isSenior())redirect(r,h,"/senior/dashboard"); else redirect(r,h,"/volunteer/dashboard");}
}
