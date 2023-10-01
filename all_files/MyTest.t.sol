// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";

import {MyContract} from "../src/MyContract.sol";
import {DeployMyContract} from "../script/MyScript.s.sol";

contract MyTest is Test {
    MyContract mContract;
    function setUp() external {
        DeployMyContract deployMyContract = new DeployMyContract();
        mContract = deployMyContract.run();
    }

    function testTotalFunds() public {
        assertEq(mContract.total_funds(), 0);
    }

    function testPriceFeed() public {
        assertEq(mContract.i_owner(), msg.sender);
    }

    function testVersion() public {
        assertEq(mContract.getVersion(), 4);
    }
}