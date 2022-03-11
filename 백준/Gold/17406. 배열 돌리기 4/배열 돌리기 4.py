from copy import deepcopy
from itertools import permutations

n, m, k = map(int, input().split())
board = [list(map(int, input().split())) for _ in range(n)]
answer = 50*100+1
key = [list(map(int, input().split())) for _ in range(k)]
result = {}

for op in permutations(key):
    board_c = deepcopy(board)
    for r, c, s in op:
        r -= 1
        c -= 1

        for n in range(s, 0, -1):
            temp = board_c[r-n][c+n]
            board_c[r-n][c-n+1:c+n+1] = board_c[r-n][c-n:c+n] # 열+1
            for row in range(r-n, r+n): # 행 +1
                board_c[row][c-n] = board_c[row+1][c-n]
            board_c[r+n][c-n:c+n] = board_c[r+n][c-n+1:c+n+1] # 열 -1
            for row in range(r+n, r-n, -1): # 행 -1
                board_c[row][c+n] = board_c[row-1][c+n]
            board_c[r-n+1][c+n] = temp

    for i in board_c:
        answer = min(answer, sum(i))

print(answer)