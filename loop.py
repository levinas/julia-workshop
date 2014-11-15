import sys

total = 0.0
for i in range(9999): # xrange is slower according 
    for j in range(1, 9999):            #to my test but more memory-friendly.
        total += (i / j)

print total
