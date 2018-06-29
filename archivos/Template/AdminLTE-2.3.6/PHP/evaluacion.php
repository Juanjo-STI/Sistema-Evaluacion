<?php
include "conexion.php";
session_start();
	echo "<h1>Archivo cargado con load() de ajax</h1>";
	echo "<div class='datos'><p>Id evaluador: ".$_SESSION['idEvaluador']."</p>
			<p class='evaluador'>Id evaluado: </p>
			</div>";

//Variables
$arrayFinal = [];
$comp = ['H','C','A'];
$nivelbtn =[
1=>'danger',
2=>'warning',
3=>'info',
4=>'success'
];


$string = file_get_contents("../JS/auxtec.json");
$json_a = json_decode($string,true);
$nroItem;$tipoItem;$nomb;$desc;

$comp  = [ //Competencias
'h'=> 'Habilidades' ,
'c'=> 'Conocimientos' ,
'a' => 'Actitudes' 
];


//Ficha

echo "<table class='table table-striped border='1'>";
echo "<form action='#' data-persist='garlic' method='POST'>";
foreach ($comp as $ckey => $cval) {
	$i = 1;
	
	echo "<tr><th colspan='3' style='text-align:center;'>".$cval."</th></tr>";
	echo "<tr>
		<th class='col-xs-3'>Nombre</th>
		<th class='col-xs-4'>Descripción</th>
		<th class='col-xs-5'>Puntuación</th>
		</tr>";

	//Itera cada item dentro cada competencia
	foreach ($json_a[$ckey] as $jkey){
		//Si el item corresponde al agente, ejecuta
		if ($json_a[$ckey][$i] != NULL){
			$consulta = "SELECT * FROM item WHERE tipoItem = '".$ckey."' && nroItem ='".$i."'";
			
			$datos = mysqli_query($conexion, $consulta);
			
			if (mysqli_num_rows($datos) > 0) {

				while($fila = mysqli_fetch_assoc($datos)) {
					echo "<tr>
					<td>".$fila['nombre']."</td>
					<td><small>".$fila['descripcion']."</small></td>
					<td>
					<div class='btn-toolbar btn-group-lg'   data-toggle='buttons'>";

					foreach ($nivelbtn as $clave => $val){ //Color de botón segun puntuación
						echo "<label class='btn btn-".$nivelbtn[$clave]." form-check-label'>";
						echo "<input type='radio' name=".$ckey."-".$i." id=".$clave." />";
						
						echo $clave."</label>";
						}
					echo "</div></td>";
					
					//Inserta los items correspondientes al agente en un arreglo.
					array_push($arrayFinal, [
						'tipoItem' => $fila['tipoItem'],
						'nroItem' => $fila['nroItem'],
						'nomb' => $fila['nombre'],
						'desc' => $fila['descripcion']
					]);
					echo "</tr>";
				}
			}else{
				echo "Sin resultados";
			}
		}else{
			echo "<script>console.log('NC');</script>";
		}
		$i += 1;
	}
	echo "";
}
echo "</table>";
?>