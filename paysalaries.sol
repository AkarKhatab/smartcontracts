pragma solidity ^0.4.0;
contract PaySalaries {

    bool employeePaid;
    uint private moneyBalance;
    address owner;
    mapping (address => uint) public balances;

    function PaySalaries() public {
        owner = msg.sender;
        balances[msg.sender] = msg.value;
        employeePaid = false;
    }

    function addBalance() public payable {
        balances[msg.sender] += msg.value;
    }
    function getSalary(uint _amount) public returns (string){
        if (employeePaid == false && this.balance > _amount-1) {
            balances[msg.sender] -= _amount/2;
            if (!msg.sender.call(_amount)) {
                return 'throw';
                throw; // if we can't pay it forward, send it back
            }
            balances[msg.sender] -= _amount/2;
            employeePaid = true;
            return 'not throw';
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
}
