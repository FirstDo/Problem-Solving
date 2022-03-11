import sys
input = sys.stdin.readline

n = int(input())
A = [0] * n
B = [0] * n
C = [0] * n
D = [0] * n


for i in range(0,n):
    A[i],B[i],C[i],D[i] = map(int,input().split())


DicA = [0] * (n*n)
DicB = [0] * (n*n)

for i in range(n):
    for j in range(n):
        DicA[i*n+j] = A[i] + B[j]
        DicB[i*n+j] = C[i] + D[j]

DicA.sort()
DicB.sort()

leftLen = len(DicA)
rightLen = len(DicB)

start, end = 0, rightLen - 1
ans = 0

while start < leftLen and end >= 0:
    if DicA[start] + DicB[end] > 0:
        end -= 1
    elif DicA[start] + DicB[end] < 0:
        start += 1
    else:
        cntA, cntB = 1,1
        while start < leftLen -1 and DicA[start] == DicA[start + 1]:
            start += 1
            cntA += 1
        while end > 0 and DicB[end] == DicB[end-1]:
            end -= 1
            cntB += 1
        
        ans += (cntA * cntB)
        start += 1
        end -= 1

print(ans)
        

