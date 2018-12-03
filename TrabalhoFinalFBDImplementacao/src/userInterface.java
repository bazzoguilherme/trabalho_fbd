import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class userInterface {
    private static Scanner input;
    private static final String CONSULTA01 = "Selecionar o nome de parceiros que venderam 'x' ou mais produtos distintos.";
    private static final String CONSULTA02 = "Selecionar o nome dos produtos (e de sua categoria) cuja categoria tem todas as propriedades (e talvez outas) que a categoria Fones de Ouvido (idCategoria = 'ct03').";
    private static final String CONSULTA03 = "O nome dos vendedores de produtos da categoria Livro (idCategoria = 'ct10') mais bem avaliados.";
    private static final String CONSULTA04 = "O e-mail dos clientes que compraram produtos da marca Brastemp mais caros do que a média das compras de produtos desta marca.";
    private static final String CONSULTA05 = "Selecionar os produtos que apresentem uma oferta com desconto maior ou igual que 5% e um cupom de desconto com desconto maior ou igual que 5%.";
    private static final String CONSULTA06 = "Selecionar o nome da empresa, seu telefone e o produto vendido por ela para todo produto cuja seleção em carrinhos é maior que a quantidade deste produto em estoque.";
    private static final String PROCEDIMENTO1 = "Mostrar que uma avaliação só pode ser inserida se o cliente comprou o produto ao qual a avaliação se refere.";
    private static final String PROCEDIMENTO2 = "Mostrar que uma compra não pode ser realizada se não houver em estoque a quantidade de unidades de um produtos que o cliente deseja comprar.";

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

    private void escolhaMenu(String op){
        switch (op){
            case "1":
                consultas();
                break;
            case "2":
                procedimentos();
                break;
            default:
                break;
        }
    }

    public void menuPrincipal(){
        String opcao = "";
        while(!opcao.toUpperCase().equals("S")){
            limpaTela();
            System.out.println("1 - Consultas");
            System.out.println("2 - Procedimentos");
            System.out.println("S - Sair");
            opcao = pedeString("uma das opcaoes acima: ");
            escolhaMenu(opcao);
        }
    }

    public void consultas(){
        String opcao = this.menuConsultas();
        switch (opcao){
            case "1":
                this.realizaConsulta01();
                break;
            case "2":
                this.realizaConsulta02();
                break;
            case "3":
                this.realizaConsulta03();
                break;
            case "4":
                this.realizaConsulta04();
                break;
            case "5":
                this.realizaConsulta05();
                break;
            case "6":
                this.realizaConsulta06();
                break;
            default:
                break;
        }
    }

    public void procedimentos(){
        String opcao = this.menuProcedimentos();
        limpaTela();
        switch (opcao){
            case "1":
                System.out.println("ANTES DO PROCEDIMENTO");
                this.consultaExemplo1();
                System.out.println("DEPOIS DO PROCEDIMENTO");
                this.executaExemplo1();
                this.consultaExemplo1();
                break;
            case "2":
                System.out.println("ANTES DO PROCEDIMENTO");
                this.consultaExemplo2();
                this.consultaExemplo3();
                System.out.println("DEPOIS DO PROCEDIMENTO (COM ERRO ESPERADO)");
                this.executaExemplo2_1();
                this.consultaExemplo2();
                this.consultaExemplo3();
                System.out.println("DEPOIS DO PROCEDIMENTO (SEM ERRO)");
                this.executaExemplo2_2();
                this.consultaExemplo2();
                this.consultaExemplo3();
                break;
            default:
                break;
        }
    }

    public String menuConsultas(){
        String opcao;
        do{
            limpaTela();
            imprimeOpcoesConsultas();
            opcao = this.pedeString("uma das opcoes de consultas acima: ");
        }while(!opcao.toUpperCase().equals("S") && !opcao.equals("1") && !opcao.equals("2") && !opcao.equals("3") && !opcao.equals("4") && !opcao.equals("5") && !opcao.equals("6"));
        return opcao;
    }

    public String menuProcedimentos(){
        String opcao;
        do{
            limpaTela();
            imprimeOpcoesProcedimentos();
            opcao = this.pedeString("uma das opcoes de consultas acima: ");
        }while(!opcao.toUpperCase().equals("S") && !opcao.equals("1") && !opcao.equals("2"));
        return opcao;
    }

    private static void imprimeOpcoesConsultas(){
        System.out.println("1 -" + CONSULTA01);
        System.out.println("2 -" + CONSULTA02);
        System.out.println("3 -" + CONSULTA03);
        System.out.println("4 -" + CONSULTA04);
        System.out.println("5 -" + CONSULTA05);
        System.out.println("6 -" + CONSULTA06);
        System.out.println("Para sair digite 'S'.");
    }

    private static void imprimeOpcoesProcedimentos(){
        System.out.println("1 -" + PROCEDIMENTO1);
        System.out.println("2 -" + PROCEDIMENTO2);
        System.out.println("Para sair digite 'S'.");
    }

    private void realizaConsulta01(){
        try {
            int numeroConsulta = pedeInt("um valor para realizar a consulta");

            ResultSet rs = postgreSQLConsultas.consulta1(numeroConsulta);

            System.out.println("Parceiros:");
            while (rs.next()) {
                System.out.println(rs.getString("nomeParceiro"));
            }
        }catch (SQLException e){
            e.printStackTrace(System.err);
        }
    }

    private void realizaConsulta02(){
        try {
            ResultSet rs = postgreSQLConsultas.consulta2();

            System.out.println("Produto  -  Categoria");
            while (rs.next()) {
                System.out.println(rs.getString("nomeProduto") + " - " + rs.getString("nomeCategoria"));
            }
        }catch (SQLException e){
            e.printStackTrace(System.err);
        }
    }

    private void realizaConsulta03(){
        try {
            ResultSet rs = postgreSQLConsultas.consulta3();

            System.out.println("Vendedores:");
            while (rs.next()) {
                System.out.println(rs.getString("nomeParceiro"));
            }
        }catch (SQLException e){
            e.printStackTrace(System.err);
        }
    }

    private void realizaConsulta04(){
        try {
            ResultSet rs = postgreSQLConsultas.consulta4();

            System.out.println("Emails de Clientes:");
            while (rs.next()) {
                System.out.println(rs.getString("email"));
            }
        }catch (SQLException e){
            e.printStackTrace(System.err);
        }
    }

    private void realizaConsulta05(){
        try {
            ResultSet rs = postgreSQLConsultas.consulta5();

            System.out.println("Produtos (Codigo):");
            while (rs.next()) {
                System.out.println(rs.getString("nomeProduto") + " (" + rs.getString("codProduto") + ")");
            }
        }catch (SQLException e){
            e.printStackTrace(System.err);
        }
    }

    private void realizaConsulta06(){
        try {
            ResultSet rs = postgreSQLConsultas.consulta6();

            System.out.println("Parceiro (Telefone): CodigoProduto ");
            while (rs.next()) {
                System.out.println(rs.getString("nomeParceiro") + " (" + rs.getString("telefone") + "): " + rs.getString("codProduto"));
            }
        }catch (SQLException e){
            e.printStackTrace(System.err);
        }
    }

    private void consultaExemplo1(){
        try {
            ResultSet rs = postgreSQLConsultas.consultaExemploGatilho1();

            System.out.println("id: codigoProduto - cpf Cliente ");
            while (rs.next()) {
                System.out.println(rs.getString("idAvaliacao") + ": " + rs.getString("codProduto") + " - " + rs.getString("cpf"));
            }
        }catch (SQLException e){
            e.printStackTrace(System.err);
        }
    }

    private void consultaExemplo2(){
        try {
            ResultSet rs = postgreSQLConsultas.consultaExemploGatilho2_1();

            System.out.println("codProduto: estoque");
            while (rs.next()) {
                System.out.println(rs.getString("codProduto") + ": " + rs.getString("estoque"));
            }
        }catch (SQLException e){
            e.printStackTrace(System.err);
        }
    }

    private void consultaExemplo3(){
        try {
            ResultSet rs = postgreSQLConsultas.consultaExemploGatilho2_2();

            System.out.println("codProduto: numeroPedido - NotaFiscal");
            while (rs.next()) {
                System.out.println(rs.getString("codProduto") + ": " + rs.getString("numeroPedido") + " - " + rs.getString("numeroNotaFiscal"));
            }
        }catch (SQLException e){
            e.printStackTrace(System.err);
        }
    }

    private void executaExemplo1(){
        postgreSQLConsultas.exemploProcedimento1();
    }

    private void executaExemplo2_1(){
        postgreSQLConsultas.exemploProcedimento2_1();
    }

    private void executaExemplo2_2(){
        postgreSQLConsultas.exemploProcedimento2_2();
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
