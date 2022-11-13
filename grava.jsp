<%@page language="java" import="java.sql.*" %>

<%
    // cria as variaveis e armazena as informações digitadas pelo usuario
    String vnome    = request.getParameter("txtNome");
    String vdata    = request.getParameter("txtData");
    String vemail   = request.getParameter("txtEmail");
    String vcpf     = request.getParameter("txtCPF");
    String vcep     = request.getParameter("txtCEP");
    String vnumcel  = request.getParameter("txtNumCel");
    String vnumtel  = request.getParameter("txtNumTel");
    String vproduto = request.getParameter("produto"); 
    String vdesc    = request.getParameter("desc");


    // variaveis para o banco de dados
    String banco    = "dados";
    String endereco = "jdbc:mysql://localhost:3306/" + banco ;
    String usuario  = "root" ;
    String senha    = "" ;

    String driver   = "com.mysql.jdbc.Driver" ;

    //Carregar o driver na memoria
    Class.forName( driver );

    //cria a variavel para conectar com o banco
    Connection conexao ;
    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    //Cria a variavel sql com o comando de Inserir
    String sql = "INSERT INTO cadastro (nome, datadenascimento, email, cpf, cep, numCel, numTel, produto, descricao) values(?,?,?,?,?,?,?,?,?)" ;

    PreparedStatement stm = conexao.prepareStatement(sql);
    stm.setString(1, vnome);
    stm.setString(2, vdata);
    stm.setString(3, vemail);
    stm.setString(4, vcpf);
    stm.setString(5, vcep);
    stm.setString(6, vnumcel);
    stm.setString(7, vnumtel);
    stm.setString(8, vproduto);
    stm.setString(9, vdesc);

    stm.execute() ;
    stm.close() ;

    out.print("Reclamação feita com sucesso!");
    out.print("<br><br>");
    out.print("<a href='cadastro.html'>Voltar</a>");
%>