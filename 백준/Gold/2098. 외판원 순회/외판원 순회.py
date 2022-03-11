import sys
input = sys.stdin.readline

n = int(input())
graph = []
for _ in range(n):
    graph.append(list(map(int,input().split())))

INF = sys.maxsize
dp = [[0]*(1<<n) for _ in range(n)]
total = (1<<n)-1   

def tsp(last,visited):
    if visited == total:    # 전부 다 방문했음을 의미한다
        return graph[last][0] if graph[last][0] > 0 else INF
    if dp[last][visited] > 0:   # dp에 값이 있다면 그 값을 return
        return dp[last][visited]   
    tmp = INF
    for city in range(n):
        # city를 방문하지 않았고, last -> city로 가는 경로가 있다면,
        if visited & (1<<city) == 0 and graph[last][city]!=0:
            tmp = min(tmp, tsp(city,visited|(1<<city)) + graph[last][city])
    dp[last][visited] = tmp
    return tmp


print(tsp(0,1))

