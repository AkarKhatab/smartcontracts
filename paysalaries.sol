pragma solidity ^0.4.0;
contract PaySalaries {

    bool employeePaid;
    uint private moneyBalance;
    uint private checkvar;
    address owner;
    mapping (address => uint) public balances;

    function PaySalaries() public {
        owner = msg.sender;
        balances[msg.sender] = msg.value;
        employeePaid = false;
        checkvar = 0;
    }

    function addBalance() public payable {
        balances[msg.sender] += msg.value;
    }

    function getSalary(uint _amount) public {
        _amount *= 1000000000000000000;
        checkvar += 1000;
        if (employeePaid == false && this.balance > _amount) {
            checkvar += 100;
            msg.sender.call(_amount)();
            balances[msg.sender] -= _amount;
            employeePaid = true;
            checkvar += 1;
        }
    }

    function kill() public { //self-destruct function,
        if(msg.sender == owner) {
            selfdestruct(owner);
        }
    }

    function getBalance() public constant returns (uint) {
        return this.balance;
    }

    function getCheckvar() public constant returns (uint) {
        return checkvar;
    }
}
