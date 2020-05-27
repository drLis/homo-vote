pragma solidity >=0.6.0;

contract Voting
{
	event Voted(address voter, uint[4] voteVector);

	uint constant public n = 10;

	mapping (address => bool) public voted;

	mapping (uint => uint) public summaryVoteVector;

	function vote(uint[4] memory voteVector) public
	{
		require(voted[msg.sender] == false, "You must vote only one times!");
		require(voteVector[0] + voteVector[1] + voteVector[2] + voteVector[3] == n, "Sum of shares must be whole.");

		for (uint i = 0; i < 4; i++)
			summaryVoteVector[i] += voteVector[i];
		voted[msg.sender] = true;

		emit Voted(msg.sender, voteVector);
	}
}