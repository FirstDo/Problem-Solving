import sys
input = sys.stdin.readline

R,C = map(int,input().split())
board = [list(input().rstrip()) for _ in range(R)]

dx = [-1,1,0,0]
dy = [0,0,-1,1]
visited = [False] * 26
result = 0

def dfs(x,y,cnt):
    global result
    if cnt > result:
        result = cnt
    
    for i in range(4):
        nx = x + dx[i]
        ny = y + dy[i]

        if nx<0 or nx>=R or ny<0 or ny>=C:
            continue
        aIdx = ord(board[nx][ny]) - ord('A')
        if visited[aIdx]:
            continue
        visited[aIdx] = True
        dfs(nx,ny,cnt+1)
        visited[aIdx] = False

    

idx = ord(board[0][0]) - ord('A')
visited[idx] = True
dfs(0,0,1)
print(result)

