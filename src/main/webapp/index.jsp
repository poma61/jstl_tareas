<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.Tarea"%>
<%@page import="com.emergentes.GestorTareas"%>
<%
    if (session.getAttribute("agenda") == null) {
        GestorTareas objeto1 = new GestorTareas();
        objeto1.insertarTarea(new Tarea(1, "Reunion con estudiantes de la carrera", "Alta"));
        objeto1.insertarTarea(new Tarea(2, "Estudiar para el examen de estadistica", "Alta"));
        objeto1.insertarTarea(new Tarea(3, "Partido de futsal", "Baja"));

        session.setAttribute("agenda", objeto1);
    }


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" >
        <title>JSTL</title>
    </head>

    <body >
        <h1>Lista de Tareas</h1>
        <h3 id="nuevo"><a href="Controller?op=nuevo"> Nuevo</a></h3>
        <table border="1" id="table">
            <tr>
                <th>Id</th>
                <th>Tarea</th>
                <th>Prioridad</th>
                <th>Modificar</th>
                <th>Eliminar</th>
            </tr>  
            <c:forEach var="item" items="${sessionScope.agenda.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.tarea}</td>
                    <td>${item.prioridad}</td>
                    <td><a href="Controller?op=modificar&id=${item.id}">Modificar</a></td>
                    <td><a href="Controller?op=eliminar&id=${item.id}">Eliminar</a></td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
