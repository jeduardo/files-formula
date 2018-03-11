import pytest

@pytest.mark.parametrize("name", [
    "/srv/openvpn",
])

def test_directory_is_placed(host, name):
    f = host.file(name)
    assert f.is_directory
    assert f.user == "root"
    assert f.group == "root"
