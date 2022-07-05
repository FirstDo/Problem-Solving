import sys
import heapq
input = sys.stdin.readline

(n, m) = map(int, input().split())

# 난이도 배열
difficulty = [0] + list(map(int, input().split()))
# 아이템에 영향을 받는 몬스터, 난이도 배열
item = [[] for i in range(n+1)]
# 몬스터 처리했는지
visit = [False for _ in range(n+1)]

p = int(input())

if p != 0:
  for _ in range(p):
    a, b, c = map(int, input().split())
    # 난이도를 미리 올린다
    difficulty[b] += c
    # 아이템 배열에 추가
    item[a].append((b,c))

queue = []

for i in range(1,n+1):
  # (난이도, 몬스터) 우선순위큐에 추가
  heapq.heappush(queue, (difficulty[i], i))

cnt = 0
result = 0

while cnt < m:
  diff, id = heapq.heappop(queue)

  if visit[id]: continue

  visit[id] = True
  result = max(result, difficulty[id])

  for monsterID, monsterDiff in item[id]:
    if visit[monsterID]: continue
    difficulty[monsterID] -= monsterDiff

    heapq.heappush(queue, (difficulty[monsterID], monsterID))
  cnt += 1

print(result)