import pytest


@pytest.fixture(scope="function", autouse=True)
def isolate(fn_isolation):
    pass


@pytest.fixture(scope="module")
def voting(Voting, accounts):
    return accounts[0].deploy(Voting)