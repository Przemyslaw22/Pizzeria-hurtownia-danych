package main.SQLdata;

import weka.core.Instances;
import weka.core.converters.ArffLoader;
import weka.core.converters.ArffSaver;
import weka.core.converters.CSVLoader;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;


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

    static public void processToApriori(Instances data) throws Exception {
        String username = "postgres";
        String password = "";
        String query = "SELECT nazwa FROM produkty";

        Instances uslugi = SQLDataImporter.getDataSetFromPostgreSQL(username, password, query, 0);

        ArrayList<String> services = new ArrayList<String>(uslugi.size());
        for (int i = 0; i < uslugi.size(); i++)  {
            services.add(uslugi.get(i).toString().replace("'", ""));
        }

        ArrayList<String> dataOut = new ArrayList<String>();

        for (int i = 0; i < data.size(); i++) {

            String s = "";
            StringBuilder sB = new StringBuilder(s);

            for (int j = 0; j < services.size(); j++) {
                if (data.get(i).toString().contains(services.get(j)))
                    sB.append("t,");
                else if (j == services.size() - 1)
                    sB.append("?");
                else
                    sB.append("?,");
            }

            if (sB.length() == 22)   sB.deleteCharAt(sB.length() - 1);

            s = sB.toString();
            dataOut.add(s);

        }
        String filename = "./src/main/data/Apriori.arff";
        PrintWriter out = new PrintWriter(filename);
        out.println("@relation produkty");
        out.println();
        for (int i = 0; i < services.size(); i++) {
            out.println("@attribute '" + services.get(i) + "' {t}");
        }
        out.println();
        out.println("@data");
        for (int i = 0; i < dataOut.size(); i++) {
            out.println(dataOut.get(i));
        }
        out.close();

    }
}