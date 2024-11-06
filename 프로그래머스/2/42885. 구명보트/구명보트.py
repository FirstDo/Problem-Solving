def solution(people, limit):
    answer = 0
    people.sort(reverse=True)
    
    front = 0
    rear = len(people) - 1
    
    while front <= rear:
        if front == rear:
            answer += 1
            break
        
        # 가장 무거운 사람 + 가장 가벼운 사람 조합 가능할때
        if people[front] + people[rear] <= limit:
            # 두명 모두 보트에 태우기
            answer+=1
            front+=1
            rear-=1
        # 안될경우 가장 무거운 사람만 보트에 태우기
        else:
            answer += 1
            front += 1
    
    return answer