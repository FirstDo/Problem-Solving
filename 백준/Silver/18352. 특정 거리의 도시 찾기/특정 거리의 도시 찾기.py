from collections import deque
import sys
input = sys.stdin.readline

def bfs(x):
    distance[x] = 0
    q = deque([x])

    while q:
        now = q.popleft()
        for next in graph[now]:
            if distance[next] == -1 :
                distance[next] = distance[now] + 1
                q.append(next)
    

n,m,k,x = map(int,input().split())
graph = [[] for _ in range(n+1)]
#x로부터 출발하여 도달할 수 있는 모든 도시 중에서 최단거리가 정확히 k인 도시 출력

for _ in range(m):
    v1,v2 = map(int,input().split())
    graph[v1].append(v2)

# bfs로 풀어보기
distance = [-1] * (n+1)
check = False
bfs(x)

for i in range(1,n+1):
    if distance[i] == k:
        check = True
        print(i)
    
if not check:
    print(-1)



# 다익스트라로 풀어보기
