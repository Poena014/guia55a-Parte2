<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%@ include file="fuentedatos.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmar consulta</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <h1>Operacion Exitosa!!!</h1>
        <p style="text-align: center">Informacion agregada correctamente <a href="index.jsp">Regresar</a> </p>
        <sql:update dataSource = "${fuenteDatos}" var = "count">
            INSERT INTO libro (isbn,titulo,autor,editorial) VALUES (?,?,?,?);
            <sql:param value="${param.isbn}"/>
            <sql:param value = "${param.titulo}" />
            <sql:param value="${param.autor}"/>
            <sql:param value="${param.editorial}"/>
        </sql:update>
        
    </body>
</html>
