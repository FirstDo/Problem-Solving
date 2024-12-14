import sys
from collections import deque

input = sys.stdin.readline
n, l = map(int, input().split())
numbers = list(map(int, input().split()))

# (index, number) 형태로 저장
temp = deque([])

for i in range(n):
  # 윈도우의 범위를 벗어난 값 제거하기
  if temp and temp[0][0] <= i - l:
    temp.popleft()

  while temp and numbers[i] < temp[-1][1]:
    temp.pop()

  temp.append((i, numbers[i]))
  print(temp[0][1], end = " ")