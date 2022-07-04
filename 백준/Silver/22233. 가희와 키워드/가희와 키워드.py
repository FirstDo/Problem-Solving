import sys
input = sys.stdin.readline

(n, m) = map(int, input().split())

words = []

for _ in range(n):
  words.append(input().rstrip())

words = set(words)

for _ in range(m):
  for word in list(input().rstrip().split(sep = ',')):
    words.discard(word)
  
  print(len(words))