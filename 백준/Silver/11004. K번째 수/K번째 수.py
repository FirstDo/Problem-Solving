def solution():
    n, k = map(int, input().split())
    numbers = list(map(int, input().split()))
    
    numbers.sort()
    return numbers[k-1]

result = solution()
print(result)
