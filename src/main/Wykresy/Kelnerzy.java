package main.Wykresy;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.chart.PieChart;
import main.Connection.Polaczenie;
import main.ModelTabela;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Kelnerzy {

    public static ObservableList konwertujKelnerzy(ObservableList data){


        ArrayList lista = new ArrayList();

        try {
            Connection con = Polaczenie.connect();
            ResultSet rs = con.createStatement().executeQuery("select k.nazwisko, Count(z.id_kelnera) from kelnerzy k, zamowienia z where k.id_kelnera = z.id_kelnera group by z.id_kelnera, k.nazwisko order by z.id_kelnera DESC;");
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



    public static ObservableList<ModelTabela> daneKelnerzy() {



        ObservableList<ModelTabela> SpisKelnerzy = FXCollections.observableArrayList();

        try {
            Connection con = Polaczenie.connect();
            ResultSet rs = con.createStatement().executeQuery("select k.nazwisko, Count(z.id_kelnera) from kelnerzy k, zamowienia z where k.id_kelnera = z.id_kelnera group by z.id_kelnera, k.nazwisko order by z.id_kelnera DESC;");
            while (rs.next()){
                SpisKelnerzy.add(new ModelTabela(
                        rs.getString(1),
                        rs.getString(2)
                ));

            }
            con.close();
        }catch (Exception e){
            System.out.println(e);
        }

        return SpisKelnerzy;
    }

}
