package com.dreamydelights.root.models;

import java.util.ArrayList;

public final class Queue {

    ArrayList<Order> queueArray = new ArrayList<>();

    public boolean isEmpty() {
        return queueArray.isEmpty();
    }

    public void insert(Order item) {
        queueArray.add(item);
    }

    public Order remove() {
        if (!isEmpty()) {
            return queueArray.removeFirst();
        }else{
            System.out.println("Queue is empty");
            return null;
        }
    }

    public Order peekFront() {
        if (!isEmpty()) {
            return queueArray.getFirst();
        }else{
            System.out.println("Queue is empty");
            return null;
        }
    }

    public int Size(){
        return queueArray.size();
    }

    public void displayQueue() {
        for(Order order : queueArray){
            System.out.println(order + " ");
        }
    }

}
