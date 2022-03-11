#1655번 가운데를 말해요
import sys
import heapq

input = sys.stdin.readline

l_heap = [] #max heap
r_heap = []	#min heap

ans = []

for _ in range(int(input())):
	num = int(input())

	if len(l_heap) == len(r_heap):
		heapq.heappush(l_heap, num * -1)
	else:
		heapq.heappush(r_heap, num)

	if r_heap and r_heap[0] < l_heap[0] * -1:
		r = heapq.heappop(r_heap)
		l = heapq.heappop(l_heap) * -1

		heapq.heappush(l_heap,r * -1)
		heapq.heappush(r_heap,l)

	ans.append(l_heap[0] * -1)

for a in ans:
	print(a)