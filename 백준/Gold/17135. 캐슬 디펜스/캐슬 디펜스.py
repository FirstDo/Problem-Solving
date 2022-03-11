import sys
input = sys.stdin.readline
import copy

# 1 궁수의 배치를 구한다
def combination(idx,depth):
    if depth == 3:
        temp = []
        for i in range(m):
            if visited[i]:
                temp.append((n,i))
        archors.append(copy.deepcopy(temp))

    for i in range(idx,m):
        if visited[i]:
            continue
        visited[i] = True
        combination(i+1,depth+1)
        visited[i] = False

#궁수의 공격함수
def attack(arr1,arr2,arr3):
    copyMap = copy.deepcopy(map)
    enemyCur = set()
    cnt = 0
    dist = d
    limit = n
    while limit > 0:
        #print("limit: ",limit, "distance: ", dist)
        #limit를 걷어내야한다.
        #distance를 확인해야 한다.
        if not arr1 or not arr2 or not arr3:
            break
        t1 = arr1[-1]
        t2 = arr2[-1]
        t3 = arr3[-1]

        #넘어간 범위를 제거, 겹친 범위를 제거
        while ( t1[1] >= limit or copyMap[t1[1]][t1[2]] == -1 ) and arr1:
            copyMap[t1[1]][t1[2]] = -1
            arr1.pop()
            if not arr1:
                break
            t1 = arr1[-1]
        while (t2[1] >= limit or copyMap[t2[1]][t2[2]] == -1 )and arr2:
            copyMap[t2[1]][t2[2]] = -1
            arr2.pop()
            if not arr2:
                break
            t2 = arr2[-1]
        while (t3[1] >= limit or copyMap[t3[1]][t3[2]] == -1 ) and arr3:
            copyMap[t3[1]][t3[2]] = -1
            arr3.pop()
            if not arr3:
                break
            t3 = arr3[-1]

        if not arr1 or not arr2 or not arr3:
            break
        if debug:
            print(arr1)
            print(arr2)
            print(arr3)

        
        if t1[0] <= dist:
            arr1.pop()
            copyMap[t1[1]][t1[2]] = -1
            enemyCur.add((t1[1],t1[2]))
        if t2[0] <= dist:
            arr2.pop()
            copyMap[t2[1]][t2[2]] = -1
            enemyCur.add((t2[1],t2[2]))
        if t3[0] <= dist:
            arr3.pop()
            copyMap[t3[1]][t3[2]] = -1
            enemyCur.add((t3[1],t3[2]))        
        cnt += len(enemyCur)
        if debug:
            print(enemyCur)
        enemyCur.clear()
        dist += 1
        limit -= 1
    if debug:
        print("cnt: ",cnt)
    return cnt

n,m,d = map(int,input().split())
map = []
enemy = set()
visited = [False]*m
archors = []
# map, enemy 배열을 만든다.
for i in range(n):
    lines = [int(i) for i in input().split()]
    map.append(lines)
    for j in range(m):
        if lines[j] == 1:
            enemy.add((i,j))

combination(0,0)
cnt = 0
debug = False
for archor in archors:
    a1 = []
    a2 = []
    a3 = []
    for e in enemy:
        d1 = abs(archor[0][0] - e[0]) + abs(archor[0][1] - e[1])
        d2 = abs(archor[1][0] - e[0]) + abs(archor[1][1] - e[1])
        d3 = abs(archor[2][0] - e[0]) + abs(archor[2][1] - e[1])
        a1.append((d1,e[0],e[1]))
        a2.append((d2,e[0],e[1]))
        a3.append((d3,e[0],e[1]))

        a1.sort(key = lambda x : (-x[0], -x[2]))
        a2.sort(key = lambda x : (-x[0], -x[2]))
        a3.sort(key = lambda x : (-x[0], -x[2]))

    cnt = max(cnt,attack(a1,a2,a3))
    debug = False

print(cnt) 