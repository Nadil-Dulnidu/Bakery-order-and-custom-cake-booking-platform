package com.dreamydelights.root.services;

import com.dreamydelights.root.models.CustomCake;

import java.io.*;
import java.util.ArrayList;
import java.util.UUID;

public class CustomCakeService {

    public static final String filePath = "D:\\Java Programming\\Cruds\\Bakery-order-and-custom-cake-booking-platform\\data\\custom-cake.txt";

    // grab user and default inputs
    public boolean createCakeOrder(String userId, String firstName, String lastName, String email, String phone, String date, String cakeType, String cakeDetails, String budgetDetails, String imagePath, String deliveryLocation) {

        String uuid = UUID.randomUUID().toString();
        String cakeId = "CAKE-"+uuid.substring(0, 8);
        String orderStatus = "Pending";

        if(firstName.isEmpty() && lastName.isEmpty() && email.isEmpty() && phone.isEmpty() && date.isEmpty() && budgetDetails.isEmpty()){
            return false;
        }else{
            CustomCake cake = new CustomCake(cakeId,userId,firstName,lastName,email,phone,date,cakeType,cakeDetails,budgetDetails,orderStatus,imagePath,deliveryLocation);
            saveOrder(cake);
            return true;
        }
    }

    //save order to the file
    public void saveOrder(CustomCake cake){
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath,true))){
            bw.write(cake.getCakeId()+"//" +cake.getUserId()+"//" +cake.getFirstName()+"//" +cake.getLastName()+"//" +cake.getEmail()+"//" +cake.getPhone()+"//" +cake.getDate()+"//" +cake.getCakeType()+"//" +cake.getCakeDetails()+"//" +cake.getBudgetDetails()+"//" +cake.getDeliveryLocation()+"//" +cake.getEnquiryStatus()+"//" +cake.getImagePath());
            bw.newLine();
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
    }

    //display all cake orders by filtering
    public ArrayList<CustomCake> displayAllOrder(String status){
        ArrayList<CustomCake> customCakes = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))){
            String line;
            while ((line = br.readLine()) != null){
                String[] lineSplit = line.split("//");
                if(lineSplit.length == 13 && (status == null || "all".equalsIgnoreCase(status))){
                    CustomCake cake = new CustomCake(lineSplit[0], lineSplit[1], lineSplit[2], lineSplit[3], lineSplit[4], lineSplit[5], lineSplit[6], lineSplit[7], lineSplit[8], lineSplit[9], lineSplit[11], lineSplit[12], lineSplit[10]);
                    customCakes.add(cake);
                }else if(lineSplit.length == 13 && lineSplit[11].equalsIgnoreCase(status)){
                    CustomCake cake = new CustomCake(lineSplit[0], lineSplit[1], lineSplit[2], lineSplit[3], lineSplit[4], lineSplit[5], lineSplit[6], lineSplit[7], lineSplit[8], lineSplit[9], lineSplit[11], lineSplit[12], lineSplit[10]);
                    customCakes.add(cake);
                }
            }
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
        return customCakes;
    }

    //display all orders
    public ArrayList<CustomCake> displayAllOrder(){
        ArrayList<CustomCake> customCakes = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))){
            String line;
            while ((line = br.readLine()) != null){
                String[] lineSplit = line.split("//");
                if(lineSplit.length == 13){
                    CustomCake cake = new CustomCake(lineSplit[0], lineSplit[1], lineSplit[2], lineSplit[3], lineSplit[4], lineSplit[5], lineSplit[6], lineSplit[7], lineSplit[8], lineSplit[9], lineSplit[11], lineSplit[12], lineSplit[10]);
                    customCakes.add(cake);
                }
            }
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
        return customCakes;
    }

    //get cake orders by id
    public CustomCake getCakeOrderById(String cakeId){
        ArrayList<CustomCake> customCakes = displayAllOrder();
        for (CustomCake cake : customCakes){
            if(cake.getCakeId().equals(cakeId)){
                return cake;
            }
        }
        return null;
    }

    //delete a cake order
    public void deleteCakeOrder(String cakeId){
        ArrayList<CustomCake> customCakes = displayAllOrder();
        try(BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(filePath,false))) {
            for (CustomCake cake : customCakes){
                if(!cake.getCakeId().equals(cakeId)){
                    bufferedWriter.write(cake.getCakeId()+"//"+cake.getUserId()+"//" +cake.getFirstName()+"//" +cake.getLastName()+"//" +cake.getEmail()+"//" +cake.getPhone()+"//" +cake.getDate()+"//"+cake.getCakeType()+"//"+cake.getCakeDetails()+"//" +cake.getBudgetDetails()+"//" +cake.getDeliveryLocation()+"//" +cake.getEnquiryStatus()+"//" +cake.getImagePath());
                    bufferedWriter.newLine();
                }
            }
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
    }

    //get custom orders by user
    public ArrayList<CustomCake> displayOrderByUser(String userId){
        ArrayList<CustomCake> customCakes = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))){
            String line;
            while ((line = br.readLine()) != null){
                String[] lineSplit = line.split("//");
                if(lineSplit.length == 13 && lineSplit[1].equals(userId)){
                    CustomCake cake = new CustomCake(lineSplit[0], lineSplit[1], lineSplit[2], lineSplit[3], lineSplit[4], lineSplit[5], lineSplit[6], lineSplit[7], lineSplit[8], lineSplit[9], lineSplit[11], lineSplit[12], lineSplit[10]);
                    customCakes.add(cake);
                }
            }
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
        return customCakes;
    }

    //change order status
    public boolean changeEnquiryStatus(String enquiryId, String status){
        ArrayList<String> updatedEnquiry =  new ArrayList<>();
        boolean result = false;

        try(BufferedReader bufferedReader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] data = line.split("//");
                if(data.length == 13){
                    if(data[0].equals(enquiryId)){
                        data[11] = status;
                        result = true;
                    }
                    updatedEnquiry.add(String.join("//", data));
                }
            }
        }catch (IOException e){
            System.err.println(e.getMessage());
            return false;
        }

        if(!result){
            return false;
        }

        try(BufferedWriter  bufferedWriter = new BufferedWriter(new FileWriter(filePath))) {
            for(String enquiry : updatedEnquiry ){
                bufferedWriter.write(enquiry);
                bufferedWriter.newLine();
            }
        }catch (IOException e){
            System.err.println(e.getMessage());
            return false;
        }
        return true;
    }

    // display recent 4 orders
    public ArrayList<CustomCake> getRecentRequests(ArrayList<CustomCake> allRequests) {
        ArrayList<CustomCake> recentOrders = new ArrayList<>();
        int start = Math.max(0, allRequests.size() - 4);

        for (int i = allRequests.size() - 1; i >= start; i--) {
            recentOrders.add(allRequests.get(i));
        }

        return recentOrders;
    }

}
