<?php
include "conexion.php";

$arrayFinal = [];
$comp = ['h','c','a'];
$string = file_get_contents("../JS/auxtec.json");
$json_a = json_decode($string,true);
$nroItem;$tipoItem;$nomb;$desc;



foreach ($comp as $ckey => $cval) {
	echo "<h1>".$cval."</h1>";
	$i = 1;
	echo "<ol>";
	foreach ($json_a[$cval] as $jkey){
		if ($json_a[$cval][$i] != NULL){
			$consulta = "SELECT * FROM item WHERE tipoItem = '".$cval.
				"' && nroItem ='".$i."'";
			echo "<li>true</li>";
			
			$datos = mysqli_query($conexion, $consulta);
			
			if (mysqli_num_rows($datos) > 0) {

				while($fila = mysqli_fetch_assoc($datos)) {
					echo "Tipo: ".$fila['tipoItem']."<br/>
					nroItem: ".$fila['nroItem']."<br/>
					Nombre: ".$fila['nombre']."<br/>
					Descripción".$fila['descripcion'];
			
					array_push($arrayFinal, [
						'tipoItem' => $fila['tipoItem'],
						'nroItem' => $fila['nroItem'],
						'nomb' => $fila['nombre'],
						'desc' => $fila['descripcion']
					]);
				}
			}else{
				echo "Sin resultados";
			}
		}else{
		echo "<li>false</li>";
		}
		$i += 1;
	}
	echo "</ol>";
}


?>
