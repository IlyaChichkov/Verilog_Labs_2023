import serial
from binascii import hexlify, unhexlify

from sympy import EX

encoded_message = ''

def get_data_to_encode():
  buff = ''
  with open('message.txt') as f:
    for line in f:
      buff += line
  return buff

def init_serial():
  s = serial.Serial()
  s.port = 'COM19'
  s.baudrate = 9600
  return s

def read_encoded_msg(serial):
  res = ''
  for i in range(16):
      res += str(serial.read().hex())
  result = bytearray.fromhex(res).decode("utf-8", errors='ignore')
  print(result)
  global encoded_message
  encoded_message += result

def encode(message: str):
  if len(message) > 32:
    message = message[:32]
  elif len(message) < 32:
    message = message.zfill(32)

  global encoded_message
  encoded_message = ''

  s = init_serial()
  s.open()
  print(f"> Writing to cipher: {message}")
  data = unhexlify(message)
  s.write(data)
  try:
    read_encoded_msg(s)
  except Exception as e:
    print("Error: ", e.message)

  s.close()

def encode_demo():
  global encoded_message
  encoded_message = ''

  cipher_data = get_data_to_encode()

  s = init_serial()
  s.open()

  for i in range(int(len(cipher_data) / 32)):
    data = unhexlify(cipher_data[i*32:(i*32)+32])
    s.write(data)
    read_encoded_msg(s)

  s.close()

if __name__ == '__main__':
  encode_demo()