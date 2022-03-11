import sys
n=int(input())

left=[]
right=[]

for i in range(n):
    x,y=map(int,sys.stdin.readline().split())
    left.append(x)
    right.append(y)

L=min(right)
R=max(left)

result=R-L if R-L>0 else 0
print(result)




    
