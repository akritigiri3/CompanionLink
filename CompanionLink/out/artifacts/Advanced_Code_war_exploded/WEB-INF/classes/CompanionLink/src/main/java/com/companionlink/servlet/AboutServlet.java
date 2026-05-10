package com.companionlink.servlet;
import jakarta.servlet.*; import jakarta.servlet.annotation.WebServlet; import jakarta.servlet.http.*; import java.io.IOException;
@WebServlet("/about") public class AboutServlet extends BaseServlet { protected void doGet(HttpServletRequest r,HttpServletResponse h)throws ServletException,IOException{forward(r,h,"public/about");}}
