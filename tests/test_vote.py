import pytest
import brownie


def test_vote(voting, accounts):

	def e(vector):
		new_vector = []
		for i in vector:
			new_vector.append(voting.e(i))
		return new_vector

	alice = accounts[0]
	bob = accounts[1]
	carl = accounts[2]

	alice_vector = [3, 5, 1, 1]
	bob_vector = [1, 1, 5, 3]
	carl_vector = [1, 1, 0, 8]

	tx1 = voting.vote(e(alice_vector), {"from": alice})
	tx2 = voting.vote(e(bob_vector), {"from": bob})
	tx3 = voting.vote(e(carl_vector), {"from": carl})

	assert voting.summaryVoteVector(0) == voting.e(5)
	assert voting.summaryVoteVector(1) == voting.e(7)
	assert voting.summaryVoteVector(2) == voting.e(6)
	assert voting.summaryVoteVector(3) == voting.e(12)

	assert voting.check([5, 7, 6, 12]) == True
