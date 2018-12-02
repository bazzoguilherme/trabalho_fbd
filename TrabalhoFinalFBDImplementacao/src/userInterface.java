import java.io.IOException;
import java.util.Scanner;

public class userInterface {
    private static Scanner input;
    private static final String MANIPULACAO01 = "";
    private static final String MANIPULACAO02 = "";
    private static final String MANIPULACAO03 = "";
    private static final String MANIPULACAO04 = "";

    public userInterface(){
        input = new Scanner(System.in);
    }

    public void closeInputScanner(){
        input.close();
    }

    public static void limpaTela(){
        try {
            new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor();
        } catch (InterruptedException e) {
//			e.printStackTrace();
        } catch (IOException e) {
//			e.printStackTrace();
        }
    }

    public static void menu(){
        
    }

    private static void imprimeOpcoesManipulacoes(){
        System.out.println(MANIPULACAO01);
        System.out.println(MANIPULACAO02);
        System.out.println(MANIPULACAO03);
    }

    public String pedeString(String pedido) {
        String entry;

        System.out.println("Informe " + pedido);
        entry = input.nextLine();

        return entry;
    }

    public int pedeInt(String pedido) {

        int num = 0;

        System.out.println("Informe " + pedido);
        num = this.pedeInt();

        return num;
    }

    private int pedeInt(){
        String entry;
        boolean entradaAceita;
        int num = 0;

        do {
            entradaAceita = true;
            try {
                entry = input.nextLine();
                num = Integer.parseInt(entry);
            } catch (java.lang.NumberFormatException e) {
                entradaAceita = false;
                System.out.println("Valor invalido. Digite novamente, por favor: ");
            }
        }while(!entradaAceita);

        return num;
    }

    public String pedeSenha(){
        System.out.println("Informe a senha do Banco de Dados");
        char[] senhaChar = System.console().readPassword();
        return new String(senhaChar);
    }

}
