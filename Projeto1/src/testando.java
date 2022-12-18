public class testando {
    private int a, b;

    testando(int a, int b){
        this.a = a;
        this.b = b;
    }

    public int getA() {
        return a;
    }

    public int getB() {
        return b;
    }

    public void setA(int a) {
        this.a = a;
    }

    public void setB(int b) {
        this.b = b;
    }

    public int multiplicar(){
        int mult = this.a * this.b;
        System.out.println(mult);
        return mult;
    }
}
