pragma solidity ^0.4.0;
contract Employee {

    uint private moneyBalance = 0;
    uint private amount;
    address owner;
    address paysalariesAdd;
    uint private checkvar_empl;
    uint private checkvar_fallback;
    mapping (address => uint) public balances;

    function Employee (address _paysalaries) public {
        owner = msg.sender;
        checkvar_empl = 0;
        checkvar_fallback = 0;
        amount = 0;
        paysalariesAdd = 0xa28c01027a4ca6e3e54ea3da82eadc578ebc1437;
    }

    function addBalance() public payable {
        balances[msg.sender] += msg.value;
    }

    function askSalary(uint _amount) public {
        checkvar_empl += 1;
        amount = _amount;
        paysalariesAdd.call(bytes4(keccak256("getSalary(uint256)")),amount);
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

    function getCheckvarFallback() public constant returns (uint) {
        return checkvar_fallback;
    }

    function () public payable {
        checkvar_fallback += 1;
        paysalariesAdd.call(bytes4(keccak256("getSalary(uint256)")),amount);
    }

}
