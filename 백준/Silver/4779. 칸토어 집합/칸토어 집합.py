import sys
input = sys.stdin.readline

def divideThree(n):
    if n == 0:
        print('-',end = '')
        return
    
    divideThree(n-1)
    print(' ' * 3**(n-1), end = '')
    divideThree(n-1)

while True:
    try:
        n = int(input())
        divideThree(n)
        print()
    except:
        break