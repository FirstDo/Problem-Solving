import sys
input = sys.stdin.readline


n,k = map(int,input().split())
dp = [0]* (k+1)
dp[0] = 1
coin = []
for _ in range(n):
    coin.append(int(input()))

for c in coin:
    for i in range(1,k+1):
        if i-c>=0:
            #print(i,c)
            dp[i] += dp[i-c]

print(dp[k])