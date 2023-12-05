
import random
import sys

def fallback():
    print("Well, nothing added yet.")
    print("Try {redo --help}")
    sys.exit(0)

# for use with redo shell only
try:
    d = open(sys.argv[1], "r")
except:
    fallback()
        
s = d.readlines()
d.close()

lines = []

for ln in s:
    lines.append(ln.strip())
    
if not len(lines):
    fallback() # nothing to do

# process game 
print("Answer y / n / exit \n")
while(len(lines)):
     rint = random.randint(0, len(lines)-1)
     term = lines.pop(rint)
     print("Do you remember about {}?".format(term))
     a = input(".. ")
     if a == "n":
         print("Are you going to repeat?\n")
         sys.exit(0)
     elif not (a == "y" or a == "n"):
         print("Well done!\n")
         sys.exit(0)
         
# ran out of words

print("\nThat's all for today. No more words left!\n")
