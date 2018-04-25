pragma solidity ^0.4.0;
contract Employee {

    uint private moneyBalance = 0;
    address owner;
    address paysalaries;
    uint private checkvar_empl;
    mapping (address => uint) public balances;

    function Employee (address _paysalaries) public {
        owner = msg.sender;
        checkvar_empl = 0;
        paysalaries = _paysalaries;
    }

    function addBalance() public payable {
        balances[msg.sender] += msg.value;
    }
    
    function askSalary(uint _amount) public {
        checkvar_empl += 1;
        paysalaries.call(bytes4(keccak256("getSalary(uint256)")),_amount);
        checkvar_empl += 10;
    }

    function getMyBalance() public constant returns (uint) {
        return this.balance;
    }

    function kill() public { //self-destruct function,
        if(msg.sender == owner) {
            selfdestruct(owner);
        }
    }
    
    function getCheckvarEmpl() public constant returns (uint) {
        return checkvar_empl;
    }

}
