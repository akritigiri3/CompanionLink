package com.companionlink.servlet;
import com.companionlink.model.User; import com.companionlink.util.SessionUtils;
import jakarta.servlet.*; import jakarta.servlet.http.*; import java.io.IOException;
public abstract class BaseServlet extends HttpServlet {
 protected void forward(HttpServletRequest r,HttpServletResponse h,String view)throws ServletException,IOException{Object t=r.getSession(true).getAttribute("flashType"), x=r.getSession(true).getAttribute("flashText"); if(t!=null&&x!=null){r.setAttribute(t.toString(),x.toString());r.getSession().removeAttribute("flashType");r.getSession().removeAttribute("flashText");} r.setAttribute("currentUser",SessionUtils.getCurrentUser(r)); r.getRequestDispatcher("/WEB-INF/views/"+view+".jsp").forward(r,h);}
 protected void redirect(HttpServletRequest r,HttpServletResponse h,String path)throws IOException{h.sendRedirect(r.getContextPath()+path);}
 protected void ok(HttpServletRequest r,HttpServletResponse h,String path,String msg)throws IOException{SessionUtils.flash(r,"message",msg);redirect(r,h,path);}
 protected void fail(HttpServletRequest r,HttpServletResponse h,String path,String msg)throws IOException{SessionUtils.flash(r,"error",msg);redirect(r,h,path);}
 protected User currentUser(HttpServletRequest r){return SessionUtils.getCurrentUser(r);}
}
