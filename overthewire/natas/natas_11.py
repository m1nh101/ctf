import base64


def get_encrypt_key() -> str:
    json_payload = '{"showpassword":"no","bgcolor":"#ffffff"}'
    encrypted_data = 'HmYkBwozJw4WNyAAFyB1VUcqOE1JZjUIBis7ABdmbU1GIjEJAyIxTRg='
    decoded = base64.b64decode(encrypted_data).decode()
    encrypted_str_len = len(decoded)
    key = ''

    for i in range(0, len(json_payload)):
        key += chr(ord(json_payload[i]) ^ ord(decoded[i % encrypted_str_len]))

    return key[:4]


def create_encrypt_str(key: str) -> str:
    json_payload = '{"showpassword":"yes","bgcolor":"#ffffff"}'
    data = ''
    
    for i in range(len(json_payload)):
        data += chr(ord(json_payload[i]) ^ ord(key[i % len(key)]))

    return base64.b64encode(data.encode('utf-8'))


key = get_encrypt_key()
print(key)
payload = create_encrypt_str(key)
print(payload)
