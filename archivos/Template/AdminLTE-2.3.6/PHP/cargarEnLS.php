<!--

##Archivo temporal##

<!DOCTYPE html><html><head><meta charset="UTF-8"/></head><body>
<script>console.log('Cargar items')</script>
<?php
/*
require_once("evaluacion.php")
//Cargar todos los items en LS
function cargarItems(){
	global $conexion;

	$arrayFinal = [];

	$consulta = "SELECT * FROM item";
	
	$datos = mysqli_query($conexion, $consulta);
	
	if (mysqli_num_rows($datos) > 0) {

		while($fila = mysqli_fetch_assoc($datos)) {
	
			array_push($arrayFinal, [
				'tipoItem' => $fila['tipoItem'],
				'nroItem' => $fila['nroItem'],
				'nomb' => $fila['nombre'],
				'desc' => $fila['descripcion']
			]);
		}
	}
	$arrayJsoneado = json_encode($arrayFinal, JSON_UNESCAPED_UNICODE);
	echo "<script>";

	echo "
	try{
		localStorage.setItem('fullitems', JSON.stringify($arrayJsoneado));
		console.log('Todos los items guardados en localStorage');
	}
	catch(err){
		console.log('Hubo un problema en el guardado de items al localStorage');
	}";
	echo "</script>";
	listarAgentesSec($arrayJsoneado);
}
*/
?>
-->