/******************************** WELCOME TO THE RAFFLE CONTRACT !! ********************************/
/******************************************* -THEUMBRA ********************************************/

/*TO-DO*/
// Raffle
// ENTER THE LOTTERY (PAY AMOUNT)
// PICK A RANDOM WINNER
// WINNER TO BE SELECTED X TIME -> AUTOMATED
// CHAINLIK ORACLE -> RANDOMNESS, AUTOMATED EXECUTION

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

error Raffle_NotEnoughETHEntered();

contract Raffle {
    /*STATE VARIABLES*/
    uint256 private immutable i_enteranceFee;
    address payable[] private s_players;

    /* EVENTS */
    event RaffleEnter(address indexed player);

    constructor(uint256 entranceFee) {
        i_enteranceFee = entranceFee;
    }

    function enterRaffle() public payable {
        // Require (msg.value > i_entranceFee, "Not Enough ETH!") WORKS BUT NOT EFFICIENT
        if (msg.value < i_enteranceFee) {
            revert Raffle_NotEnoughETHEntered();
        }
        s_players.push(payable(msg.sender));
        // Emit an event when we update a dynamic array or mapping
        // Named events with function name reversed
        emit RaffleEnter(msg.sender);
    }

    // function pickRandomWinner() {}

    function getEntranceFee() public view returns (uint256) {
        return i_enteranceFee;
    }

    function getPlayer(uint256 index) public view returns (address) {
        return s_players[index];
    }
}
