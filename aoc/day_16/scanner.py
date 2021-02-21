import os
import exiftool
import zipfile


files = os.listdir('.') # listing this dir

def scan(filesList):
		for file in files:
			if file.endswith(".zip");
				with zipfilep.ZipFile(file) as zip_file:
					zip_file.extract(file)
