package main.SQLdata;


import weka.core.Instances;
import weka.core.converters.ArffLoader;
import weka.core.converters.ArffSaver;
import weka.core.converters.CSVLoader;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Scanner;

public class BasicTools {

    public static Instances loadData(String fileName) throws IOException {
        ArffLoader loader = new ArffLoader();
        loader.setFile(new File(fileName));
        return loader.getDataSet();
    }

    public static void importCSVtoARFF(String fileNameCSV,String fileNameARFF) throws IOException {
        CSVLoader loader = new CSVLoader();
        loader.setSource(new File(fileNameCSV));
        Instances data = loader.getDataSet();
        saveData(data,fileNameARFF);
    }

    public static void saveData(Instances data,String fileName) throws IOException {
        ArffSaver saver = new ArffSaver();
        saver.setFile(new File(fileName));
        saver.setInstances(data);
        saver.writeBatch();
    }

        public static void processToApriori() throws FileNotFoundException {


        String filename = "./src/main/data/Apriori.arff";
        PrintWriter out = new PrintWriter(filename);
        out.println("@relation Apriori");
        out.println();
        out.println("@attribute 'produkt1' {Umberto,Romana,Hawajska,Czekoladowa,Meksykańska,Feta,Neapolitana,Kebab,Margherita,Vesuvio,Primavera,Vegetariana,Diablo,Frytki,Carbonara,Hamburger,Zapiekanka,Tortilla,Cola,Sprite,Mirinda,Woda,Piwo,RedBull,Sok}");
        out.println();
        out.println("@attribute 'produkt2' {?,Umberto,Romana,Hawajska,Czekoladowa,Meksykańska,Feta,Neapolitana,Kebab,Margherita,Vesuvio,Primavera,Vegetariana,Diablo,Frytki,Carbonara,Hamburger,Zapiekanka,Tortilla,Cola,Sprite,Mirinda,Woda,Piwo,RedBull,Sok}\n");
        out.println();
        out.println("@data");
            File id = new File("src/main/data/id.txt");
            File produkty = new File("src/main/data/produkty.txt");
            Scanner odczyt_id = new Scanner(id);
            Scanner odczyt_produkty = new Scanner(produkty);
            int linijka1;
            int x;
            String linijka2 = "";


            for(int i=0; i<165; i++) {
                linijka1 = odczyt_id.nextInt();
                x = odczyt_id.nextInt();
                linijka2 = odczyt_produkty.nextLine();
                if(linijka1 == x){
                    out.println(linijka2 + "," + odczyt_produkty.nextLine());
                }else{
                    out.println(linijka2 + ",?");
                }

            }
        out.close();
    }
}
