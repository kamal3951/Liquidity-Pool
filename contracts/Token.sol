//SPDX-License-Identifier:MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract Token is ERC20, AccessControl, Pausable {
    address public owner;

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");
    bytes32 public constant MY_ROLE = keccak256("MY_ROLE");

    constructor() ERC20("MYTOKEN", "MT") {
        _mint(msg.sender, 1000 * 10**18);
        owner = msg.sender;

        _setupRole(MINTER_ROLE, msg.sender);
        _setupRole(BURNER_ROLE, msg.sender);
        _setupRole(PAUSER_ROLE, msg.sender);
    }

    function mint(address to, uint256 amount) external {
        require(msg.sender == owner, "Only admin can mint");
        _mint(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    modifier onlyAdmin() {
        require(msg.sender == owner);
        _;
    }

    modifier setPaused() {
        require(paused());
        _;
    }

    function Transfer(address recipient, uint256 amount)
        public
        virtual
        onlyAdmin
        setPaused
        returns (bool)
    {
        transfer(recipient, amount);
    }
}
