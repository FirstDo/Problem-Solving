N,L,K=map(int,input().split())
problem=[[0]*2 for _ in range(N)]

for i in range(N):
    problem[i]=list(map(int,input().split()))

#solve할 수 있는 문제의 개수
solve2=0
solve1=0
for i in range(N):
    if max(problem[i])<=L:
        solve2+=1
    elif min(problem[i])<=L:
        solve1+=1
score=0
s=0
while s<K:
    #다 풀었으면
    if s==N:
        break
    #풀수 있는 문제가 없으면
    elif solve2==0 and solve1==0:
        break
    if solve2>0:
        solve2-=1
        score+=140
        s+=1
    elif solve1>0:
        solve1-=1
        score+=100
        s+=1
print(score)

    
