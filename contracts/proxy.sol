// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;



contract ToBeCalled {

    uint public  num;
    address public  sender;
    uint public value;



    function setA(uint _num)external payable  {

                num =3*_num;

                sender = msg.sender;

                value = msg.value;          
    }
}



contract DelegateCall{

    uint public  num;
    address public  sender;
    uint public value;



    function setA(address _toBeCalled, uint _num)external payable {

           (bool success, bytes memory data ) = _toBeCalled.delegatecall( 
            
            abi.encodeWithSelector( ToBeCalled .setA.selector,_num)
            
            );
            
            require(success, "delegatecall failed");
    }

}

