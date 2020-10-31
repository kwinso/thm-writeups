import requests
import json
import sys	

values = []

current_url_part = ""

base_url = "http://10.10.169.100:3000"

# Starting with empty string, add "next" value from current response to next next.
while True:
	current_url = base_url + "/" + current_url_part

	print("Requesting: " + current_url)

	response = requests.get(current_url)

	data = json.loads(response.text)

	if (data["value"]) == "end":
		break;

	values.append(data["value"])
	current_url_part = data["next"]

print("Value resolved: " + "".join(values))