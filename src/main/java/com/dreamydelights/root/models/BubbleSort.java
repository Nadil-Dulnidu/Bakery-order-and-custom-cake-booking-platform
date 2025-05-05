package com.dreamydelights.root.models;

import java.util.ArrayList;

public final class BubbleSort {

    // cake order date sorting
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

    // product rating sorting
    public static ArrayList<Review> descendingRate(ArrayList<Review> reviews) {
        for(int i = 0; i < reviews.size() - 1; i++) {
            for(int j = 0; j < reviews.size() - i - 1; j++) {
                if(reviews.get(j).getRating() < reviews.get(j + 1).getRating()) {
                    Review temp = reviews.get(j);
                    reviews.set(j,reviews.get(j+1));
                    reviews.set(j+1,temp);
                }
            }
        }
        return reviews;
    }

    public static ArrayList<Review> ascendingRate(ArrayList<Review> reviews) {
        for(int i = 0; i < reviews.size() - 1; i++) {
            for(int j = 0; j < reviews.size() - i - 1; j++) {
                if(reviews.get(j).getRating() > reviews.get(j + 1).getRating()) {
                    Review temp = reviews.get(j);
                    reviews.set(j,reviews.get(j+1));
                    reviews.set(j+1,temp);
                }
            }
        }
        return reviews;
    }
}
