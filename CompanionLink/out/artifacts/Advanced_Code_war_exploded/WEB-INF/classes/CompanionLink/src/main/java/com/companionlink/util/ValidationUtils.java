package com.companionlink.util;
import java.time.*; import java.util.regex.Pattern;
public final class ValidationUtils {
 private static final Pattern EMAIL=Pattern.compile("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$"), PHONE=Pattern.compile("^[0-9+ -]{7,20}$"), NAME=Pattern.compile("^[A-Za-z ]{2,100}$");
 private ValidationUtils(){}
 public static boolean isBlank(String v){return v==null||v.trim().isEmpty();}
 public static boolean isValidEmail(String v){return v!=null&&EMAIL.matcher(v).matches();}
 public static boolean isValidPhone(String v){return v!=null&&PHONE.matcher(v).matches();}
 public static boolean isAlphaSpaceName(String v){return v!=null&&NAME.matcher(v.trim()).matches();}
 public static boolean isStrongPassword(String v){return v!=null&&v.length()>=6&&v.matches(".*[A-Za-z].*")&&v.matches(".*[0-9].*");}
 public static boolean isAdult(LocalDate dob){return dob!=null&&Period.between(dob,LocalDate.now()).getYears()>=18;}
}
