package com.companionlink.model;
import java.util.*;
public class AnalyticsSummary {
 private int totalUsers,totalSeniors,totalVolunteers,pendingVolunteers,openRequests,completedVisitsThisMonth; private List<String> topVolunteers=new ArrayList<>(), popularActivities=new ArrayList<>();
 public int getTotalUsers(){return totalUsers;} public void setTotalUsers(int v){totalUsers=v;} public int getTotalSeniors(){return totalSeniors;} public void setTotalSeniors(int v){totalSeniors=v;}
 public int getTotalVolunteers(){return totalVolunteers;} public void setTotalVolunteers(int v){totalVolunteers=v;} public int getPendingVolunteers(){return pendingVolunteers;} public void setPendingVolunteers(int v){pendingVolunteers=v;}
 public int getOpenRequests(){return openRequests;} public void setOpenRequests(int v){openRequests=v;} public int getCompletedVisitsThisMonth(){return completedVisitsThisMonth;} public void setCompletedVisitsThisMonth(int v){completedVisitsThisMonth=v;}
 public List<String> getTopVolunteers(){return topVolunteers;} public void setTopVolunteers(List<String> v){topVolunteers=v;} public List<String> getPopularActivities(){return popularActivities;} public void setPopularActivities(List<String> v){popularActivities=v;}
}
