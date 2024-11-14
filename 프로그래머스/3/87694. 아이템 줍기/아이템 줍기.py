from collections import deque

class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y

# graph 만들기
def make_graph(rectangle):
    arr = [[-1] * 120 for _ in range(120)]
    
    for rect in rectangle:
        x1, y1, x2, y2 = rect
        
        for i in range(x1, x2 + 1):
            for j in range(y1, y2 + 1):
                # 직사각형의 내부일 경우 0으로 채워주기
                if x1 + 1 <= i < x2 and y1 + 1 <= j < y2:
                    arr[i][j] = 0
                # 직사각형의 내부가 아니고 테두리일 경우 1로 채워주기
                elif arr[i][j] != 0:
                    arr[i][j] = 1
    return arr

def bfs(start, end, graph):
    dx = [1, -1, 0, 0]
    dy = [0, 0, 1, -1]
    
    visited = [[False] * 120 for _ in range(120)]
    visited[start.x][start.y] = True
    
    queue = deque([(start, 0)])
    
    while queue:
        cur_point, dist = queue.popleft()
        
        if cur_point == end:
            return dist // 2
        
        for i in range(4):
            next_point = Point(cur_point.x + dx[i], cur_point.y + dy[i])
            
            if (0 <= next_point.x < 120 and 0 <= next_point.y < 120 and
                not visited[next_point.x][next_point.y] and
                graph[next_point.x][next_point.y] == 1):
                
                visited[next_point.x][next_point.y] = True
                queue.append((next_point, dist + 1))
    
    return 0

def solution(rectangle, characterX, characterY, itemX, itemY):
    double_rectangles = [[x * 2 for x in rect] for rect in rectangle]
    graph = make_graph(double_rectangles)
    result = bfs(
        Point(characterX * 2, characterY * 2),
        Point(itemX * 2, itemY * 2),
        graph
    )
    return result