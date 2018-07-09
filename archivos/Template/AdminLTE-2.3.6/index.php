<?php 
require_once("inicio.php");
?>   
<section class="content">
  <?php 


    //Verificar la conexión
    $conex = datosConex();
    if ($conex==true){
      $_SESSION['idEvaluador'] = 1; //Tengo que obtener el agente que se logueó
      datosEvaluador();
    }else{
      echo '<h2>Error de conexión</h2>';
    }


    function datosEvaluador(){
      global $conexion;

      //Nombre y apellido del evaluador
      $consulta = "SELECT  apellido, nombre FROM agente WHERE idAgente = ".$_SESSION['idEvaluador'];
      $datos = mysqli_query($conexion, $consulta);
      if (mysqli_num_rows($datos) > 0) {

        while($fila = mysqli_fetch_assoc($datos))
        echo "<p>Bienvenido ".$fila["apellido"]." ".$fila["nombre"]."</p>";
        
      }else{
        echo "<p>Sin resultados</p>";
      }


      //Sector del evaluador
      $consulta = "SELECT sector FROM agente WHERE idAgente = ".$_SESSION['idEvaluador'];
      $datos = mysqli_query($conexion, $consulta);

      if (mysqli_num_rows($datos) > 0) {

        while($fila = mysqli_fetch_assoc($datos)) {
        $_SESSION['sector'] = $fila['sector'];
        echo "El sector del usuario es: ".$_SESSION['sector']."<br/>";
        }

      echo "<div class = 'botonesNavegacion'>
        <button id='btnIndex' class='btn btn-block btn-primary btn-sm-4' >Evaluar Agentes</button></a>
        <br/>
        <a href='encargados.php'><button type='button' class='btn btn-block btn-info btn-sm-5'>Para Encargados</button></a> 
      </div>";
      }else{
        echo "<p>Error al obtener el sector del evaluador</p>";
      }
    }

?>

<?php
 include "fin.php";
?>

