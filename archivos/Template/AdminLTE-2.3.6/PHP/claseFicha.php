<?php 

class Ficha{
	

	private $nroFicha;
	private $nombre;
	private $tipo ;


	//Métodos publicos

	function __construct($nroFicha, $nombre, $tipo) { }

		$this->nroFicha = $nroFicha;
		$this->nombre = $nombre;
		$this->tipo = $tipo;

	}







	//Getters y setters
 	function __get($nroFicha){
        return $this->$nroFicha;
	}
	public function __set(nroFicha){
		$this->$nroFicha = $nroFicha;
	}

	function __get($nombre){
        return $this->$nombre;
	}
	public function __set(nombre){
		$this->$nombre = $nombre;

	}

	function __get($tipo){
        return $this->$tipo;
	}
	public function __set(tipo){
		$this->$tipo = $tipo;

	}
}
?>