<script>console.log('fichasbd')</script>
<?php
require_once('evaluacion.php');

function cargarFicha(){
	global $conexion;
	$arrayFinal = [];
	$comp = [
		'H' => 'Habilidades',
		'C' => 'Conocimientos' ,
		'A'=>'Actitudes'
		];
	$string = file_get_contents("../JS/auxtec.json");
	$json_a = json_decode($string,true);
	



	foreach ($comp as $ckey => $cval) {
		//echo "<h1>".$cval."</h1>";
		$i = 1;
		//echo "<ol>";
		foreach ($json_a[$ckey] as $jkey){
			if ($json_a[$ckey][$i] != NULL){
				$consulta = "SELECT * FROM item WHERE tipoItem = '".$ckey.
					"' && nroItem ='".$i."'";
				//echo "<li>true</li>";
				
				$datos = mysqli_query($conexion, $consulta);
				
				if (mysqli_num_rows($datos) > 0) {

					while($fila = mysqli_fetch_assoc($datos)) {
						/*echo "Tipo: ".$fila['tipoItem']."<br/>
						nroItem: ".$fila['nroItem']."<br/>
						Nombre: ".$fila['nombre']."<br/>
						Descripción".$fila['descripcion'];*/
				
						array_push($arrayFinal, [
							'tipoItem' => $fila['tipoItem'],
							'nroItem' => $fila['nroItem'],
							'nomb' => $fila['nombre'],
							'desc' => $fila['descripcion']
						]);
					}
				}else{
					//echo "<p>Sin resultados</p>";
				}
			}else{
			//echo "<li>NC</li>";
			}
			$i += 1;
		}
		echo "</ol>";
	}
	

	mostrarFicha($arrayFinal,$comp,$ckey,$cval,$json_a,$jkey);
}


//function cargarItems






?>
