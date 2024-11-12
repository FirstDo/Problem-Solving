# 전역 변수
visit = []

def bfs():
    dx = [1, 0, -1, 0]
    dy = [0, -1, 0, 1]
    row = len(visit)
    col = len(visit[0])
    
    index = 0
    queue = [(0, 0, 1)]
    
    while index < len(queue):
        i, j, cnt = queue[index]
        index += 1
        
        if i == row - 1 and j == col - 1:
            return cnt
        
        # 상하좌우 이동
        for k in range(4):
            nx, ny = i + dx[k], j + dy[k]
            
            if 0 <= nx < row and 0 <= ny < col and visit[nx][ny] == 1:
                visit[nx][ny] = 0
                queue.append((nx, ny, cnt + 1))
    
    return -1

def solution(maps):
    global visit
    
    visit = maps
    visit[0][0] = 0
    
    return bfs()
