value = []


nums = "76 101 116 39 115 32 109 97 107 101 32 116 104 105 115 32 97 32 98 105 116 32 116 114 105 99 107 105 101 114 46 46 46"

numbers = [ int(i) for i in nums.split(" ") ]

for i in numbers:
    value.append(chr(i))


print("".join(value))
