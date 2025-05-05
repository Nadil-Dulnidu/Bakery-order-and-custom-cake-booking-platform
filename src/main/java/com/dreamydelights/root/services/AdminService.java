package com.dreamydelights.root.services;

import com.dreamydelights.root.models.Admin;
import com.dreamydelights.root.models.User;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class AdminService {

    private final static String filePath = "D:\\Java Programming\\JSP and Servlet\\Bakery Order and Custom Cake Booking\\data\\admin.txt";
    private static final String userFilePath = "D:\\Java Programming\\JSP and Servlet\\Bakery Order and Custom Cake Booking\\data\\user.txt";

    //display all registered users
    public ArrayList<User> getAllUsers() {
        ArrayList<User> users = new ArrayList<>();
        try(BufferedReader bufferedReader = new BufferedReader(new FileReader(userFilePath))) {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] user = line.split(",");
                User user1 = new User(user[0],user[1],user[2],user[3],user[4],user[5]);
                users.add(user1);
            }
        }catch(IOException e){
            System.err.println(e.getMessage());
        }
        return users;
    }

    //add a new admin
    public boolean addNewAdmin(Admin admin) {
        try(BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(filePath,true))) {
            bufferedWriter.write(admin.getUsername()+","+admin.getPassword());
            bufferedWriter.newLine();
            bufferedWriter.close();
            return true;
        }catch (IOException e){
            System.out.println(e.getMessage());
            return false;
        }
    }

    //delete user account
    public boolean removeUser(String userId){

        List<String> users = new ArrayList<>();
        boolean isDeleted = false;

        try(FileReader fileReader = new FileReader(userFilePath)) {
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] user = line.split(",");
                if(user[0].equals(userId)){
                    isDeleted = true;
                }else{
                    users.add(line);
                }
            }
        }catch (IOException e){
            System.out.println(e.getMessage());
            return false;
        }
        if(isDeleted){
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(userFilePath))) {
                for (String user : users) {
                    writer.write(user);
                    writer.newLine();
                }
                return true;
            } catch (IOException e) {
                System.out.println(e.getMessage());
            }
        }
        return false;
    }

    //display all admins
    public ArrayList<Admin> getAllAdmins() {
        ArrayList<Admin> admins = new ArrayList<>();
        try(BufferedReader bufferedReader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] adminList = line.split(",");
                Admin admin = new Admin(adminList[0],adminList[1]);
                admins.add(admin);
            }
            return admins;
        }catch(IOException e){
            System.err.println(e.getMessage());
        }
        return null;
    }
}
