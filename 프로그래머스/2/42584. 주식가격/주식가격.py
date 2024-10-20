def solution(prices):
    stack = []
    answer = list(range(len(prices) - 1, -1, -1))
    
    for (index, num) in enumerate(prices):
        if not stack or stack[-1][1] <= num:
            stack.append((index, num))
            continue
            
        while stack and stack[-1][1] > num:
            element = stack.pop()
            answer[element[0]] = index - element[0]
        
        stack.append((index, num))
        
    return answer