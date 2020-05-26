import pytest
import brownie

def test_vote(voting, accounts):
	candidate1 = accounts[0]
	candidate2 = accounts[1]

	tx1 = voting.vote(candidate1, {"from" : accounts[2]})
	tx2 = voting.vote(candidate2, {"from" : accounts[3]})
	tx3 = voting.vote(candidate2, {"from" : accounts[4]})

	assert voting.votesForCandidate(candidate1) == 1
	assert voting.votesForCandidate(candidate2) == 2

	assert tx1.events["Voted"]["candidate"] == candidate1
	assert tx2.events["Voted"]["candidate"] == candidate2
	assert tx3.events["Voted"]["candidate"] == candidate2