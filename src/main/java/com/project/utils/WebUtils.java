package com.project.utils;

public class WebUtils {

    public static Integer StrToInt(String str ,Integer defaultValue){
        try {
            return Integer.parseInt(str);
        }catch (Exception e){
            return defaultValue;
        }
    }
}
