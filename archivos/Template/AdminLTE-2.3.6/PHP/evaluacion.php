<script>console.log('evaluacion')</script>
<?php
require_once("conexion.php");
require_once("fichasbd.php");  




  //Verificar la conexión
	$conex = datosConex();
	if ($conex==true){
		cargarFicha();
	}

function mostrarFicha($arrayFinal,$comp,$ckey,$cval,$json_a,$jkey){
	global $conexion;

	session_start();
	
	foreach ($comp as $ckey => $cval){
	echo " <h1>". $cval ."</h1>";

	foreach ($arrayFinal as $itkey => $itval){
		if ($itval['tipoItem'] == $ckey){
			echo "nro Item: ".$itval['tipoItem']."-".$itval['nroItem']."<br/>";
		}else{
			$itval['tipoItem'] += 1;
			echo "n";
			//break;
		}
		
	}
	
}

	echo "<hr/>";
	/*
	echo "<h1>Archivo cargado con load() de ajax</h1>";
	echo "<div class='datos'><p>Id evaluador: ".$_SESSION['idEvaluador']."</p>
				<p class='evaluador'>Id evaluado: </p>
				</div>";

	//Variables
	$nivelbtn =[
	1=>'danger',
	2=>'warning',
	3=>'info',
	4=>'success'
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

						foreach ($nivelbtn as $btnkey => $btnval){ //Color de botón segun puntuación
							echo "<label class='btn btn-".$btnval." form-check-label'>";
							echo "<input type='radio' name=".$ckey."-".$i." id=".$btnkey." />";
							
							echo $btnkey."</label>";
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
	*/
}
?>