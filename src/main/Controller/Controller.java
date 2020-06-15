package main.Controller;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.chart.PieChart;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import main.*;
import main.SQLdata.BasicTools;
import main.SQLdata.SQLDataImporter;
import main.Wykresy.*;
import weka.associations.Apriori;
import weka.core.Instances;
import weka.core.Utils;

import java.net.URL;
import java.util.ArrayList;
import java.util.ResourceBundle;

import static main.Wykresy.Dostawcy.konwertujDostawcy;
import static main.Wykresy.Jedzenie.konwertujJedzenie;
import static main.Wykresy.Kelnerzy.konwertujKelnerzy;
import static main.Wykresy.Napoje.konwertujNapoje;
import static main.Wykresy.SprzedazMiesiace.konwertujSprzedazMiesiace;
import static main.Wykresy.WysSprzedazy.konwertujWysSprzedazy;

public class Controller implements Initializable {

    @FXML
    public TableView<ModelTabela> table;
    @FXML
    public TableColumn<ModelTabela, String> kol_1;
    @FXML
    public TableColumn<ModelTabela, String> kol_2;
    @FXML
    public PieChart wykres;
    @FXML
    public TextField sprzedaz_miesiace;
    @FXML
    public TextField wys_sprzedazy;
    @FXML
    public TextField miejscowosci_text;
    @FXML
    public Button generuj_miejscowosci;
    @FXML
    public TextArea associationData;

    String rok;

    ObservableList<ModelTabela> oblist = FXCollections.observableArrayList();


    public void setGeneruj_miejscowosci(Button generuj_miejscowosci) {
        this.generuj_miejscowosci = generuj_miejscowosci;
        generuj_miejscowosci.setVisible(false);
    }

    @Override
    public void initialize(URL url, ResourceBundle rb) {

        double minSupp = 0.2;
        double minRules = 1;
        double minMetric = 0.05;

        try {
            String username = "postgres";
            String password = "";

            String query =
                    "SELECT STRING_AGG(p.nazwa, ', ')\n" +
                            "FROM produkty p\n" +
                            "JOIN zamowienia_produkty zp ON p.ID_produktu = zp.ID_produktu\n" +
                            "JOIN zamowienia zam ON zp.ID_zamowienia = zam.ID_zamowienia\n" +
                            "GROUP BY p.nazwa\n" +
                            "ORDER BY p.nazwa";

            Instances data = SQLDataImporter.getDataSetFromPostgreSQL(username, password, query, 0);
            String fileName = "./src/main/data/Apriori.arff";
            BasicTools.saveData(data, fileName);
            BasicTools.processToApriori(data);
            data = BasicTools.loadData(fileName);
            data.setClassIndex(data.numAttributes() - 1);

            String[] options = Utils.splitOptions("-N 1 -C 0.2 -M 0.05");
            Apriori apriori = new Apriori();
            apriori.setOptions(options);
            apriori.buildAssociations(data);



            System.out.println(apriori.toString());
            associationData.setText(apriori.toString());
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
        }
    }




    /**
     * Wypelnianie tabeli
     */

    public void wyczysc(){

        kol_1.setCellValueFactory(new PropertyValueFactory<>("Nazwa1"));
        kol_1.setText("Kolumna 1");
        kol_2.setCellValueFactory(new PropertyValueFactory<>("Nazwa2"));
        kol_2.setText("Kolumna 2");

        table.setItems(null);

    }

    public void wypelnijJedzenie(){

        kol_1.setCellValueFactory(new PropertyValueFactory<>("Nazwa1"));
        kol_1.setText("Ilość");
        kol_2.setCellValueFactory(new PropertyValueFactory<>("Nazwa2"));
        kol_2.setText("Nazwa");

        table.setItems(Jedzenie.daneJedzenie());
    }
    public void wypelnijNapoje(){

        kol_1.setCellValueFactory(new PropertyValueFactory<>("Nazwa1"));
        kol_1.setText("Ilość");
        kol_2.setCellValueFactory(new PropertyValueFactory<>("Nazwa2"));
        kol_2.setText("Nazwa");

        table.setItems(Napoje.daneNapoje());
    }

    public void wypelnijKelnerzy(){

        kol_1.setCellValueFactory(new PropertyValueFactory<>("Nazwa1"));
        kol_1.setText("Nazwisko");
        kol_2.setCellValueFactory(new PropertyValueFactory<>("Nazwa2"));
        kol_2.setText("Ilość");

        table.setItems(Kelnerzy.daneKelnerzy());
    }
    public void wypelnijDostawcy(){

        kol_1.setCellValueFactory(new PropertyValueFactory<>("Nazwa1"));
        kol_1.setText("Nazwisko");
        kol_2.setCellValueFactory(new PropertyValueFactory<>("Nazwa2"));
        kol_2.setText("Ilość");

        table.setItems(Dostawcy.daneDostawcy());
    }
    public void wypelnijSprzedazMiesiace(){

        kol_1.setCellValueFactory(new PropertyValueFactory<>("Nazwa1"));
        kol_1.setText("Miesiąc");
        kol_2.setCellValueFactory(new PropertyValueFactory<>("Nazwa2"));
        kol_2.setText("Ilość");

        table.setItems(SprzedazMiesiace.daneSprzedazMiesiace());
    }
    public void wypelnijWysSprzedazy(){

        kol_1.setCellValueFactory(new PropertyValueFactory<>("Nazwa1"));
        kol_1.setText("Miesiąc");
        kol_2.setCellValueFactory(new PropertyValueFactory<>("Nazwa2"));
        kol_2.setText("Suma");
        table.setItems(WysSprzedazy.daneWysSprzedazy());
    }
    public void wypelnijMiejscowosci(){

        kol_1.setCellValueFactory(new PropertyValueFactory<>("Nazwa1"));
        kol_1.setText("Rok");
        kol_2.setCellValueFactory(new PropertyValueFactory<>("Nazwa2"));
        kol_2.setText("Suma");

        table.setItems(Miejscowosci.daneMiejscowosci());
    }


    /**
     * akcje buttonów
     *
     */


    public void handleJedzenieBTAction(MouseEvent mouseEvent) {
        wypelnijJedzenie();
        wykres.dataProperty().set(konwertujJedzenie(oblist));
    }
    public void handleNapojeBTAction(MouseEvent mouseEvent) {
        wypelnijNapoje();
        wykres.dataProperty().set(konwertujNapoje(oblist));
    }
    public void handleKelnerzyBTAction(MouseEvent mouseEvent) {
        wypelnijKelnerzy();
        wykres.dataProperty().set(konwertujKelnerzy(oblist));
    }
    public void handleDostawcyBTAction(MouseEvent mouseEvent) {
        wypelnijDostawcy();
        wykres.dataProperty().set(konwertujDostawcy(oblist));
    }
    public void handleGenerujMiesiaceBTAction(MouseEvent mouseEvent) {

        rok = sprzedaz_miesiace.getText();
        if(SprzedazMiesiace.Sprawdz(rok)){
            wypelnijSprzedazMiesiace();
            wykres.dataProperty().set(konwertujSprzedazMiesiace(oblist));

        }else{
            Alert alert = new Alert(Alert.AlertType.WARNING);
            alert.setTitle("Warning");
            alert.setHeaderText("Wykryto błąd!");
            alert.setContentText("Wprowadziłeś niepoprawne dane.");

            alert.showAndWait();
        }

    }


    public void handleGenerujSprzedazBTAction(MouseEvent mouseEvent) {
        rok = wys_sprzedazy.getText();
        if(WysSprzedazy.Sprawdz(rok)){
            wypelnijWysSprzedazy();
            wykres.dataProperty().set(konwertujWysSprzedazy(oblist));

        }else{
            Alert alert = new Alert(Alert.AlertType.WARNING);
            alert.setTitle("Warning");
            alert.setHeaderText("Wykryto błąd!");
            alert.setContentText("Wprowadziłeś niepoprawne dane.");

            alert.showAndWait();
        }
    }
    public void handleMiejscowosciBTAction(MouseEvent mouseEvent) {
        rok = miejscowosci_text.getText();
        System.out.println(rok);
        if(Miejscowosci.Sprawdz(rok)){
            wypelnijMiejscowosci();
            wykres.dataProperty().set(Miejscowosci.konwertujMiejscowosci(oblist));

        }else{
            Alert alert = new Alert(Alert.AlertType.WARNING);
            alert.setTitle("Warning");
            alert.setHeaderText("Wykryto błąd!");
            alert.setContentText("Wprowadziłeś niepoprawne dane.");

            alert.showAndWait();
        }
    }

    public void handleWyczyscBTAction(MouseEvent mouseEvent) {
        wyczysc();
        oblist.clear();
        wykres.dataProperty().set(Wyczysc.konwertujWyczysc(oblist));
    }

    public void handleRegulyModulBTAction(MouseEvent mouseEvent) {
        wyczysc();
        oblist.clear();
        wykres.dataProperty().set(Wyczysc.konwertujWyczysc(oblist));
    }


}
