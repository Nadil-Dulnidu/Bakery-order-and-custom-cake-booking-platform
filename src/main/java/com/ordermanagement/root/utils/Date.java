package com.ordermanagement.root.utils;

import java.text.SimpleDateFormat;

public final class Date {

    public static String getDate(){
        return new SimpleDateFormat("yyyy MMM dd").format(new java.util.Date());
    }
}
