//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract MyContract {
    // variables can only hold true or false.
    // boolean variables are used to represent a condition that can only have two states, either true or false.
    bool flag;

    function checkGreater(uint a, uint b) public {
        flag = a > b;
    }

    function returnFlag() public view returns (bool) {
        return flag;
    }
}

contract Voting {
    bool isVotingOpen;

    function setVotingState(bool _state) public {
        isVotingOpen = _state;
    }

    function returnVotingState() public view returns (bool) {
        return isVotingOpen;
    }
}
