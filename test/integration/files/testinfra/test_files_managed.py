import pytest

@pytest.mark.parametrize("name", [
    "/srv/openvpn/up.sh",
    "/srv/openvpn/down.sh",
])

def test_files_is_placed(host, name):
    f = host.file(name)
    assert f.contains("brctl")
    assert f.user == "root"
    assert f.group == "root"
    assert f.mode == 0o700
