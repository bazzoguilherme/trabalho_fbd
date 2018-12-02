import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {
    public static userInterface userInterface = new userInterface();

    public static void main(String[] args) {
//        String pass = new userInterface().pedeSenha();

        postgreSQLConnection.conectar();

        String s = "SELECT MAX(salario) AS maxSalario FROM piloto WHERE companhia=?;";

        PreparedStatement stmt = null;
        try{
            stmt = postgreSQLConnection.getConn().prepareStatement(s);

            stmt.setString(1, "gol");
            System.out.println(stmt);
            ResultSet rs = stmt.executeQuery();

            while(rs.next()){
                System.out.println(rs.getInt("maxSalario"));
            }

        }catch (SQLException e){
            e.printStackTrace(System.err);
        }

        postgreSQLConnection.desconectar();
    }
}
