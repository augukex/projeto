<%@page language="java" import="java.sql.*" %>
<%

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

    String sql = "SELECT * FROM cadastro" ;

    PreparedStatement stm = conexao.prepareStatement(sql);

    ResultSet dados = stm.executeQuery() ;

    out.print("<a href='cadastro.html'>Novo chamado</a>") ;

    out.print("<table border=1>");
    out.print("<tr>");
       out.print("<th>Codigo</th>") ;
       out.print("<th>nome</th>") ;
       out.print("<th>datadenascimento</th>") ;
       out.print("<th>email</th>") ;
       out.print("<th>cpf</th>") ;
       out.print("<th>cep</th>") ;
       out.print("<th>numCel</th>") ;
       out.print("<th>numTel</th>") ;
       out.print("<th>produto</th>") ;
       out.print("<th>descricao</th>") ;
    out.print("</tr>");

    while ( dados.next() ) 
    {
        out.print("<tr>");
            out.print("<td>");
            out.print( dados.getString("codigo") );
            out.print("</td>");

            out.print("<td>");
            out.print( dados.getString("nome") );
            out.print("</td>");

            out.print("<td>");
            out.print( dados.getString("datadenascimento") );
            out.print("</td>");

            out.print("<td>");
            out.print( dados.getString("email") );
            out.print("</td>");

            out.print("<td>");
            out.print( dados.getString("cpf") );
            out.print("</td>");

            out.print("<td>");
            out.print( dados.getString("cep") );
            out.print("</td>");

            out.print("<td>");
            out.print( dados.getString("numCel") );
            out.print("</td>");

            out.print("<td>");
            out.print( dados.getString("numTel") );
            out.print("</td>");

            out.print("<td>");
            out.print( dados.getString("produto") );
            out.print("</td>");

            out.print("<td>");
            out.print( dados.getString("descricao") );
            out.print("</td>");
        
        
        out.print("</tr>");
    }

    out.print("</table>");

%>