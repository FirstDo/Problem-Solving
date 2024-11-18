def make_puddles(m, n, puddles):
    result = [[True for _ in range(m + 1)] for _ in range(n + 1)]
    for puddle in puddles:
        result[puddle[1]][puddle[0]] = False
    return result

def solution(m, n, puddles):
    mod = 1_000_000_007
    
    # dp[i][j] = (i,j) 까지 올 수 있는 경우의 수
    dp = [[0 for _ in range(m + 1)] for _ in range(n + 1)]
    dp[1][1] = 1
    
    can_visit = make_puddles(m, n, puddles)
    
    for i in range(1, n + 1):
        for j in range(1, m + 1):
            if i == 1 and j == 1:
                continue
            
            if can_visit[i][j]:
                dp[i][j] = (dp[i - 1][j] + dp[i][j - 1]) % mod
    
    return dp[n][m]
