n = int(input())
p = list(map(int, input().split()))

leftDP = [0] * n
rightDP = [0] * n

leftSumDP = [0] * n
rightSumDP = [0] * n

leftDP[0] = p[0]
leftSumDP[0] = p[0]

for i in range(1,n):
  leftDP[i] = max(p[i], leftDP[i-1] + p[i])
  leftSumDP[i] = max(leftSumDP[i-1], leftDP[i])


rightDP[n-1] = p[n-1]
rightSumDP[n-1] = p[n-1]

for i in range(n-2,-1,-1):
  rightDP[i] = max(p[i], rightDP[i+1] + p[i])
  rightSumDP[i] = max(rightSumDP[i+1], rightDP[i])

temp = max(0, leftSumDP[n-1])

for i in range(0,n-1):
    temp = max(temp, leftSumDP[i] + rightSumDP[i+1])

print(temp + sum(p))
