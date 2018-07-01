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
	//Variables
	$nivelbtn =[
	1=>'danger',
	2=>'warning',
	3=>'info',
	4=>'success'
	];
	global $conexion;

	session_start();
	
	//Datos de la evaluación
	echo "<div class='datos'><p>Id evaluador: ".$_SESSION['idEvaluador']."</p>
				<p class='evaluador'>Id evaluado: </p></div>";

	echo "<table class='table table-striped border='1'>";
	echo "<form action='#' data-persist='garlic' method='POST'>";

	//Itera por cada competencia
	foreach ($comp as $ckey => $cval){
	echo "<tr><th colspan='3' style='text-align:center;'>".$cval."</th></tr>";
	echo "<tr>
		<th class='col-xs-3'>Nombre</th>
		<th class='col-xs-4'>Descripción</th>
		<th class='col-xs-5'>Puntuación</th>
		</tr>";
		foreach ($arrayFinal as $itkey => $itval){
			if ($itval['tipoItem'] == $ckey){
				//echo "nro Item: ".$itval['tipoItem']."-".$itval['nroItem']."<br/>";

				echo "<tr>
						<td>".$itval['nomb']."</td>
						<td><small>".$itval['desc']."</small></td>
						<td>
						<div class='btn-toolbar btn-group-lg' data-toggle='buttons'>";

						foreach ($nivelbtn as $btnkey => $btnval){ //Color de botón segun puntuación
							echo "<label class='btn btn-".$btnval." form-check-label'>";
							echo "<input type='radio' name=".$ckey."-".$itval['nroItem']." id=".$btnkey." />";
							
							echo $btnkey."</label>";
							}
						echo "</div></td></tr>";
			}else{
				$itval['tipoItem'] += 1;
				//echo "Cambio de Competencia";
				//break;
			}
			
		}
	
	}
	echo "</form>";
	echo "</table>";

}
?>