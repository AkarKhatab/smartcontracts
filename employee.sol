pragma solidity ^0.4.0;
import './PaySalaries.sol';

contract Employee {

    uint private moneyBalance = 0;
    address owner;
    mapping (address => uint) public balances;

    function Employee () public {
        owner = msg.sender;
    }

    function addBalance() public payable {
        balances[msg.sender] += msg.value;
    }
    function askSalary(uint _amount) public {
        //watch_addr.call(bytes4(sha3("getSalary(_amount)")), _amount);
    }

    function getMyBalance() public constant returns (uint) {
        return this.balance;
    }

    function kill() public { //self-destruct function,
        if(msg.sender == owner) {
            selfdestruct(owner);
        }
}

    function () payable {

    }
}
