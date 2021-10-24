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
        <style type="text/css">
              
        </style>
    </head>
    <body>
        <h1>Actualizar Libro</h1>
        <p>Informacion editada correctamente <a href="index.jsp">Regresar</a> </p>
        <sql:setDataSource var="fuente" driver="org.mariadb.jdbc.Driver"
                           url="jdbc:mariadb://localhost:3308/grupo10"
                           user="root"  password = ""/>
        
        <sql:update dataSource = "${fuenteDatos}" var = "count">
            UPDATE libro SET isbn=?,titulo=?,autor=?,editorial=?   WHERE  id=?
            <sql:param value="${param.isbn}"/>
            <sql:param value = "${param.titulo}" />
            <sql:param value="${param.autor}"/>
            <sql:param value="${param.editorial}"/>
            <sql:param value = "${param.id}" />
        </sql:update>
    </body>
</html>
