#9019 DSLR
from collections import deque
import sys
input = sys.stdin.readline

def bfs():
	visited = [False] * 10000
	visited[a] = True
	q = deque()
	q.append((a,""))

	while q:
		cur,log = q.popleft()

		if cur == b:
			return log

		D = cur * 2 % 10000
		S = 9999 if cur == 0 else cur-1
		
		f = cur // 1000
		r = cur % 1000

		L = r * 10 + f

		f = cur // 10
		r = cur % 10
		
		R = r * 1000 + f

		for num,ch in [(D,"D"),(S,"S"),(L,"L"),(R,"R")]:
			if not visited[num]:
				visited[num] = True
				q.append((num,log+ch))

t = int(input())
for _ in range(t):
	a,b = map(int,input().split())
	print(bfs())