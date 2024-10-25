import heapq

def solution(scoville, K):
    heapq.heapify(scoville)
    cnt = 0
    
    while True:
        s1 = heapq.heappop(scoville)
        
        # 모든 음식의 스코빌 지수가 K 이상이면 return
        if s1 >= K:
            return cnt
        
        # 새롭게 스코빌 지수 만들고 heap에 넣어주기
        s2 = heapq.heappop(scoville)
        new_s = s1 + (s2 * 2)
        heapq.heappush(scoville, new_s)
        cnt += 1
        
        # 모든 스코빌 지수를 K이상으로 만들 수 없는 경우 -1
        if len(scoville) == 1 and new_s < K:
            return -1
            
        
        
        
        