pragma solidity >=0.6.0;

import "./_lib/SolidityHomomorphicHiding/contracts/HomomorphicHiding.sol";

contract Voting
{
	using HomomorphicHiding for E;

	event Voted(address voter);

	uint constant public n = 10;

	mapping (address => bool) public voted;

	mapping (uint => E) public summaryVoteVector;

	constructor() public
	{
		for (uint i = 0; i < 4; i++)
			summaryVoteVector[i] = HomomorphicHiding.e(0);
	}

	function vote(uint[2][4] memory input) public
	{
		require(voted[msg.sender] == false, "You must vote only one times!");
		E[4] memory voteVector;
		for (uint i = 0; i < 4; i++)
		{
			voteVector[i] = readE(input[i]);
		}

		require(voteVector[0].add(voteVector[1]).add(voteVector[2]).add(voteVector[3]).equals(HomomorphicHiding.e(n)), "Sum of shares must be whole.");

		for (uint i = 0; i < 4; i++)
			summaryVoteVector[i] = summaryVoteVector[i].add(voteVector[i]);
		voted[msg.sender] = true;

		emit Voted(msg.sender);
	}

	function readE(uint[2] memory input) internal pure returns (E memory e)
	{
		e.x = input[0];
		e.y = input[1];
	}
}