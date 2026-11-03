with open("compile_out.s","r") as f:
	file = f.read()
lines = file.split("\n")
# for l in range(len(lines)):
	# lines[l] = lines[l].replace(":","").replace("_","").replace("ONE","one").replace("1secbeep","onesecbeep")
	# words = lines[l].split()
	# if words[-1][-1] == ":":
		# words[-1] = words[-1][:-1]
	# lines[l] = " ".join(words)

# remove sub zero
pre = len(lines)
lines = [i for i in lines if i != "sub zero"]
print(f"removed {pre-len(lines)} lines")

# # remove lda X sta X
toRemove = []
for i in range(len(lines)-1):
	words1 = lines[i].split()
	words2 = lines[i+1].split()
	if words1[0] == "lda" and words2[0] == "sta" and words1[1] == words2[1]:
		toRemove.append(i+1)

toRemove.reverse()
for i in toRemove:
	lines.pop(i)
print(f"removed {len(toRemove)} lines")

# # remove sta X lda X
toRemove = []
for i in range(len(lines)-1):
	words1 = lines[i].split()
	words2 = lines[i+1].split()
	if words1[0] == "sta" and words2[0] == "lda" and words1[1] == words2[1]:
		toRemove.append(i+1)

toRemove.reverse()
for i in toRemove:
	lines.pop(i)
print(f"removed {len(toRemove)} lines")
print(f"lines remaining: {len(lines)}")
with open("refactored.s", "w") as f:
	f.write("\n".join(lines))
