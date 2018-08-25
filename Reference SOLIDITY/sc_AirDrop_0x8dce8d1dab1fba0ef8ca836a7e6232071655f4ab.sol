/**********************************************************************
*These solidity codes have been obtained from Etherscan for extracting
*the smartcontract related info.
*The data will be used by MATRIX AI team as the reference basis for
*MATRIX model analysis,extraction of contract semantics,
*as well as AI based data analysis, etc.
**********************************************************************/
pragma solidity ^0.4.19;

interface UNetworkToken {
    function transfer(address _to, uint256 _value) public;
}


contract AirDrop {

	UNetworkToken UUU;
	address public owner;

	address[] public recipients = [0x0aF9d2fee427dDb222F1770585F5681969Fdc673, 0xaD41A9B2BAF0671312ff74bC9C4E4447Cc2D3b10, 0x503Fa70B5365978cc6D1784F78983bBe6F041F43, 0xBBf442191aB5213de67Dd4026560c9940F349A6B, 0x3cfbCF1A945Ed6FBf14b701C4524620b29CaF92D, 0xC21395D0ed740961d700B9665687826761f8F0E4, 0xa5851819a8689dbe652347af7772792b2c88bb28, 0xA34A8Ce83B19a89e3a8b3703424451f6bD203b17, 0x716C08e41B99cDd2Aab4bd45ADf20e40b70eaa4c, 0x3B8a44473199C577B591A19ECa42E3c5709A7082, 0xAEDBa642E4F4B2DADBd710D48e21Ac8Ca71ace9c, 0xAca3eD76Dc39d81D0965f2f345E1fd81A0aD5EA8, 0x4d8028cCeeCFdD6bE01b9453B45aC532A4cA3b89, 0x82EDC5a564eB0270381e7f0a5b5e49Eeb8E7408d, 0xf4bf47BfB25937C5BACD84D60791e105bdf1863a, 0xbfaaf37cf26fdd8f5d0af25783023ef65271c541, 0x84F748c6f3514794E1A2FF74Cb6FcB01482a4A08, 0x77ab8a655C6CF540471140EFD0EaaBaE78C132a0, 0xf0b62c2987a5abe5b122d5c1cbe8cc4db3e75fce, 0x2D3c3210188f40cE421E765C8Cb42B9C2d50dAcB, 0x1b1844af2d1a25ac0fe66c82161f505fca26fdd1, 0x6d15061a61E3d0E984410b9e6442422bb4Af237c, 0x5e39CdEdB4AFE732EC89760187bf3Bfe3679Fb7F, 0x1A7E1864DAcF2bB69efd88000245092c6D9FA0f7, 0x2357ee9647e47e47610ff75378ac0543404ec15e, 0x81D723361d4F3e648F2c9c479d88DC6dEBF4fA5f, 0xc1F064Cbb8001da72F8E823D8865f6ec8BAd6e3A];	
	uint256[] public values = [20000, 20000, 10000, 20000, 20000, 20000, 10000, 10000, 10000, 10000, 10000, 20000, 50000, 50000, 50000, 20000, 50000, 20000, 50000, 10000, 20000, 20000, 20000, 20000, 10000, 10000, 10000];
	function AirDrop() public {
		require(values.length == recipients.length);
		UUU = UNetworkToken(0x3543638eD4a9006E4840B105944271Bcea15605D);
		owner = msg.sender;
	}

	function drop() public {
		require(msg.sender == owner);	
	    for (uint256 i = 0; i < recipients.length; i++) {
	    	UUU.transfer(recipients[i], values[i] * 10 ** 18);
	    }
	}

	// in case of balance surplus. Return remaining UUU.
	function refund() public {
		require (msg.sender == owner);
		UUU.transfer(owner, 100000 * 10**18);
	}
}