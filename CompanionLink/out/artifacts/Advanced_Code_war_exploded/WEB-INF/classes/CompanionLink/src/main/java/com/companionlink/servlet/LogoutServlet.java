package com.companionlink.servlet;
import com.companionlink.util.SessionUtils; import jakarta.servlet.annotation.WebServlet; import jakarta.servlet.http.*; import java.io.IOException;
@WebServlet("/logout") public class LogoutServlet extends BaseServlet { protected void doGet(HttpServletRequest r,HttpServletResponse h)throws IOException{SessionUtils.logout(r);h.sendRedirect(r.getContextPath()+"/login?error=You have logged out successfully");}}
