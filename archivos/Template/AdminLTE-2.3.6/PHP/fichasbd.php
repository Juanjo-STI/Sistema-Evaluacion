<?php
include "conexion.php";
session_start();

$consulta = "SELECT idAgenteEvaluado, nroFicha FROM evaluacion WHERE idAgenteEvaluador = ". $_SESSION['idEvaluador'];

	$datos = mysqli_query($conexion, $consulta);
	if (mysqli_num_rows($datos) > 0) {

	  while($fila = mysqli_fetch_assoc($datos)) {
	      echo "<p>Id agente evaluado: ".$fila['idAgenteEvaluado']."</p>";
	  }
	} else {
	  echo "La ficha se crerará a continuación:";
	}
var_dump($consulta);

?>
<script>
	console.log("fichasbd cargado");
</script>