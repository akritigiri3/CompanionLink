package com.companionlink.servlet.senior;
import com.companionlink.dao.UserDAO; import com.companionlink.model.User; import com.companionlink.servlet.BaseServlet; import com.companionlink.util.SessionUtils;
import jakarta.servlet.*; import jakarta.servlet.annotation.WebServlet; import jakarta.servlet.http.*; import java.io.IOException; import java.util.*;
@WebServlet("/senior/wishlist") public class WishlistServlet extends BaseServlet {
 private final UserDAO dao=new UserDAO();
 protected void doGet(HttpServletRequest r,HttpServletResponse h)throws ServletException,IOException{List<User> vs=new ArrayList<>(); for(Integer id:SessionUtils.wishlist(r)){User u=dao.findById(id); if(u!=null)vs.add(u);} r.setAttribute("volunteers",vs); forward(r,h,"senior/wishlist");}
 protected void doPost(HttpServletRequest r,HttpServletResponse h)throws IOException{List<Integer> list=SessionUtils.wishlist(r); int id=Integer.parseInt(r.getParameter("id")); if("remove".equals(r.getParameter("action")))list.remove(Integer.valueOf(id)); else if(!list.contains(id))list.add(id); ok(r,h,"/senior/wishlist","Wishlist updated for this session.");}
}
