package com.companionlink.util;
import com.companionlink.model.User; import jakarta.servlet.http.*; import java.util.*;
public final class SessionUtils {
 private SessionUtils(){}
 public static User getCurrentUser(HttpServletRequest r){ HttpSession s=r.getSession(false); return s==null?null:(User)s.getAttribute("currentUser"); }
 public static void login(HttpServletRequest r, User u){ HttpSession s=r.getSession(true); s.invalidate(); s=r.getSession(true); s.setAttribute("currentUser",u); s.setMaxInactiveInterval(1800); }
 public static void logout(HttpServletRequest r){ HttpSession s=r.getSession(false); if(s!=null)s.invalidate(); }
 public static void flash(HttpServletRequest r,String type,String text){ r.getSession(true).setAttribute("flashType",type); r.getSession(true).setAttribute("flashText",text); }
 @SuppressWarnings("unchecked") public static List<Integer> wishlist(HttpServletRequest r){ HttpSession s=r.getSession(true); List<Integer> list=(List<Integer>)s.getAttribute("wishlist"); if(list==null){list=new ArrayList<>(); s.setAttribute("wishlist",list);} return list; }
}
