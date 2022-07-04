import sys
input = sys.stdin.readline

def dfs(depth, pay):
  global result
  
  if depth == n:
    result = min(result, pay)
    return

  for i in range(1,n+1):
    if visit[i]: continue

    visit[i] = True
    for (no, value) in potionDict[i]:
      costs[no] -= value

    if costs[i] >= 1:
      dfs(depth+1, pay + costs[i])
    else:
      dfs(depth+1, pay + 1)

    visit[i] = False
    for (no, value) in potionDict[i]:
      costs[no] += value

    

n = int(input())
costs = [0] + list(map(int, input().split()))

potionDict = {}
visit = [False for _ in range(n+1)]
result = 1000000000

for i in range(1,n+1):
  potionDict[i] = []

  for _ in range(int(input())):
    a, d = map(int, input().split())
    potionDict[i].append((a, d))

dfs(0,0)
print(result)