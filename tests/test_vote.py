import pytest
import brownie

def test_vote(voting, accounts):
	alice = accounts[0]
	bob = accounts[1]
	carl = accounts[2]

	alice_vector = [3, 5, 1, 1]
	bob_vector = [1, 1, 5, 3]
	carl_vector = [1, 1, 0, 8]