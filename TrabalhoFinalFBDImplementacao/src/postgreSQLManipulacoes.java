import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public abstract class postgreSQLManipulacoes {
    public static ResultSet parceirosVendaMaiorXProd(int quantidadeProdutoAnalise){
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

    public static ResultSet todasCategoriasFoneOuvido(){

        String s = "SELECT DISTINCT nomeCategoria "
                 + "FROM CATEGORIA C "
                 + "WHERE idCategoria != 'ct03' AND NOT EXISTS (SELECT * "
                                                             + "FROM CARACTERIZACAO "
                                                             + "WHERE idCategoria = 'ct03' AND idPropriedade NOT IN(SELECT DISTINCT idPropriedade "
                                                                                                                 + "FROM CARACTERIZACAO "
                                                                                                                 + "WHERE idCategoria = C.idCategoria));";

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

    public static ResultSet parceirosJaVenderamEEntregaram(){

        String s = "SELECT DISTINCT nomeParceiro "
                 + "FROM PARCEIRO JOIN PRODUTO ON(cnpj = cnpjVendedor) NATURAL JOIN COMPRA "
                 + "WHERE cnpj IN  (SELECT DISTINCT cnpj "
                                 + "FROM PARCEIRO JOIN PRODUTO ON(cnpj = cnpjEntregador) NATURAL JOIN COMPRA); ";

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

    public static ResultSet vendedoresCatMaisAvaliados(String categoria){

        String s = "SELECT nomeParceiro "
                 + "FROM  PARCEIRO JOIN PRODUTO ON(cnpj = cnpjVendedor) NATURAL JOIN AVALIACAO "
                 + "WHERE idCategoria = ? AND nota = (SELECT MAX(nota) "
                                                    + "FROM PRODUTO NATURAL JOIN AVALIACAO "
                                                    + "WHERE idCategoria = ?);";

        PreparedStatement stmt = null;

        try{
            stmt = postgreSQLConnection.getConn().prepareStatement(s);

            stmt.setString(1, categoria);
            stmt.setString(2, categoria);

            ResultSet rs = stmt.executeQuery();

            return rs;

        }catch (SQLException e){
            e.printStackTrace(System.err);
        }

        return null;
    }

    public static ResultSet emailClientesCompraramMarcaXMaisCarosMediaDaMarca(String marca) {

        String s = "SELECT DISTINCT email "
                 + "FROM CLIENTE NATURAL JOIN PEDIDO NATURAL JOIN COMPRA NATURAL JOIN PRODUTO "
                 + "WHERE marca = ? AND preco >=  (SELECT AVG(preco) "
                                                + "FROM COMPRA NATURAL JOIN PRODUTO "
                                                + "WHERE marca = ?);";

        PreparedStatement stmt = null;
        try {
            stmt = postgreSQLConnection.getConn().prepareStatement(s);

            stmt.setString(1, marca);
            stmt.setString(2, marca);

            ResultSet rs = stmt.executeQuery();

            return rs;

        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }

        return null;
    }

    public static ResultSet produtosMediaAvalMaiorqXMarcaY(int baseMedia, String marca){

        String s = "SELECT DISTINCT codProduto, nomeProduto "
                 + "FROM PRODUTO JOIN AVALIACAO USING (codProduto) "
                 + "WHERE marca=? "
                 + "GROUP BY codProduto, nomeProduto "
                 + "HAVING AVG(nota) >= ?;";

        PreparedStatement stmt = null;
        try {
            stmt = postgreSQLConnection.getConn().prepareStatement(s);

            stmt.setInt(1, baseMedia);
            stmt.setString(2, marca);

            ResultSet rs = stmt.executeQuery();

            return rs;

        } catch (SQLException e) {
            e.printStackTrace(System.err);
        }

        return null;

    }



}
