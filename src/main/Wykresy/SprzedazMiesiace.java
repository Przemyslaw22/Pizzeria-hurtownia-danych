package main.Wykresy;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.chart.PieChart;
import main.Connection.Polaczenie;
import main.ModelTabela;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SprzedazMiesiace {

    public static int rok_Get;


    public static Boolean Sprawdz(String value){
        try{
            int ddd = Integer.parseInt(value);
            Connection con = Polaczenie.connect();
            ResultSet rs = con.createStatement().executeQuery("select EXTRACT(YEAR FROM data) from zamowienia where EXTRACT(YEAR FROM data) = "+ddd);
            if(rs.next()){
                rok_Get = ddd;
                return true;
            }else{
                return false;
            }
        }catch(Exception e){
            return false;
        }

    }


    public static ObservableList konwertujSprzedazMiesiace(ObservableList data){


        ArrayList lista = new ArrayList();

        try {
            Connection con = Polaczenie.connect();
            ResultSet rs = con.createStatement().executeQuery("select EXTRACT(MONTH from data), count(id_zamowienia) from zamowienia where EXTRACT(YEAR from data) = "+rok_Get+" group by EXTRACT(MONTH from data) order by EXTRACT(MONTH from data) ASC");
            while (rs.next()){
                lista.add(new PieChart.Data(
                        rs.getString(1),
                        rs.getDouble(2)
                ));

            }
            con.close();
        }catch (Exception e){
            System.out.println(e);
        }


        ObservableList out = FXCollections.observableArrayList(lista);
        return out;
    }



    public static ObservableList<ModelTabela> daneSprzedazMiesiace() {



        ObservableList<ModelTabela> SpisSprzedazMiesiace = FXCollections.observableArrayList();

        try {
            Connection con = Polaczenie.connect();
            ResultSet rs = con.createStatement().executeQuery("select EXTRACT(MONTH from data), count(id_zamowienia) \n" +
                    "from zamowienia \n" +
                    "where EXTRACT(YEAR from data) = "+rok_Get+" \n" +
                    "group by ROLLUP(EXTRACT(MONTH from data)) \n" +
                    "order by EXTRACT(MONTH from data) ASC");
            while (rs.next()){
                SpisSprzedazMiesiace.add(new ModelTabela(
                        rs.getString(1),
                        rs.getString(2)
                ));

            }
            con.close();
        }catch (Exception e){
            System.out.println(e);
        }

        return SpisSprzedazMiesiace;
    }

}
