pragma solidity >=0.6.0;

contract Voting
{
	event Voted(address voter, uint candidate);

	mapping (address => bool) public voted;
	
	uint[4] public votesForCandidate;

	function vote(uint candidate) public
	{
		require(voted[msg.sender] == false, "You must vote only one times!");

		votesForCandidate[candidate]++;
		voted[msg.sender] = true;

		emit Voted(msg.sender, candidate);
	}
}