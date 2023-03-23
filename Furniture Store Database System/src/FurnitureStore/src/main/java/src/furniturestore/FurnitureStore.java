/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package src.furniturestore;

/**
 *
 * @author lamnguyen
 */

import java.sql.*;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Scanner;

public class FurnitureStore {
    private Connection connect() {
        Connection c = null;
      
        try {
           Class.forName("org.sqlite.JDBC");
           c = DriverManager.getConnection("jdbc:sqlite:/Users/lamnguyen/furniture.db");
        } catch ( Exception e ) {
           System.err.println( e.getClass().getName() + ": " + e.getMessage() );
           System.exit(0);
        }
        return c;
         
    }
    public void currentStock(Integer productID) {
        String sql = "SELECT products.productID as product_id, productName as product_name, (stock - SUM(orderQuantity)) AS current_stock "
                + "FROM orders JOIN products ON orders.productID = products.productID "
                + "WHERE products.productID = ?";
        
        try (Connection c = this.connect();
             PreparedStatement pstmt  = c.prepareStatement(sql)){
            
            // set the value
            pstmt.setInt(1, productID);
            //
            ResultSet rs  = pstmt.executeQuery();
            
            // loop through the result set
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                String product_name = rs.getString("product_name");
                int current_stock = rs.getInt("current_stock");
                
                System.out.println( "product_id: " + product_id );
                System.out.println( "product_name: " + product_name );
                System.out.println( "current_stock: " + current_stock );

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void totalSold(Integer productID, String month){
        String sql = "SELECT productID as product_id, SUM(orderQuantity) AS total_quantity_sold "
                + "FROM orders  "
                + "WHERE productID = ? "
                + "AND STRFTIME('%m', orderDate) = ?";
        
        try (Connection c = this.connect();
             PreparedStatement pstmt  = c.prepareStatement(sql)){
            
            // set the value
            pstmt.setInt(1, productID);
            pstmt.setString(2, month);
            //
            ResultSet rs  = pstmt.executeQuery();
            
            // loop through the result set
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                int total_quantity_sold = rs.getInt("total_quantity_sold");
                
                System.out.println( "product_id: " + product_id );
                System.out.println( "total_quantity_sold: " + total_quantity_sold );

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void revenueCategory(String category){
        String sql = "SELECT SUM(totalPrice) AS revenue "
                + "FROM orders JOIN products ON orders.productID = products.productID "
                + "WHERE products.productCategory = ?";
        
        try (Connection c = this.connect();
             PreparedStatement pstmt  = c.prepareStatement(sql)){
            
            // set the value
            pstmt.setString(1, category);
            //
            ResultSet rs  = pstmt.executeQuery();
            
            // loop through the result set
            while (rs.next()) {
                float revenue = rs.getFloat("revenue");
                
                System.out.println( "revenue: " + revenue );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void mostPurchasedCustomer(String year){
        String sql = "SELECT customerID as customer_id, SUM(totalPrice) AS total_purchases "
                + "FROM orders "
                + "WHERE STRFTIME('%Y', orderDate) = ? "
                + "GROUP BY customer_id ORDER BY total_purchases DESC "
                + "LIMIT 1";
        try (Connection c = this.connect();
             PreparedStatement pstmt  = c.prepareStatement(sql)){
            
            // set the value
            pstmt.setString(1, year);
            //
            ResultSet rs  = pstmt.executeQuery();
            
            // loop through the result set
            while (rs.next()) {
                int customer_id = rs.getInt("customer_id");
                float total_purchases = rs.getFloat("total_purchases");
                
                System.out.println( "customer_id: " + customer_id );
                System.out.println( "total_purchases: " + total_purchases );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void averagePrice(String line){
        String sql = "SELECT AVG(productPrice) AS average_price "
                + "FROM products "
                + "WHERE  productLine = ? ";
                
        try (Connection c = this.connect();
             PreparedStatement pstmt  = c.prepareStatement(sql)){
            
            // set the value
            pstmt.setString(1, line);
            //
            ResultSet rs  = pstmt.executeQuery();
            
            // loop through the result set
            while (rs.next()) {
                float average_price = rs.getFloat("average_price");
                
                System.out.println( "average_price: " + average_price );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void purchaseCategory(String category){
        String sql = "SELECT COUNT(customerID) AS num_of_customer "
                + "FROM orders JOIN products ON orders.productID = products.productID "
                + "WHERE products.productCategory = ? "
                + "AND orders.orderDate BETWEEN '2022-10-01' AND '2022-12-31'";
                
        try (Connection c = this.connect();
             PreparedStatement pstmt  = c.prepareStatement(sql)){
            
            // set the value
            pstmt.setString(1, category);
            //
            ResultSet rs  = pstmt.executeQuery();
            
            // loop through the result set
            while (rs.next()) {
                int num_of_customer = rs.getInt("num_of_customer");
                
                System.out.println( "num_of_customer: " + num_of_customer );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void mostPopular(String category){
        String sql = "SELECT orders.productID as product_id, productName as product_name, SUM(orderQuantity) AS total_quantity "
                + "FROM orders JOIN products ON orders.productID = products.productID "
                + "WHERE products.productCategory = ? "
                + "GROUP BY product_id ORDER BY total_quantity DESC "
                + "LIMIT 1";
                
        try (Connection c = this.connect();
             PreparedStatement pstmt  = c.prepareStatement(sql)){
            
            // set the value
            pstmt.setString(1, category);
            //
            ResultSet rs  = pstmt.executeQuery();
            
            // loop through the result set
            while (rs.next()) {
                int product_id = rs.getInt("product_id");
                String product_name = rs.getString("product_name");
                int current_stock = rs.getInt("total_quantity");
                
                System.out.println( "product_id: " + product_id );
                System.out.println( "product_name: " + product_name );
                System.out.println( "total_quantity: " + current_stock );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void monthlyRevenue(String month){
        String sql = "SELECT SUM(totalPrice) AS total_revenue "
                + "FROM orders "
                + "WHERE STRFTIME('%m', orderDate) = ? ";
                
        try (Connection c = this.connect();
             PreparedStatement pstmt  = c.prepareStatement(sql)){
            
            // set the value
            pstmt.setString(1, month);
            //
            ResultSet rs  = pstmt.executeQuery();
            
            // loop through the result set
            while (rs.next()) {
                float total_revenue = rs.getFloat("total_revenue");
                
                System.out.println( "total_revenue: " + total_revenue );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void inventoryValue(){
        String sql = "SELECT SUM((p.productPrice * p.stock) - o.totalPrice) AS current_inventory_value "
                + "FROM products p "
                + "LEFT JOIN (SELECT productID, SUM(totalPrice) AS totalPrice FROM orders GROUP BY productID) "
                + "o ON p.productID = o.productID WHERE p.stock > 0";
                
        try (Connection c = this.connect();
             PreparedStatement pstmt  = c.prepareStatement(sql)){
            
            //
            ResultSet rs  = pstmt.executeQuery();
            
            // loop through the result set
            while (rs.next()) {
                float current_inventory_value = rs.getFloat("current_inventory_value");
                
                System.out.println( "current_inventory_value: " + current_inventory_value );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void thresholdPurchase(float threshold){
        String sql = "SELECT COUNT(*) AS num_customers "
                + "FROM (SELECT customerID, SUM(totalPrice) AS total_purchases FROM orders GROUP BY customerID) o "
                + "JOIN customer c ON o.customerID = c.customerID "
                + "WHERE o.total_purchases > ?";
                
        try (Connection c = this.connect();
             PreparedStatement pstmt  = c.prepareStatement(sql)){
            
            // set the value
            pstmt.setFloat(1, threshold);
            
            //
            ResultSet rs  = pstmt.executeQuery();
            
            // loop through the result set
            while (rs.next()) {
                int num_customers = rs.getInt("num_customers");
                
                System.out.println( "num_customers: " + num_customers );
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void printOptions(LinkedHashMap<String, String> map){
        for (Map.Entry<String, String> entry : map.entrySet()) {
        String key = entry.getKey();
        String value = entry.getValue();
        System.out.println(key + " - " + value);
    }
    }
    public static void main(String[] args) {
        LinkedHashMap<String, String> options = new LinkedHashMap<String, String>();
        
        options.put("<query1>", "current stock level for a specific product");
        options.put("<query2>", "number of units of product were sold in a specific month");
        options.put("<query3>", "total revenue generated from sales of product in a specific category");
        options.put("<query4>", "customer has made the most purchases in a specific year");
        options.put("<query5>", "the average price of all products ina specific line");
        options.put("<query6>", "number of customers have made a purchase from a specific category in the past quarter");
        options.put("<query7>", "the most popular products in a specific category");
        options.put("<query8>", "the total number of returns for a spcific month");
        options.put("<query9>", "the current inventory value for all products in stock");
        options.put("<query10>", "number of customers have made a purchase over a certain price threshold");
        options.put("<exit>", "exit the program");
        
        FurnitureStore app = new FurnitureStore();
        
        System.out.println("Welcom to the furniture store database application:");
        
        while(true){
            Scanner input = new Scanner(System.in);
            System.out.println("***************************************************************************");
            System.out.println("Please enter your <query#> to query data or <options> to see query options");
            System.out.println("***************************************************************************");
            
            String query = input.nextLine();  // Read user input
            
            if(query.equals("exit")) {
                break;
            }
            else if(query.equals("options")){
                app.printOptions(options);
            }
            else if(query.equals("query1")) {
                Scanner getID = new Scanner(System.in);
                System.out.println("Please enter the productID, e.g. 11671");
                int productID = getID.nextInt();
                app.currentStock(productID);
            }
            else if(query.equals("query2")) {
                Scanner getID = new Scanner(System.in);
                System.out.println("Please enter the productID, e.g. 16831");
                int productID = getID.nextInt();
                
                Scanner getMonth = new Scanner(System.in);
                System.out.println("Please enter the month, e.g. 02");
                String month = getMonth.nextLine();
                app.totalSold(productID, month);
            }
            else if(query.equals("query3")) {
                Scanner getCategory = new Scanner(System.in);
                System.out.println("Please enter the product category, e.g. Living Room");
                String category = getCategory.nextLine();
                app.revenueCategory(category);
            }
            else if(query.equals("query4")) {
                Scanner getYear = new Scanner(System.in);
                System.out.println("Please enter the year, e.g. 2022");
                String year = getYear.nextLine();
                app.mostPurchasedCustomer(year);
            }
            else if(query.equals("query5")) {
                Scanner getLine = new Scanner(System.in);
                System.out.println("Please enter the product line, e.g. Chairs");
                String line = getLine.nextLine();
                app.averagePrice(line);
            }
            else if(query.equals("query6")) {
                Scanner getCategory = new Scanner(System.in);
                System.out.println("Please enter the product category, e.g. Living Room");
                String category = getCategory.nextLine();
                app.purchaseCategory(category);
            }
            else if(query.equals("query7")) {
                Scanner getCategory = new Scanner(System.in);
                System.out.println("Please enter the product category, e.g. Living Room");
                String category = getCategory.nextLine();
                app.mostPopular(category);
            }
            else if(query.equals("query8")) {
                Scanner getMonth = new Scanner(System.in);
                System.out.println("Please enter the month, e.g. 06");
                String month = getMonth.nextLine();
                app.monthlyRevenue(month);
            }
            else if(query.equals("query9")) {
                app.inventoryValue();
            }
            else if(query.equals("query10")) {
                Scanner getThreshold = new Scanner(System.in);
                System.out.println("Please enter the price threshold, e.g. 1000");
                float threshold = getThreshold.nextFloat();
                app.thresholdPurchase(threshold);
            }
            else {
                System.out.println("Invalid option!");
            }
        }
    }
}
