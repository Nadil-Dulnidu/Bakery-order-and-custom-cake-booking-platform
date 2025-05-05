package com.dreamydelights.root.services;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.dreamydelights.root.models.Cart;
import com.dreamydelights.root.models.Order;

import java.io.*;
import java.lang.reflect.Type;
import java.util.*;

import com.dreamydelights.root.models.Queue;
import com.dreamydelights.root.utilities.Date;

public class OrderService {

    private static final String filePath = "D:\\Java Programming\\Cruds\\Bakery-order-and-custom-cake-booking-platform\\data\\order.txt";

    public String createOrder(String userId, double totalPrice, ArrayList<Cart> cartItems,String customerEmail, String customerFirstname, String customerLastName, String customerPhone, String customerAddress, String customerCity, String customerPostalCode) {

        String uuid = UUID.randomUUID().toString();
        String orderId = "ORD-"+uuid.substring(0, 8);
        String date = Date.getDate();
        String status = "Pending";

        Order newOrder = new Order(orderId,userId,customerEmail,cartItems, totalPrice, customerFirstname,customerLastName,customerPhone,customerAddress,customerCity,customerPostalCode,date,status);
        saveOrderToFile(newOrder);
        return orderId;
    }

    public void saveOrderToFile(Order order) {
        try(FileWriter fileWriter = new FileWriter(filePath , true)) {
            BufferedWriter  bw = new BufferedWriter(fileWriter);
            Gson gson = new Gson();
            String orderJson = gson.toJson(order.getProducts());
            bw.write(order.getOrderId()+"//" +order.getUserId()+"//" +order.getCustomerFirstName()+"//" +order.getCustomerLastName()+"//" +order.getCustomerEmail()+"//" +order.getCustomerAddress()+"//" +order.getCustomerCity()+"//" +order.getCustomerPostalCode()+"//" +order.getCustomerPhone()+"//" +order.getTotalPrice()+"//" +order.getOrderDate()+"//" +order.getOrderStatus()+"//" +orderJson);
            bw.newLine();
            bw.close();
        }catch (IOException e){
            System.err.println(e.getMessage());
        }
    }

    public Order getOrderByOrderId(String orderId) {

        Gson gson = new Gson();
        Type cartItemType = new TypeToken<ArrayList<Cart>>(){}.getType();

        try(FileReader fileReader = new FileReader(filePath)) {
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] data = line.split("//");
                if(data[0].equals(orderId)){
                    ArrayList<Cart>  cartItems = gson.fromJson(data[12], cartItemType);
                    return new Order(data[0],data[1],data[4],cartItems,Double.parseDouble(data[9]),data[2],data[3],data[8],data[5],data[6],data[7],data[10],data[11]);
                }
            }
        }catch (IOException e){
            System.err.println(e.getMessage());
        }
        return null;
    }

    public ArrayList<Order> getAllOrdersByUser(String userId, String status) {

        ArrayList<Order> orders = new ArrayList<>();
        Gson gson = new Gson();
        Type cartItemType = new TypeToken<ArrayList<Cart>>(){}.getType();

        try(BufferedReader bufferedReader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] data = line.split("//");
                boolean isUserMatch = data[1].equals(userId);
                if(isUserMatch && "all".equalsIgnoreCase(status)){
                    ArrayList<Cart>  cartItems = gson.fromJson(data[12], cartItemType);
                    Order order = new Order(data[0],data[1],data[4],cartItems,Double.parseDouble(data[9]),data[2],data[3],data[8],data[5],data[6],data[7],data[10],data[11]);
                    orders.add(order);
                }else if(isUserMatch && data[11].equalsIgnoreCase(status)){
                    ArrayList<Cart>  cartItems = gson.fromJson(data[12], cartItemType);
                    Order order = new Order(data[0],data[1],data[4],cartItems,Double.parseDouble(data[9]),data[2],data[3],data[8],data[5],data[6],data[7],data[10],data[11]);
                    orders.add(order);
                }
            }
        }catch (IOException e){
            System.err.println(e.getMessage());
        }
        return orders;
    }

    public boolean cancelOrder(String orderId, String userId) {

        ArrayList<String> updatedOrder =  new ArrayList<>();
        boolean result = false;

        try(BufferedReader bufferedReader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] data = line.split("//");
                if(data[1].equals(userId) &&  data[0].equals(orderId)){
                    if(data[11].equalsIgnoreCase("Pending")){
                        result = true;
                    }
                }else{
                    updatedOrder.add(line);
                }
            }
        }catch (IOException e){
            System.err.println(e.getMessage());
        }

        if(!result){
            return false;
        }

        try(BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(filePath))) {
            for(String order : updatedOrder){
                bufferedWriter.write(order);
                bufferedWriter.newLine();
            }
        }catch (IOException e){
            System.err.println(e.getMessage());
            return false;
        }
        return true;
    }

    public Queue getAllOrders(String status) {
        Queue orders = new Queue();
        Gson gson = new Gson();
        Type cartItemType = new TypeToken<ArrayList<Cart>>(){}.getType();

        try(FileReader fileReader = new FileReader(filePath)) {
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] data = line.split("//");
                if(data.length == 13 && "all".equalsIgnoreCase(status)){
                    ArrayList<Cart>  cartItems = gson.fromJson(data[12], cartItemType);
                    Order order = new Order(data[0],data[1],data[4],cartItems,Double.parseDouble(data[9]),data[2],data[3],data[8],data[5],data[6],data[7],data[10],data[11]);
                    orders.insert(order);
                }else if(data.length == 13 && data[11].equalsIgnoreCase(status)){
                    ArrayList<Cart>  cartItems = gson.fromJson(data[12], cartItemType);
                    Order order = new Order(data[0],data[1],data[4],cartItems,Double.parseDouble(data[9]),data[2],data[3],data[8],data[5],data[6],data[7],data[10],data[11]);
                    orders.insert(order);
                }
            }
        }catch (IOException e){
            System.err.println(e.getMessage());
        }
        return orders;
    }

    public ArrayList<Order> getAllOrdersAsArrayList() {

        ArrayList<Order> orders = new ArrayList<>();
        Gson gson = new Gson();
        Type cartItemType = new TypeToken<ArrayList<Cart>>(){}.getType();

        try(FileReader fileReader = new FileReader(filePath)) {
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] data = line.split("//");
                if(data.length == 13){
                    ArrayList<Cart>  cartItems = gson.fromJson(data[12], cartItemType);
                    Order order = new Order(data[0],data[1],data[4],cartItems,Double.parseDouble(data[9]),data[2],data[3],data[8],data[5],data[6],data[7],data[10],data[11]);
                    orders.add(order);
                }
            }
        }catch (IOException e){
            System.err.println(e.getMessage());
        }
        return orders;
    }

    public boolean updateOrderStatus(String orderId, String status){
        ArrayList<String> updatedOrders =  new ArrayList<>();
        boolean result = false;

        try(BufferedReader bufferedReader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] data = line.split("//");
                if(data.length == 13){
                    if(data[0].trim().equals(orderId.trim())){
                        data[11] = status;
                        result = true;
                    }
                    updatedOrders.add(String.join("//", data));
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
            for(String order : updatedOrders){
                bufferedWriter.write(order);
                bufferedWriter.newLine();
            }
        }catch (IOException e){
            System.err.println(e.getMessage());
            return false;
        }
        return true;
    }

    // display all always top 8 orders
    public ArrayList<Order> getRecentOrders(ArrayList<Order> allOrders) {
        ArrayList<Order> recentOrders = new ArrayList<>();
        int start = Math.max(0, allOrders.size() - 8);

        for (int i = allOrders.size() - 1; i >= start; i--) {
            recentOrders.add(allOrders.get(i));
        }

        return recentOrders;
    }

}
