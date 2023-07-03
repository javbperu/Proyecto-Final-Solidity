// SPDX-License-Identifier: MIT
pragma solidity 0.6.0;
pragma experimental ABIEncoderV2;

contract Class_gasolina {

    address owner;

    constructor () public {
        owner = msg.sender;
    }
 
    modifier  onlyOwner(){
        require(msg.sender==owner,"Not Owner");
        _;
    }
 

    struct  Gasolina  {
        string cod_gasolina;
        string descripcion_gasolina;
        
    }

    struct Fecha_Programacion {
            string cod_gasolina;
            uint16 precio;
            uint  fecha;
        }

        
    // Registrar nuevas gasolinas.
    mapping(string => Gasolina) public GasolinaMap;
    mapping(string => Fecha_Programacion) public FechaProgramacionMap;

    // Agregar gasolina
    function addGasolina(string memory _codgasolina, string memory _descgasolina ) public onlyOwner {
        Gasolina memory newGasolina = Gasolina(_codgasolina, _descgasolina);
        GasolinaMap[_codgasolina] = newGasolina;
    }

    // Agregar fecha de programacion.
      function addFechaProgramacion(string memory _codgasolina, uint16   _precio, uint   _fecha ) public onlyOwner {
        Fecha_Programacion memory newFechaProgramacion = Fecha_Programacion(_codgasolina, _precio,_fecha);
        FechaProgramacionMap[_codgasolina] = newFechaProgramacion;
    }

    // Obtener lista de gasolinas
    function getGasolinaxCod(string memory _CodigoGasolina) public view  returns(Gasolina   memory) 
    {
        return GasolinaMap[ _CodigoGasolina];
    }

      // Obtener lista de gasolinas
    function getFechaProgramacionxCod(string memory _CodigoGasolina) public view  returns(Fecha_Programacion   memory) 
    {
        return FechaProgramacionMap[ _CodigoGasolina];
    }   

}