package com.reviewmanagemnt.root.service;



import com.reviewmanagemnt.root.model.Review;

import java.io.*;
import java.util.ArrayList;

public class ReviewService {

    public static final String filePath = "C:\\Users\\User\\Desktop\\New folder\\review-managemnt\\data\\review.txt";

    //save the review
    public boolean saveFeedback(Review review) {
        try(BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(filePath,true))) {
            bufferedWriter.write(review.getProductId()+","+review.getUserId()+","+ review.getName()+","+ review.getMessage()+","+ review.getRating()+","+review.getDate());
            bufferedWriter.newLine();
            return true;
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
        return false;
    }

    //check userid and productId both are already exists
    public boolean isExistingReview(String productId, String userId) {
        try(BufferedReader bufferedReader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] review = line.split(",");
                if (review[0].equals(productId) && review[1].equals(userId)) {
                    return true;
                }
            }
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
        return false;
    }

    //display reviews by product
    public ArrayList<Review> displayReviews(String productId) {
        ArrayList<Review> reviews = new ArrayList<>();
        try(FileReader fileReader = new FileReader(filePath)){
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            String line;
            while((line = bufferedReader.readLine()) != null){
                String[] reviewData = line.split(",");
                if(reviewData.length == 6 && reviewData[0].equalsIgnoreCase(productId)){
                    Review review = new Review(reviewData[0], reviewData[1], reviewData[2], reviewData[3], Double.parseDouble(reviewData[4]),reviewData[5]);
                    reviews.add(review);
                }
            }
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
        return reviews;
    }

    //get review by user id and product id
    public Review displayReviews(String userId, String productId) {
        try(FileReader fileReader = new FileReader(filePath)){
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            String line;
            while((line = bufferedReader.readLine()) != null){
                String[] reviewData = line.split(",");
                if(reviewData.length == 6 && reviewData[0].equalsIgnoreCase(productId) && reviewData[1].equals(userId)){
                    return new Review(reviewData[0], reviewData[1], reviewData[2], reviewData[3], Double.parseDouble(reviewData[4]),reviewData[5]);
                }
            }
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
        return null;
    }

    //display all the reviews
    public ArrayList<Review> displayReviews() {
        ArrayList<Review> reviews = new ArrayList<>();
        try(FileReader fileReader = new FileReader(filePath)){
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            String line;
            while((line = bufferedReader.readLine()) != null){
                String[] reviewData = line.split(",");
                if(reviewData.length == 6){
                    Review review = new Review(reviewData[0], reviewData[1], reviewData[2], reviewData[3], Double.parseDouble(reviewData[4]),reviewData[5]);
                    reviews.add(review);
                }
            }
        }catch (IOException e){
            System.out.println(e.getMessage());
            return null;
        }
        return reviews;
    }

    //delete a review
    public boolean deleteAReview(String userId, String productId) {

        ArrayList<String> reviews = new ArrayList<>();
        boolean isDeleted = false;

        try(BufferedReader bufferedReader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] review = line.split(",");
                if(review[1].equals(userId) && review[0].equals(productId)){
                    isDeleted = true;
                }else{
                    reviews.add(line);
                }
            }
        }catch (IOException e){
            System.out.println(e.getMessage());
            return false;
        }
        if(isDeleted){
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
                for (String review : reviews) {
                    writer.write(review);
                    writer.newLine();
                }
                return true;
            } catch (IOException e) {
                System.out.println(e.getMessage());
            }
        }
        return false;
    }

    //edit review
    public void updateReview(String productId, String userId, String newName, String newMessage, Double newRating, String newDate ) {

        ArrayList<String> reviews = new ArrayList<>();
        boolean updated = false;

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] review = line.split(",");
                if (review[0].equals(productId) && review[1].equals(userId)) {
                    reviews.add(review[0]+","+review[1]+","+newName+","+newMessage+","+newRating+","+newDate);
                    updated = true;
                } else {
                    reviews.add(line);
                }
            }
        } catch (IOException e) {
            System.err.println(e.getMessage());
        }

        if (updated) {
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, false))) {
                for (String review : reviews) {
                    writer.write(review);
                    writer.newLine();
                }
            } catch (IOException e) {
                System.err.println(e.getMessage());
            }
        }
    }
}
