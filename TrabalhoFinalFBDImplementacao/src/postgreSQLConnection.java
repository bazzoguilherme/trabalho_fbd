import java.sql.*;

public class postgreSQLConnection {
    private static Connection conn = null;

    static final String JDBC_DRIVER = "org.postgresql.Driver";
    static final String DB_URL = "jdbc:postgresql://localhost:5432/aeroporto";
    static final String USER = "guilherme";
    static final String PASSWORD = "xxx";

    public void connectar(String password){
        try{
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, password);
        } catch (SQLException e){
            e.printStackTrace(System.err);
        } catch (Exception e){
            e.printStackTrace(System.err);
        }
    }

    public void connectar(){
        try{
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
        } catch (SQLException e){
            e.printStackTrace(System.err);
        } catch (Exception e){
            e.printStackTrace(System.err);
        }
    }

    public void desconectar(){
        try{
            conn.close();
        } catch (SQLException e){
            e.printStackTrace(System.err);
        }
    }

    public Connection getConn(){
        try {
            if (conn != null && !conn.isClosed()) {
                return conn;
            } else {
                this.connectar();
                return conn;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }
        return null;
    }
}
