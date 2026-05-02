package com.companionlink.util;
import java.nio.charset.StandardCharsets; import java.security.*;
public final class PasswordUtils {
 private PasswordUtils(){}
 public static String hashPassword(String plain) {
  try { MessageDigest d=MessageDigest.getInstance("SHA-256"); byte[] b=d.digest(plain.getBytes(StandardCharsets.UTF_8)); StringBuilder s=new StringBuilder(); for(byte x:b){String h=Integer.toHexString(0xff&x); if(h.length()==1)s.append('0'); s.append(h);} return s.toString(); }
  catch(NoSuchAlgorithmException e){ throw new IllegalStateException(e); }
 }
 public static boolean matches(String plain,String hash){ return hash!=null && hash.equals(hashPassword(plain)); }
}
