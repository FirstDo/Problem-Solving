def calc(money, dp, end):
    dp = dp[:]
    
    for i in range(2, end):
        dp[i] = max(dp[i - 1], dp[i - 2] + money[i])
    
    return max(dp)

def solution(money):
    """
    dp[i]: Maximum value that can be stolen up to the i-th house
    dp[i] = max(dp[i-1], dp[i-2] + money[i])
    """
    n = len(money)
    
    # Case 1: Rob the first house
    dp = [0] * n
    dp[0] = money[0]
    dp[1] = money[0]
    
    ans1 = calc(money, dp, n - 1)
    
    # Case 2: Do not rob the first house
    dp = [0] * n
    dp[0] = 0
    dp[1] = money[1]
    
    ans2 = calc(money, dp, n)
    
    return max(ans1, ans2)
