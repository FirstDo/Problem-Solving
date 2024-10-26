import heapq

def solution(jobs):
    jobs.sort(key = lambda x: -x[0])
    number_of_jobs = len(jobs) # jobs의 개수
    
    heap = []
    time = 0 # time tick
    answer = 0
    
    while True:
        # 현재 시간보다 더 빠른 작업들을 모두 heap에 넣어주기
        while jobs and jobs[-1][0] <= time:
            job = jobs.pop()
            # (실행시간, 시작시간) 순서로 힙에 넣기
            heapq.heappush(heap, (job[1], job[0]))
            
        # 힙에서 가장 실행시간이 작은 작업을 꺼내서 실행하기
        if heap:
            (task_time, start_time) = heapq.heappop(heap)
            answer += (time - start_time + task_time)
            time += task_time
        else:
            time += 1
        
        # 힙, jobs가 모두 비어있으면 종료
        if not heap and not jobs:
            break
            
    return int(answer / number_of_jobs)