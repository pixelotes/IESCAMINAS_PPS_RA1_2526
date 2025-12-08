pragma solidity ^0.8.0;

contract MerkleTree {
    
    // Dirección del dueño del contrato
    address public owner;

    // Raíz del árbol de Merkle
    bytes32 public merkleRoot;

    constructor() {
        owner = msg.sender; // El que despliega es el dueño
    }

    // Restricción: solo el dueño puede ejecutar
    modifier onlyOwner() {
        require(msg.sender == owner, "Error: No eres el dueno del contrato");
        _;
    }

    // Establece la raíz del árbol (solo dueño)
    function setMerkleRoot(bytes32 _newRoot) external onlyOwner {
        merkleRoot = _newRoot;
    }

    // Verifica si un dato pertenece al Merkle Tree usando una prueba
    function verificar(bytes32[] memory proof, string memory dato) public view returns (bool) {
        // Hash inicial de la hoja
        bytes32 hashCalculado = keccak256(abi.encodePacked(dato));

        // Recorremos la prueba para reconstruir la raíz
        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 elementoPrueba = proof[i];

            // Orden lexicografico para formar cada hash padre
            if (hashCalculado < elementoPrueba) {
                hashCalculado = keccak256(abi.encodePacked(hashCalculado, elementoPrueba));
            } else {
                hashCalculado = keccak256(abi.encodePacked(elementoPrueba, hashCalculado));
            }
        }

        // Comprobamos si coincide con la raiz guardada
        return hashCalculado == merkleRoot;
    }
}
