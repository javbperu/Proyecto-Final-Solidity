// SPDX-License-Identifier: MIT
pragma solidity 0.6.0;

// import "./safemath.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/math/SafeMath.sol";



contract Erc20Basic {
    
    // Variables públicas del token
    string public constant name = "EPJ";
    string public constant symbol = "EPJ";
    uint8 public constant decimals = 8;

    using SafeMath for uint;
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
    uint256 totalSupply_=100000000000000;

    // Crea un mapeo con la cantidad de tokens que cada cuenta posee
    // mapping(address => uint) balances;
    
    // Suministro total del token
    // uint256 totalSupply_ = 100000000000000;
    
    // Inicializa el token asignando todo el suministro total al creador del contrato
    constructor(uint256 initialSupply) public {
        totalSupply_ =initialSupply;
        balances[msg.sender] = totalSupply_;
    }
    
    // Función para obtener el suministro total del token
    function totalSupply() public view returns(uint256) {
        return totalSupply_;
    }
        
    // Función para obtener el saldo de una cuenta
    function balanceOf(address account) public view returns(uint256) {
        return balances[account];
    }

    function allowance(address owner, address spender) external view returns(uint256) {
        return allowed[owner][spender];
    }

    // Función para transferir tokens
    function transfer(address recipient, uint256 amount) public returns(bool) {
        // Comprueba que el remitente tenga suficientes tokens para transferir
        require(amount <= balances[msg.sender]);
        // Resta la cantidad de tokens del remitente
        balances[msg.sender] = balances[msg.sender]-amount;
        // Agrega la cantidad de tokens al destinatario
        balances[recipient] = balances[recipient]+amount;
        // Registra la transferencia de tokens
        return true;    
    }

      function approve(address spender, uint256 amount) public returns(bool) {
        allowed[msg.sender][spender] = amount;
        
        return true;
    }


       function transferFrom(address sender, address recepient, uint256 amount) public returns(bool) {
        require(amount <= balances[sender]);
        require(amount <= allowed[sender][msg.sender]);
        
        balances[sender] = balances[sender] - amount;
        allowed[sender][msg.sender] = allowed[sender][msg.sender] - amount;
        balances[recepient] = balances[recepient] + amount;
        
        return true; 
    }

    
}