package com.customcakemanagement.root.modal;

import java.util.ArrayList;

public final class BubbleSort {

    //cake order date sorting
    public static ArrayList<CustomCake> ascendingDate(ArrayList<CustomCake> cakes) {
        for(int i = 0; i < cakes.size() - 1; i++) {
            for(int j = 0; j < cakes.size() - i - 1; j++) {
                if(cakes.get(j).getDate().compareTo(cakes.get(j + 1).getDate()) > 0) {
                    CustomCake temp = cakes.get(j);
                    cakes.set(j,cakes.get(j+1));
                    cakes.set(j+1,temp);
                }
            }
        }
        return cakes;
    }

    public static ArrayList<CustomCake> descendingDate(ArrayList<CustomCake> cakes) {
        for(int i = 0; i < cakes.size() - 1; i++) {
            for(int j = 0; j < cakes.size() - i - 1; j++) {
                if(cakes.get(j).getDate().compareTo(cakes.get(j + 1).getDate()) < 0) {
                    CustomCake temp = cakes.get(j);
                    cakes.set(j,cakes.get(j+1));
                    cakes.set(j+1,temp);
                }
            }
        }
        return cakes;
    }
}
