import requests

print ('=' * 10)
print ("This greate program was made by undermouse")
print ('=' * 10)


for i in range(1, 100, 2):
	print(f"Key: {i}")
	res = requests.get(f"http://10.10.88.141/api/{i}")
	if (not "Error" in res.text):
		print(res.text)
		break