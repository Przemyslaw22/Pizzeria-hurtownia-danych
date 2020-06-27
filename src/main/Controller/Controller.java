package main.Controller;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.layout.Pane;
import javafx.scene.chart.PieChart;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;
import main.*;
import main.SQLdata.BasicTools;
import main.SQLdata.SQLDataImporter;
import main.Wykresy.*;
import weka.associations.Apriori;
import weka.associations.AssociationRule;
import weka.associations.AssociationRules;
import weka.associations.Item;
import weka.core.Instances;
import weka.core.Utils;

import javax.swing.text.LabelView;
import java.net.URL;
import java.util.*;

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
    public Button dane_regul;
    @FXML
    public Pane panel_glowny;
    @FXML
    public TextField minRules;
    @FXML
    public TextField minSupp;
    @FXML
    public TextField minMetric;
    @FXML
    public Label srodek_tekst;
    @FXML
    public TextArea reguly_area;
    @FXML
    public LabelView kolumny;



    String rok;

    ObservableList<ModelTabela> oblist = FXCollections.observableArrayList();


    public void setGeneruj_miejscowosci(Button generuj_miejscowosci) {
        this.generuj_miejscowosci = generuj_miejscowosci;
        generuj_miejscowosci.setVisible(false);
    }

    public void przygotuj_glowna(){
        minMetric.setVisible(false);
        minSupp.setVisible(false);
        minRules.setVisible(false);
        dane_regul.setVisible(false);
        reguly_area.setVisible(false);
        srodek_tekst.setText("Wykres");
        srodek_tekst.setLayoutX(620.0);
        table.setVisible(true);
        wykres.setVisible(true);

    }

    public void przygotuj_reguly(){
        minMetric.setVisible(true);
        minSupp.setVisible(true);
        minRules.setVisible(true);
        dane_regul.setVisible(true);
        reguly_area.setVisible(true);
        table.setVisible(false);
        srodek_tekst.setText("Reguły");
        srodek_tekst.setLayoutX(750.0);
        wykres.setVisible(false);
    }

    public void przeladuj(){
        try {
            BasicTools.processToApriori();
            String fileName = "./src/main/data/Apriori.arff"; //Lokalizacja pliku z danymi
            Instances data = BasicTools.loadData(fileName);
            data.setClassIndex(data.numAttributes() - 1);

            String s = "-N ";
            StringBuilder sB = new StringBuilder(s);

            if (minRules.getText().isEmpty()) {
                sB.append(5);
            }else {
                sB.append(minRules.getText());
            }
            sB.append(" -C ");
            if (minSupp.getText().isEmpty()) {
                sB.append(0.2);
            }else {
                sB.append(minSupp.getText());
            }
            sB.append(" -M ");
            if (minMetric.getText().isEmpty()) {
                sB.append(0.01);
            }else {
                sB.append(minMetric.getText());
            }


            String[] options = Utils.splitOptions(sB.toString());
            Apriori apriori = new Apriori();
            apriori.setOptions(options);
            apriori.buildAssociations(data);

            reguly_area.setText(apriori.toString());
            System.out.println(apriori.toString());


        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        przygotuj_glowna();

    }




    /**
     * Wypelnianie tabeli
     */

    public void wyczysc(){

        kol_1.setCellValueFactory(new PropertyValueFactory<>("Nazwa1"));
        kol_1.setText("Kolumna 1");
        kol_2.setCellValueFactory(new PropertyValueFactory<>("Nazwa2"));
        kol_2.setText("Kolumna 2");
        przygotuj_glowna();
        table.setItems(null);

    }

    public void wypelnijJedzenie(){

        kol_1.setCellValueFactory(new PropertyValueFactory<>("Nazwa1"));
        kol_1.setText("Ilość");
        kol_2.setCellValueFactory(new PropertyValueFactory<>("Nazwa2"));
        kol_2.setText("Nazwa");
        przygotuj_glowna();
        table.setItems(Jedzenie.daneJedzenie());
    }
    public void wypelnijNapoje(){

        kol_1.setCellValueFactory(new PropertyValueFactory<>("Nazwa1"));
        kol_1.setText("Ilość");
        kol_2.setCellValueFactory(new PropertyValueFactory<>("Nazwa2"));
        kol_2.setText("Nazwa");
        przygotuj_glowna();
        table.setItems(Napoje.daneNapoje());
    }

    public void wypelnijKelnerzy(){

        kol_1.setCellValueFactory(new PropertyValueFactory<>("Nazwa1"));
        kol_1.setText("Nazwisko");
        kol_2.setCellValueFactory(new PropertyValueFactory<>("Nazwa2"));
        kol_2.setText("Ilość");
        przygotuj_glowna();
        table.setItems(Kelnerzy.daneKelnerzy());
    }
    public void wypelnijDostawcy(){

        kol_1.setCellValueFactory(new PropertyValueFactory<>("Nazwa1"));
        kol_1.setText("Nazwisko");
        kol_2.setCellValueFactory(new PropertyValueFactory<>("Nazwa2"));
        kol_2.setText("Ilość");
        przygotuj_glowna();
        table.setItems(Dostawcy.daneDostawcy());
    }
    public void wypelnijSprzedazMiesiace(){

        kol_1.setCellValueFactory(new PropertyValueFactory<>("Nazwa1"));
        kol_1.setText("Miesiąc");
        kol_2.setCellValueFactory(new PropertyValueFactory<>("Nazwa2"));
        kol_2.setText("Ilość");
        przygotuj_glowna();
        table.setItems(SprzedazMiesiace.daneSprzedazMiesiace());
    }
    public void wypelnijWysSprzedazy(){

        kol_1.setCellValueFactory(new PropertyValueFactory<>("Nazwa1"));
        kol_1.setText("Miesiąc");
        kol_2.setCellValueFactory(new PropertyValueFactory<>("Nazwa2"));
        kol_2.setText("Suma");
        przygotuj_glowna();
        table.setItems(WysSprzedazy.daneWysSprzedazy());
    }
    public void wypelnijMiejscowosci(){

        kol_1.setCellValueFactory(new PropertyValueFactory<>("Nazwa1"));
        kol_1.setText("Rok");
        kol_2.setCellValueFactory(new PropertyValueFactory<>("Nazwa2"));
        kol_2.setText("Suma");
        przygotuj_glowna();
        table.setItems(Miejscowosci.daneMiejscowosci());
    }


    /**
     * akcje buttonów
     *
     */

    public void handleRegulyModulBTAction(MouseEvent mouseEvent) {

        wyczysc();
        wykres.setVisible(false);
        reguly_area.setEditable(false);
        przygotuj_reguly();

    }

    public void handleGenerujRegulyBTAction(MouseEvent mouseEvent) {
        przeladuj();
    }

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




}
