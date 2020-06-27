package main.Wykresy;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.scene.chart.PieChart;
import main.Connection.Polaczenie;
import main.ModelTabela;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Miejscowosci {

    public static String miejscowosc_Get;


    public static Boolean Sprawdz(String value){

        try{
            Connection con = Polaczenie.connect();
            ResultSet rs = con.createStatement().executeQuery("select miejscowosc from klienci where miejscowosc = '"+value+"'");
            if(rs.next()){
                miejscowosc_Get = value;
                return true;
            }else{
                return false;
            }
        }catch(Exception e){
            return false;
        }

    }


    public static ObservableList konwertujMiejscowosci(ObservableList data){


        ArrayList lista = new ArrayList();

        try {
            Connection con = Polaczenie.connect();
            ResultSet rs = con.createStatement().executeQuery
                    ("select EXTRACT(YEAR FROM zamowienia.data), sum(dane_produktow.cena)" +
                            "                    from dane_produktow, zamowienia, zamowienia_produkty, klienci, konta" +
                            "                    where zamowienia.id_zamowienia = zamowienia_produkty.id_zamowienia" +
                            "                    AND dane_produktow.id_produktu = zamowienia_produkty.id_produktu" +
                            "                    AND zamowienia.id_konta = konta.id_konta" +
                            "                    AND klienci.id_klienta = konta.id_klienta" +
                            "                    AND klienci.miejscowosc = '"+miejscowosc_Get+"'" +
                            "                    group by EXTRACT(YEAR FROM zamowienia.data)" +
                            "                    order by EXTRACT(YEAR FROM zamowienia.data) ASC");

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



    public static ObservableList<ModelTabela> daneMiejscowosci() {



        ObservableList<ModelTabela> SpisMiejscowosci = FXCollections.observableArrayList();

        try {
            Connection con = Polaczenie.connect();
            ResultSet rs = con.createStatement().executeQuery(
                    "select EXTRACT(YEAR FROM zamowienia.data), sum(dane_produktow.cena)\n" +
                            "from dane_produktow, zamowienia, zamowienia_produkty, klienci, konta\n" +
                            "where zamowienia.id_zamowienia = zamowienia_produkty.id_zamowienia\n" +
                            "AND dane_produktow.id_produktu = zamowienia_produkty.id_produktu\n" +
                            "AND zamowienia.id_konta = konta.id_konta\n" +
                            "AND klienci.id_klienta = konta.id_klienta\n" +
                            "AND klienci.miejscowosc = '"+miejscowosc_Get+"'\n" +
                            "group by rollup(EXTRACT(YEAR FROM zamowienia.data))\n" +
                            "order by EXTRACT(YEAR FROM zamowienia.data) ASC");
            while (rs.next()){
                SpisMiejscowosci.add(new ModelTabela(
                        rs.getString(1),
                        rs.getString(2)
                ));

            }
            con.close();
        }catch (Exception e){
            System.out.println(e);
        }

        return SpisMiejscowosci;
    }

}
