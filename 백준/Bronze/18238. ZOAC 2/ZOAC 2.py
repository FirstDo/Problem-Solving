target=input()
arrow=ord('A')
#A~Z~A~Z...
cnt=0
#정방향으로 가야할지 역방향으로 가야할지..
for ch in target:
    t=ord(ch)
    if abs(t-arrow)<=13:
        cnt+=abs(t-arrow)
    else:
        cnt+=(26-abs(t-arrow))
    arrow=ord(ch)

print(cnt)



    
