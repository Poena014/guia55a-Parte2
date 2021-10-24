<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%@include file="fuentedatos.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmar eliminación</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <h1>ELIMINAR UN REGISTRO DE LA TABLA</h1>

        <sql:update dataSource = "${fuenteDatos}" var = "count">
            DELETE FROM libro WHERE Id = ?
            <sql:param value = "${Id}" />
        </sql:update>

        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro;
        </sql:query>
            
        <h3>Favor verifique que el registro ha sido borrado con éxito</h3>
        <table border = "1" width = "100%">
            <tr>
                <th>id</th>
                <th>isbn</th>
                <th>titulo</th>
                <th>autor</th>
                <th>editorial</th>
            </tr>
            <c:forEach var = "row" items = "${result.rows}">
                <tr>
                    <td><c:out value = "${row.id}"/></td>
                    <td><c:out value = "${row.isbn}"/></td>
                    <td><c:out value = "${row.titulo}"/></td>
                    <td><c:out value = "${row.autor}"/></td>
                    <td><c:out value = "${row.editorial}"/></td>
                </tr>
            </c:forEach>
        </table>    
        <p>Información eliminada correctamente <a href="index.jsp">Regresar</a> </p>
        
    </body>
</html>