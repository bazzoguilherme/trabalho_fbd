import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {
    public static userInterface userInterface = new userInterface();

    public static void main(String[] args) {
//        String pass = new userInterface().pedeSenha();

        postgreSQLConnection.conectar();
        try {
            ResultSet rs = postgreSQLManipulacoes.todasCategoriasFoneOuvido();

            while (rs.next()) {
                System.out.println(rs.getString("nomeCategoria"));
            }
        }catch (SQLException e){
            e.printStackTrace(System.err);
        }

        userInterface.closeInputScanner();
        postgreSQLConnection.desconectar();
    }
}
