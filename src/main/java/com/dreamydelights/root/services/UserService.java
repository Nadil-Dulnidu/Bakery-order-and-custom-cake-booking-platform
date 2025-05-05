package com.dreamydelights.root.services;

import com.dreamydelights.root.models.Admin;
import com.dreamydelights.root.models.User;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class UserService {
    //file path
    private static final String filePath = "D:\\Java Programming\\Cruds\\Bakery-order-and-custom-cake-booking-platform\\data\\user.txt";
    private final static String adminFilePath = "D:\\Java Programming\\Cruds\\Bakery-order-and-custom-cake-booking-platform\\data\\admin.txt";

    //create user id
    public String createUserId(){
        String uuid = UUID.randomUUID().toString();
        return "USR-"+uuid.substring(0, 8);
    }

    //password validation
    public String passwordValidation(String password){
        String regex = "^(?=.*[A-Z])(?=.*\\d).+$";
        if(password.length() < 6){
            return "length";
        }else if(!password.matches(regex)){
            return "regex";
        }
        return "valid";
    }

    //grab all user details
    public void getRegisterDetails(String name, String username, String email, String password) {
        String role = "user";
        String userId = createUserId();
        User user = new User(userId, name, username, email, password, role);
        registerUser(user);
    }
    //register a user
    public void registerUser(User user) {
        try(BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(filePath,true))) {
            bufferedWriter.write(user.getUserId()+","+user.getName()+","+user.getUsername()+","+user.getEmail()+","+user.getPassword()+","+user.getRole());
            bufferedWriter.newLine();
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
    }
    //check if there are exists same users
    public boolean isUserExist(String email){
        try(FileReader fileReader = new FileReader(filePath)) {
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] user = line.split(",");
                if(user.length == 6 && user[3].equals(email)){
                    return true;
                }
            }
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
        return false;
    }
    //user login
    public User loginUser(String email, String password){
        try(FileReader fileReader = new FileReader(filePath)){
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] user = line.split(",");
                if(user.length == 6 && user[3].equals(email) && user[4].equals(password)){
                    return new User(user[0], user[1], user[2], email, password, user[5]);
                }
            }
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
        return null;
    }

    //admin login
    public Admin loginAdmin(String username, String password){
        try(FileReader fileReader = new FileReader(adminFilePath)){
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                String[] admin = line.split(",");
                if(admin[0].equals(username) && admin[1].equals(password)){
                    return new Admin(admin[0], admin[1]);
                }
            }
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
        return null;
    }

    //delete user account (user side)
    public boolean deleteUser(String userId){

        List<String> users = new ArrayList<>();
        boolean isDeleted = false;

        try(FileReader fileReader = new FileReader(filePath)) {
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
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
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

    //update user details
    public boolean updateUser(String oldEmail, String newName, String newUserName, String newPassword) {

        List<String> users = new ArrayList<>();
        boolean updated = false;

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] user = line.split(",");
                if (user[3].equals(oldEmail)) {
                    users.add(user[0] + "," + newName + "," + newUserName +","+oldEmail+","+newPassword + ","+user[5]);
                    updated = true;
                } else {
                    users.add(line);
                }
            }
        } catch (IOException e) {
            System.out.println(e.getMessage());
            return false;
        }

        if (updated) {
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath, false))) {
                for (String user : users) {
                    writer.write(user);
                    writer.newLine();
                }
            } catch (IOException e) {
                System.out.println(e.getMessage());
                return false;
            }
        }
        return updated;
    }

}
