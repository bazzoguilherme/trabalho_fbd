import java.io.IOException;
import java.util.Scanner;

public class userInterface {
    private static Scanner input;

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

    public String pedeString(String pedido) {
        String entry;

        System.out.println("Informe " + pedido);
        entry = input.nextLine();

        return entry;
    }

    public String pedeSenha(){
        System.out.println("Informe a senha do Banco de Dados");
        char[] senhaChar = System.console().readPassword();
        return new String(senhaChar);
    }

}
