import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {
    public static userInterface userInterface = new userInterface();
    public static postgreSQLConnection postgreConnection = new postgreSQLConnection();

    public static void main(String[] args) {
//        String pass = new userInterface().pedeSenha();
        postgreConnection.connectar();

        String s = "SELECT MAX(salario) AS maxSalario FROM piloto WHERE companhia=?;";

        PreparedStatement stmt = null;
        try{
            stmt = postgreConnection.getConn().prepareStatement(s);

            stmt.setString(1, "gol");
            System.out.println(stmt);
            ResultSet rs = stmt.executeQuery();

            while(rs.next()){
                System.out.println(rs.getInt("maxSalario"));
            }

        }catch (SQLException e){
            e.printStackTrace(System.err);
        }

        postgreConnection.desconectar();
    }
}
