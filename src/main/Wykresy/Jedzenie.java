package main.Wykresy;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.chart.PieChart;
import main.Connection.Polaczenie;
import main.ModelTabela;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Jedzenie {

    public static ObservableList konwertujJedzenie(ObservableList data){


        ArrayList lista = new ArrayList();

        try {
            Connection con = Polaczenie.connect();
            ResultSet rs = con.createStatement().executeQuery("select count(z.id_produktu), p.nazwa from zamowienia_produkty z, produkty p where z.id_produktu = p.id_produktu and p.kategoria ='Jedzenie' group by z.id_produktu, p.nazwa order by z.id_produktu DESC;");
            while (rs.next()){
                lista.add(new PieChart.Data(
                        rs.getString(2),
                        rs.getDouble(1)
                ));

            }
            con.close();
        }catch (Exception e){
            System.out.println(e);
        }


        ObservableList out = FXCollections.observableArrayList(lista);
        return out;
    }



    public static ObservableList<ModelTabela> daneJedzenie() {



        ObservableList<ModelTabela> SpisJedzenia = FXCollections.observableArrayList();

        try {
            Connection con = Polaczenie.connect();
            ResultSet rs = con.createStatement().executeQuery("select count(z.id_produktu), p.nazwa from zamowienia_produkty z, produkty p where z.id_produktu = p.id_produktu and p.kategoria ='Jedzenie' group by z.id_produktu, p.nazwa order by z.id_produktu DESC;");
            while (rs.next()){
                SpisJedzenia.add(new ModelTabela(
                        rs.getString(1),
                        rs.getString(2)
                ));

            }
            con.close();
        }catch (Exception e){
            System.out.println(e);
        }

        return SpisJedzenia;
    }

}
