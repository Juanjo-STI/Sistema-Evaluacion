<?php
$conexion = mysqli_connect("localhost","root","root","dbeval");
$conex;
function datosConex(){
	if(mysqli_connect_error()){
		echo "<script>console.log('Hubo un error en la conexión');</script>";
		echo "<h1>Error de conexión</h1>";
		return $conex=false;
	}else{
		echo "<script>console.log('Conexión exitosa (BD)');</script>";

		return $conex=true;
	}
}
?>