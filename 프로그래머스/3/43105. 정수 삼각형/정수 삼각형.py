def solution(triangle):
    limit = 500
    height = len(triangle)
    
    # dp[i][j] = i행 j열이 가질 수 있는 최대값
    dp = [[0] * (limit + 1) for _ in range(limit + 1)]
    dp[0][0] = triangle[0][0]
    
    for i in range(1, height):
        for j in range(i + 1):
            # 왼쪽 끝
            if j == 0:
                dp[i][j] = triangle[i][j] + dp[i-1][j]
            # 오른쪽 끝
            elif j == i:
                dp[i][j] = triangle[i][j] + dp[i-1][j-1]
            # 일반
            else:
                dp[i][j] = triangle[i][j] + max(dp[i-1][j-1], dp[i-1][j])
    
    return max(dp[height-1])
