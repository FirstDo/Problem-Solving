import sys
input = sys.stdin.readline
from bisect import bisect

n = int(input())
port = [int(i) for i in input().split()]
cnt = 0

dp = [port[0]]
cnt = 1
for i in range(1,n):
    #그냥 추가가 가능하다면?
    if port[i] > dp[-1]:
        dp.append(port[i])
        cnt += 1
    #그냥 추가가 불가능하다면? 적절한 위치를 찾아줘야함..
    else:
        dp[bisect(dp,port[i])] = port[i]

print(len(dp))

