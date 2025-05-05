package com.dreamydelights.root.utilities;

public final class PriceString {
    public static String StringFormat(double value) {
        if(value == 0){
            return "Rs.0.00";
        }else{
            return String.format("Rs.%.2f", value);
        }
    }
}
