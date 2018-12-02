import java.sql.*;

public abstract class postgreSQLConnection {
    private static Connection conn = null;

    static final String JDBC_DRIVER = "org.postgresql.Driver";
    static final String DB_URL = "jdbc:postgresql://localhost:5432/ecommerce";
    static final String USER = "trabalhoFBD";
    static final String PASSWORD = "senhafinalFBD";

    public static void conectar(String password){
        try{
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, password);
        } catch (SQLException e){
            e.printStackTrace(System.err);
        } catch (Exception e){
            e.printStackTrace(System.err);
        }
    }

    public static void conectar(){
        try{
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
        } catch (SQLException e){
            e.printStackTrace(System.err);
        } catch (Exception e){
            e.printStackTrace(System.err);
        }
    }

    public static void desconectar(){
        try{
            conn.close();
        } catch (SQLException e){
            e.printStackTrace(System.err);
        }
    }

    public static Connection getConn(){
        try {
            if (conn != null && !conn.isClosed()) {
                return conn;
            } else {
                conectar();
                return conn;
            }
        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }
        return null;
    }
}
