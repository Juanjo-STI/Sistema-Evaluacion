<?php
session_start();
	echo "<h1>Archivo cargado con load() de ajax</h1>";
	echo "<div class='datos'><p>Id evaluador: ".$_SESSION['idEvaluador']."</p>
			<p class='evaluador'>Id evaluado: </p>
			</div>";

//Variables


$comp  = [ //Competencias
'h'=> 'Habilidades' ,
'c'=> 'Conocimientos' ,
'a' => 'Actitudes' 
];

$nivelbtn =[
1=>'danger',
2=>'warning',
3=>'info',
4=>'success'
];



//Ficha
echo "<div class='ficha'> 
<form action='#' data-persist='garlic' method='POST'>";
	
	foreach ($comp as $ckey => $cval){//Hab., Conoc., Act.


		echo "<h1 align='center'>".$cval."</h1>";
		for ($it=0; $it <= 2; $it++){ //Items de cada competencia
			echo "<div class='btn-group btn-group-lg'   data-toggle='buttons'>";
			foreach ($nivelbtn as $clave => $val){ //Puntaje 1-4
				if ($it==0 ){//&& $ckey=='h'){ Implementar js
					echo "<label class='btn btn-".$nivelbtn[$clave]." form-check-label'>";
					echo "<input type='radio' name=".$ckey."-".$it." id=".$clave." />";
					echo "Desc. ".$ckey."-".$it."-".$clave;
				}else{
					echo "<label class='# btn btn-".$nivelbtn[$clave]."  form-check-label'>";
					echo "<input type='radio' name=".$ckey."-".$it." id=".$clave." />";
					echo "Desc. ".$ckey."-".$it."-".$clave;
				}
				echo "</label>";
			}	

		echo "</div>"; 	//Cierra el div' 'btn-group'
		echo "<br/>";
		}
	}

echo "</form>"; 
echo "</div>"; 	//Cierra el div 'ficha'
?>