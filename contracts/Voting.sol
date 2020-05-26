pragma solidity >=0.6.0;

contract Voting
{
	event Voted(address voter, uint[4] voteVector);

	mapping (address => bool) public voted;

	mapping (uint => uint) public summaryVoteVector;

	function vote(uint[4] memory voteVector) public
	{
		require(voted[msg.sender] == false, "You must vote only one times!");

		for (uint i = 0; i < 4; i++)
			summaryVoteVector[i] += voteVector[i];
		voted[msg.sender] = true;

		emit Voted(msg.sender, voteVector);
	}
}