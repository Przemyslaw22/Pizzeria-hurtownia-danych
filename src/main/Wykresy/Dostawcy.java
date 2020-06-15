package main.Wykresy;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.chart.PieChart;
import main.Connection.Polaczenie;
import main.ModelTabela;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Dostawcy {

    public static ObservableList konwertujDostawcy(ObservableList data){


        ArrayList lista = new ArrayList();

        try {
            Connection con = Polaczenie.connect();
            ResultSet rs = con.createStatement().executeQuery("select d.nazwisko, Count(z.id_dostawcy) from dostawcy d, zamowienia z where d.id_dostawcy = z.id_dostawcy group by z.id_dostawcy, d.nazwisko order by z.id_dostawcy DESC");
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



    public static ObservableList<ModelTabela> daneDostawcy() {



        ObservableList<ModelTabela> SpisDostawcy = FXCollections.observableArrayList();

        try {
            Connection con = Polaczenie.connect();
            ResultSet rs = con.createStatement().executeQuery("select d.nazwisko, Count(z.id_dostawcy) from dostawcy d, zamowienia z where d.id_dostawcy = z.id_dostawcy group by z.id_dostawcy, d.nazwisko order by z.id_dostawcy DESC;");
            while (rs.next()){
                SpisDostawcy.add(new ModelTabela(
                        rs.getString(1),
                        rs.getString(2)
                ));

            }
            con.close();
        }catch (Exception e){
            System.out.println(e);
        }

        return SpisDostawcy;
    }

}
