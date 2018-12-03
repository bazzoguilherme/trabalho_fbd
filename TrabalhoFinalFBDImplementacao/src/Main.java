import java.sql.ResultSet;
import java.sql.SQLException;

public class Main {
    public static userInterface userInterface = new userInterface();

    public static void main(String[] args) {
//        String pass = new userInterface().pedeSenha();

        postgreSQLConnection.conectar();

        userInterface.menu();

        userInterface.closeInputScanner();
        postgreSQLConnection.desconectar();
    }
}
