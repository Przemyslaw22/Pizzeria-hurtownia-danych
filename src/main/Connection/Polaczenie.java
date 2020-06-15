package main.Connection;

import java.sql.*;


public class Polaczenie {

    public static Connection connect(){
    Connection con = null;

    try{
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/pizzeria","postgres","");

        if(con!=null){
            System.out.println("Połączono z bazą");

        }else{
            System.out.println("Połączenie nieudane");
        }



        return con;

    } catch(Exception e){
        System.out.println(e);
    }
       return null;
    }

}
