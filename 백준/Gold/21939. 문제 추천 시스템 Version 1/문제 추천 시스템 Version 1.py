from collections import defaultdict
import heapq
            
in_list = defaultdict(bool)
easy = []
hard = []     

def add(p,l):
    in_list[p] = True
    heapq.heappush(easy, (l,p))
    heapq.heappush(hard, (-l, -p))
    
def solved(p):
    in_list[p] = False
    while easy and not in_list[easy[0][1]]:
        heapq.heappop(easy)
    while hard and not in_list[-hard[0][1]]:
        heapq.heappop(hard)
        
def recommend(x) -> int:
    if x == 1:
        while not in_list[-hard[0][1]]:
            heapq.heappop(hard)
        return -hard[0][1]
    else:
        while not in_list[easy[0][1]]:
            heapq.heappop(easy)
        return easy[0][1]


n = int(input())
for _ in range(n):
    p, l = map(int, input().split())
    add(p,l)
m = int(input())
for _ in range(m):
	cmd = list(input().split())
	if cmd[0] == 'add':
		add(int(cmd[1]), int(cmd[2]))
	elif cmd[0] == 'recommend':
		print(recommend(int(cmd[1])))
	else:
		solved(int(cmd[1]))

            

