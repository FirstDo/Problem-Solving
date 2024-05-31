import sys
input = sys.stdin.readline

basic = "acint"
visited = [False] * 26
words = []
ans = 0

def dfs(depth,idx):
    global ans
    if depth == K-5:
        localCnt = 0
        for word in words:
            for w in word:
                if not visited[ord(w)-ord('a')]:
                    break
            else:
                localCnt += 1
        
        if ans < localCnt:
            ans = localCnt
        return
  
    for i in range(idx,26):
        if not visited[i]:
            visited[i] = True
            dfs(depth+1, i + 1)
            visited[i] = False
    


N,K = map(int,input().split())

if K < 5:
    print(0)
elif K == 26:
    print(N)
else:
    
    words = [set(input().rstrip()) for _ in range(N)]
    for ch in basic:
        visited[ord(ch)-ord('a')] = True
    dfs(0,0)
    print(ans)





