<?php 
include "inicio.php";
?>
    <!-- Main content -->

<form action="#" data-persist="garlic" method="POST">
<div class="btn-group" data-toggle="buttons">

    <label class="btn btn-danger active form-check-label ">
        <input class="form-check-input" type="radio" checked autocomplete="off"/>Opción 1
    </label>

    <label class="btn btn-warning form-check-label ">
        <input class="form-check-input" type="radio" autocomplete="off"/> Opción 2
    </label>

    <label class="btn btn-primary form-check-label ">
        <input class="form-check-input" type="radio" autocomplete="off"/> Opción 3
      </label>

       <label class="btn btn-success form-check-label ">
        <input class="form-check-input" type="radio" autocomplete="off"/> Opción 4
    </label>

</div>
</form>

   
 <section class="content">
<?php 
	//Conexión base de datos:
	$conexion = mysqli_connect("localhost","root","","dbeval");
	session_start();
	$_SESSION['idEvaluador'] = 1; //Tengo que obtener el agente que se logueó


	$consulta = "SELECT sector FROM agente WHERE idAgente = ".$_SESSION['idEvaluador'];

  
	$datos = mysqli_query($conexion, $consulta);
	
        if (mysqli_num_rows($datos) > 0) {

         while($fila = mysqli_fetch_assoc($datos)) {
         	$_SESSION['sector'] = $fila['sector'];
            echo "El sector del usuario es: ".$_SESSION['sector']."<br/>";
           }
          } else {
              echo "Sin resultados<br/>";
          }







        echo "Bienvenido! Id evaluador: ".$_SESSION['idEvaluador']."<br/>";
    
        if(mysqli_connect_error())
          echo "Hubo un error en la conexión con la Base de Datos."."<br/>";
        else{
          echo "<p>Conexión con la base exitosa</p>";
          $consulta = "SELECT  apellido, nombre FROM agente WHERE idAgente = ".$_SESSION['idEvaluador'];
          $datos = mysqli_query($conexion, $consulta);
          if (mysqli_num_rows($datos) > 0) {

              while($fila = mysqli_fetch_assoc($datos)) {
             
                  echo "El usuario es: ".$fila["apellido"]." ".$fila["nombre"]."<br/>";
              }
          } else {
              echo "Sin resultados<br/>";
          }
        }
       ?>
       <div class = "botonesNavegacion">
        <a href="evaluarAgentes.php"><button type="button" class="btn btn-block btn-primary btn-sm-4">Evaluar Agentes</button></a>
        <br>
        <a href="encargados.php"><button type="button" class="btn btn-block btn-info btn-sm-5">Para Encargados</button></a> 
       </div>



 <?php

 include "fin.php";
 ?>