// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";

import {HelperConfig} from "./HelperConfig.s.sol";
import {MyContract} from "../src/MyContract.sol";



contract DeployMyContract is Script {

    function run() external returns(MyContract) {
        HelperConfig helperConfig = new HelperConfig();
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();
        vm.startBroadcast();
        MyContract mContract = new MyContract(ethUsdPriceFeed);
        vm.stopBroadcast();
        return mContract;
    }
}