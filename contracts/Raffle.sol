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

import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";

error Raffle_NotEnoughETHEntered();

contract Raffle is VRFConsumerBaseV2 {
    /*STATE VARIABLES*/
    uint256 private immutable i_enteranceFee;
    address payable[] private s_players;

    /* EVENTS */
    event RaffleEnter(address indexed player);

    constructor(address vrfCoordianatorV2, uint256 entranceFee)
        VRFConsumerBaseV2(vrfCoordianatorV2)
    {
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

    function requestRandomWinner() external {
        // Request the random number
        // Once We get it , do something
        // 2 transaction process
    }

    function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords)
        internal
        override
    {}

    /* View / Pure Functions */
    function getEntranceFee() public view returns (uint256) {
        return i_enteranceFee;
    }

    function getPlayer(uint256 index) public view returns (address) {
        return s_players[index];
    }
}
