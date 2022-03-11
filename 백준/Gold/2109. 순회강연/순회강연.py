import sys
import heapq

input = sys.stdin.readline

n = int(input())

univ_list = [] 

for _ in range(n):
	p, d = map(int,input().split())
	univ_list.append([p,d])

# 기간순으로 오름차순정렬
univ_list = sorted(univ_list, key = lambda x: x[1])
sums = []

for univ in univ_list:
	heapq.heappush(sums,univ[0])

	if len(sums) > univ[1]:
		heapq.heappop(sums)
print(sum(sums))