package main;

public class ModelTabela {
    private String Nazwa1;
    private String Nazwa2;

    public ModelTabela(String nazwa1, String nazwa2) {
        this.Nazwa1 = nazwa1;
        this.Nazwa2 = nazwa2;
    }

    public String getNazwa1() {
        return Nazwa1;
    }

    public String getNazwa2() {
        return Nazwa2;
    }

}
