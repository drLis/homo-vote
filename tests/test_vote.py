import pytest
import brownie

def test_vote(voting, accounts):
	alice = accounts[0]
	bob = accounts[1]
	carl = accounts[2]

	alice_vector = [3, 5, 1, 1]
	bob_vector = [1, 1, 5, 3]
	carl_vector = [1, 1, 0, 8]

	tx1 = voting.vote(alice_vector, {"from": alice})
	tx2 = voting.vote(bob_vector, {"from": bob})
	tx3 = voting.vote(carl_vector, {"from": carl})

	assert voting.summaryVoteVector(0) == 5
	assert voting.summaryVoteVector(1) == 7
	assert voting.summaryVoteVector(2) == 6
	assert voting.summaryVoteVector(3) == 12
