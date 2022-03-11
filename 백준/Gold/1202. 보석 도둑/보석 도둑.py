import sys
import heapq
input = sys.stdin.readline
# 입력받기
n,k = map(int,input().split())

jewelryList = [list(map(int, input().split())) for _ in range(n)]
bagList = [int(input()) for _ in range(k)]

# 보석은 무게순으로 내림차순 정렬
jewelryList.sort(reverse=True)
# 가방은 무게순 오름차순 정렬
bagList.sort()

pq = []
answer = 0

# 가방을 순회
for bag in bagList:
	# 특정가방에 들어갈 수 있는 보석들을 모두 heap에 넣는다
	# 힙에 들어간 보석은 리스트에서 지워준다
	while jewelryList and bag >= jewelryList[-1][0]:
		heapq.heappush(pq, -jewelryList[-1][1])
		jewelryList.pop()

	# 가장 가치가 높은 보석(힙의 꼭대기에 있는 보석)을 답에 더한다
	if pq:
		answer += heapq.heappop(pq)

print(-answer)