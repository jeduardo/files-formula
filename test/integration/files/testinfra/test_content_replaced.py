import pytest

@pytest.mark.parametrize("name", [
    "/etc/network/interfaces",
])

def test_files_is_placed(host, name):
    f = host.file(name)
    assert f.contains("br0")