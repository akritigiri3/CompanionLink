package com.companionlink.servlet.senior;
import com.companionlink.dao.*; import com.companionlink.model.*; import com.companionlink.servlet.BaseServlet; import jakarta.servlet.*; import jakarta.servlet.annotation.WebServlet; import jakarta.servlet.http.*; import java.io.IOException;
@WebServlet("/senior/rate") public class RatingServlet extends BaseServlet {
 private final VisitDAO vdao=new VisitDAO(); private final RatingDAO rdao=new RatingDAO();
 protected void doGet(HttpServletRequest r,HttpServletResponse h)throws ServletException,IOException{r.setAttribute("visit",vdao.findById(Integer.parseInt(r.getParameter("visitId"))));forward(r,h,"senior/rate");}
 protected void doPost(HttpServletRequest r,HttpServletResponse h)throws IOException{Visit v=vdao.findById(Integer.parseInt(r.getParameter("visitId"))); int stars=Integer.parseInt(r.getParameter("stars")); if(v==null||v.getSeniorId()!=currentUser(r).getId()||stars<1||stars>5||!"COMPLETED".equals(v.getStatus())){fail(r,h,"/senior/visits","Only your completed visits can be rated.");return;} Rating rating=new Rating();rating.setVisitId(v.getId());rating.setSeniorId(v.getSeniorId());rating.setVolunteerId(v.getVolunteerId());rating.setStars(stars);rating.setComment(r.getParameter("comment"));rdao.create(rating);ok(r,h,"/senior/visits","Volunteer rating saved.");}
}
