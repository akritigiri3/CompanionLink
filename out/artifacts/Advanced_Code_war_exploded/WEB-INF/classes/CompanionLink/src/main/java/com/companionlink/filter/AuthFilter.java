package com.companionlink.filter;
import com.companionlink.model.User; import com.companionlink.util.SessionUtils;
import jakarta.servlet.*; import jakarta.servlet.annotation.WebFilter; import jakarta.servlet.http.*; import java.io.IOException;
@WebFilter(urlPatterns={"/admin/*","/senior/*","/volunteer/*","/profile"})
public class AuthFilter implements Filter {
 public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
  HttpServletRequest r=(HttpServletRequest)req; HttpServletResponse h=(HttpServletResponse)res; User u=SessionUtils.getCurrentUser(r); String p=r.getRequestURI().substring(r.getContextPath().length());
  if(u==null){h.sendRedirect(r.getContextPath()+"/login?error=Please login first");return;}
  if(!u.isActive()){SessionUtils.logout(r);h.sendRedirect(r.getContextPath()+"/login?error=Your account is not active yet");return;}
  if(p.startsWith("/admin")&&!u.isAdmin()){h.sendRedirect(r.getContextPath()+"/login?error=Admin access required");return;}
  if(p.startsWith("/senior")&&!u.isSenior()){h.sendRedirect(r.getContextPath()+"/login?error=Senior access required");return;}
  if(p.startsWith("/volunteer")&&!u.isVolunteer()){h.sendRedirect(r.getContextPath()+"/login?error=Volunteer access required");return;}
  chain.doFilter(req,res);
 }
}
