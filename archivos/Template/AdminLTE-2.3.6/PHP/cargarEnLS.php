<?php
require_once("conexion.php");
session_start();

$_SESSION['siLS'] = $_POST['siLS'];
if ($_SESSION['siLS'] != 'true'){
	cargarItems();
}

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
	
	//Devuelve el arreglo de items a la llamada AJAX, para luego ser almacenada
	echo $arrayJsoneado;
	$_SESSION['siLS'] = 'true';

}
?>
