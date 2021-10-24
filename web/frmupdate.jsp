<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%@ include file="fuentedatos.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar</title>
        <link rel="stylesheet" href="style.css">
        <script>
            function actualizar(id)
            {
                var isbn=document.getElementsByName('isbn')[0].value;
                var titulo=document.getElementsByName('titulo')[0].value;
                var autor=document.getElementsByName('autor')[0].value;
                var editorial=document.getElementsByName('editorial')[0].value;
                location.href="update.jsp?isbn="+isbn+"&titulo="+titulo+"&autor="+autor+"&editorial="+editorial+"&id="+id;
            }
        </script>
    </head>
    <body>
        <h1>Actualizar libro</h1>
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro where id=?;
            <sql:param value="${param.id}"/>
        </sql:query>
        <%! String str = null; %>
        <form>
            <table class="tablaForm" border = "1" width = "30%" style="margin: auto">
            <c:forEach var = "row" items = "${result.rows}">
                <tr>
                <td>ISBN:</td>
                <td><input type="text" name='isbn' value="${row.isbn}"></td>
                
            </tr>
            <tr>
                <td>Titulo:</td>
                <td><input type="text" name='titulo' value="${row.titulo}"></td>
            </tr>
            <tr>
                <td>Autor: </td>
                <td><input type="text" name='autor' value="${row.autor}"></td>
            </tr>
            <tr>
                <td>Editorial </td>
                <td><input type="text" name='editorial' value="${row.editorial}"></td>
            </tr>
            <tr>
                <td colspan="2" class="editar" style="text-align: center" onclick="actualizar('${row.id}');" >Editar</td>
            </tr>
            <tr>
                <td> <a href="index.jsp" colspan="2" style="color:blue; margin: auto; ">RETORNAR</a></td>
            </tr>
                
            </c:forEach>
        </table>
        </form>
        
       
    </body>
</html>
