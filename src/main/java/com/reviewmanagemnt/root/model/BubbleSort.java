package com.reviewmanagemnt.root.model;

import java.util.ArrayList;

public final class BubbleSort {

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
