<?php
include "inicio.php";

?>

    <!-- Main content -->
    <section class="content">
      <?php 
      session_start();
      	

        $agenteLogueado = "Juanjo"; //Tengo que obtener el agente que se logueó.
        $sector = $_SESSION['sector'];
        echo "<p>Bienvenido"."</p>";

        //Conexión base de datos:

        $conexion = mysqli_connect("localhost","root","","dbeval");

        if(mysqli_connect_error())
          echo "<p>Hubo un error en la conexión con la Base de Datos."."</p>";
        else{
          echo "<p>Conexión con la base exitosa</p>";
          $consulta = "SELECT  apellido, nombre FROM agente WHERE idAgente = ".$_SESSION['idEvaluador'];
          $datos = mysqli_query($conexion, $consulta);
          if (mysqli_num_rows($datos) > 0) {

              while($fila = mysqli_fetch_assoc($datos)) {
                  echo "<p>El usuario es: ".$fila["apellido"]." ".$fila["nombre"]."</p>";
              }
          } else {
              echo "Sin resultados";
          }
          
          echo "<hr/>";
          $consulta = "SELECT idAgente, nombre, apellido FROM agente WHERE sector = '$sector' ";
  
          $datos = mysqli_query($conexion, $consulta) ;
          echo "------Agentes de informática-----"."<br>";
          if (mysqli_num_rows($datos) > 0) {


            echo "<div class='tabla'>
            <table class='table table-bordered table-hover table-responsive'>
            <thead>
            <tr>
                <th class='col-xs-1'>Id</th>
                <th class='col-xs-3'>Apellido</th>
                <th class='col-xs-3'>Nombre</th>
       			<th class='col-xs-4'>Acciones</th>
       		</thead>";
       		echo "<tbody>";
              while($fila = mysqli_fetch_assoc($datos)) {

              	$arrayEvaluados = $fila['idAgente'];
              	$_SESSION['idEvaluados'] = $arrayEvaluados;
              	
              	
                  echo "<tr>";
                  echo "<td>".$fila['idAgente']."</td>";
                  echo "<td class'active'>".$fila['apellido']."</td>";
                  echo "<td>".$fila['nombre']."</td>";
                  echo "<td ><button id=".$fila['idAgente']." onclick='evaluar(this.id)' class='btn btn-success col-xs-6'>Evaluar</button>
                  <button  class='btn btn-primary col-xs-6'>2</button>

                  </td>";
                  echo "</tr>";
              }

      echo "</tbody>
                   </table></div>";

          } else {
              echo "<p>Sin resultados</p>";
          }
        }




       ?>
       <div >
          <a href="http://google.com">LinK</a>
       </div>
        

      <!-- Your Page Content Here -->
<?php
include "fin.php";
?>