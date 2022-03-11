#18258 큐 2
import sys
from collections import deque

input = sys.stdin.readline

n = int(input())

queue = deque([])
ans = []

for _ in range(n):
	cmds = input().rstrip().split(" ")
	
	if len(cmds) == 2:
		queue.append(cmds[1])
	elif cmds[0] == "front":
		if queue:
			print(queue[0])
		else:
			print(-1)
			
	elif cmds[0] == "back":
		if queue:
			print(queue[-1])
		else:
			print(-1)
	elif cmds[0] == "size":
		print(len(queue))
	elif cmds[0] == "empty":
		if queue:
			print(0)
		else:
			print(1)
	elif cmds[0] == "pop":
		if queue:
			print(queue.popleft())
		else:
			print(-1)