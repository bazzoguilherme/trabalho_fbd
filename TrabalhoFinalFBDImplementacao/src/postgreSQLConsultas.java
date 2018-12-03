import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public abstract class postgreSQLConsultas {
    public static ResultSet consulta1(int quantidadeProdutoAnalise){
        String s = "SELECT nomeParceiro "
                 + "FROM PARCEIRO JOIN PRODUTO ON(cnpj = cnpjVendedor) NATURAL JOIN COMPRA "
                 + "GROUP BY nomeParceiro "
                 + "HAVING COUNT(DISTINCT codProduto) >= ?;";

        PreparedStatement stmt = null;

        try{
            stmt = postgreSQLConnection.getConn().prepareStatement(s);

            stmt.setInt(1, quantidadeProdutoAnalise);

            ResultSet rs = stmt.executeQuery();

            return rs;

        }catch (SQLException e){
            e.printStackTrace(System.err);
        }

        return null;

    }

    public static ResultSet consulta2(){

        String s = "SELECT DISTINCT nomeProduto, nomeCategoria "
                 + "FROM produto P NATURAL JOIN categoria "
                 + "WHERE idCategoria != 'ct03' AND NOT EXISTS (SELECT * "
                                                             + "FROM caracterizacao "
                                                             + "WHERE idCategoria = 'ct03' AND idPropriedade NOT IN(SELECT DISTINCT idPropriedade "
                                                                                                                 + "FROM caracterizacao "
                                                                                                                 + "WHERE idCategoria = P.idCategoria));";

        PreparedStatement stmt = null;

        try{
            stmt = postgreSQLConnection.getConn().prepareStatement(s);

            ResultSet rs = stmt.executeQuery();

            return rs;

        }catch (SQLException e){
            e.printStackTrace(System.err);
        }

        return null;
    }

    public static ResultSet consulta3(){

        String s = "SELECT nomeParceiro "
                 + "FROM  parceiro JOIN produto ON(cnpj = cnpjVendedor) NATURAL JOIN avaliacao "
                 + "WHERE idCategoria = 'ct10' AND nota = (SELECT MAX(nota) "
                                                         + "FROM produto NATURAL JOIN avaliacao "
                                                         + "WHERE idCategoria = 'ct10');";

        PreparedStatement stmt = null;


        try{
            stmt = postgreSQLConnection.getConn().prepareStatement(s);

            ResultSet rs = stmt.executeQuery();

            return rs;

        }catch (SQLException e){
            e.printStackTrace(System.err);
        }

        return null;
    }

    public static ResultSet consulta4(){

        String s = "SELECT DISTINCT email "
                 + "FROM cliente NATURAL JOIN pedido NATURAL JOIN compra NATURAL JOIN produto "
                 + "WHERE marca = 'BRASTEMP' AND preco >= (SELECT AVG(preco) "
                                                        + "FROM compra NATURAL JOIN produto "
                                                        + "WHERE marca = 'BRASTEMP');";

        PreparedStatement stmt = null;

        try{
            stmt = postgreSQLConnection.getConn().prepareStatement(s);

            ResultSet rs = stmt.executeQuery();

            return rs;

        }catch (SQLException e){
            e.printStackTrace(System.err);
        }

        return null;
    }

    public static ResultSet consulta5() {

        String s = "SELECT DISTINCT codProduto, nomeProduto "
                 + "FROM produto NATURAL JOIN oferta "
                 + "WHERE desconto >= 5 AND codProduto IN(SELECT DISTINCT codProduto "
                                                + "FROM produto NATURAL JOIN cupom_de_desconto "
                                                + "WHERE desconto >= 5);";

        PreparedStatement stmt = null;
        try {
            stmt = postgreSQLConnection.getConn().prepareStatement(s);

            ResultSet rs = stmt.executeQuery();

            return rs;

        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }

        return null;
    }

    public static ResultSet consulta6(){

        String s = "SELECT distinct nomeParceiro, telefone, codProduto "
                 + "FROM PARCEIRO JOIN PRODUTO ON(cnpj = cnpjVendedor) "
                 + "WHERE codProduto IN (SELECT DISTINCT codProduto "
                                        + "FROM PRODUTO JOIN SELECAO USING(codProduto)"
                                        + "GROUP BY codProduto "
                                        + "HAVING SUM(quantidade) > estoque);";

        PreparedStatement stmt = null;
        try {
            stmt = postgreSQLConnection.getConn().prepareStatement(s);

            ResultSet rs = stmt.executeQuery();

            return rs;

        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }

        return null;

    }

    public static ResultSet consultaExemploGatilho1(){

        String s = "SELECT idAvaliacao, codProduto, cpf "
                 + "FROM AVALIACAO;";

        PreparedStatement stmt = null;
        try {
            stmt = postgreSQLConnection.getConn().prepareStatement(s);

            ResultSet rs = stmt.executeQuery();

            return rs;

        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }

        return null;

    }

    public static ResultSet consultaExemploGatilho2_1(){

        String s = "SELECT codProduto, estoque "
                 + "FROM PRODUTO;";

        PreparedStatement stmt = null;
        try {
            stmt = postgreSQLConnection.getConn().prepareStatement(s);

            ResultSet rs = stmt.executeQuery();

            return rs;

        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }

        return null;

    }

    public static ResultSet consultaExemploGatilho2_2(){

        String s = "SELECT codProduto, numeroPedido, numeroNotaFiscal "
                 + "FROM COMPRA;";

        PreparedStatement stmt = null;
        try {
            stmt = postgreSQLConnection.getConn().prepareStatement(s);

            ResultSet rs = stmt.executeQuery();

            return rs;

        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }

        return null;

    }


    public static void exemploProcedimento1(){
        String s = "INSERT into AVALIACAO values('a013', '2000-05-05', 3, 't',  '01262510965', 'pr00000001');";

        Statement stmt = null;
        try {
            stmt = postgreSQLConnection.getConn().createStatement();

            stmt.executeUpdate(s);

        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }
    }

    public static void exemploProcedimento2_1(){
        String s = "INSERT into COMPRA values('pr00000001', 'pd00000002', 40, 290, 'n100000000');";

        Statement stmt = null;
        try {
            stmt = postgreSQLConnection.getConn().createStatement();

            stmt.executeUpdate(s);

        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }
    }

    public static void exemploProcedimento2_2(){
        String s = "INSERT into COMPRA values('pr00000001', 'pd00000002', 2, 290, 'n100000000');";

        Statement stmt = null;
        try {
            stmt = postgreSQLConnection.getConn().createStatement();

            stmt.executeUpdate(s);

        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }
    }

}
