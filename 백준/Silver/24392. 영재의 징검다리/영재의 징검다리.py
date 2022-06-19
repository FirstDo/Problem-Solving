import sys
input = sys.stdin.readline

mod = 1000000007

n, m = map(int, input().split())
graph = [list(map(int, input().split())) for _ in range(n)]
dp = [[0 for _ in range(m)] for _ in range(n)]
dp[n-1] = graph[n-1]

for row in range(n-2,-1,-1):
  for col in range(0,m):
    if graph[row][col] == 1:
      dp[row][col] += dp[row+1][col]

      if col-1 >= 0:
        dp[row][col] += dp[row+1][col-1]
      if col+1 < m:
        dp[row][col] += dp[row+1][col+1]

      dp[row][col] %= mod


print(sum(dp[0]) % mod)