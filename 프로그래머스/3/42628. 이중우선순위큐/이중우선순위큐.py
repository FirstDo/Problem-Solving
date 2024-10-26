import heapq

def solution(operations):
    min_heap = [] # 최소힙
    max_heap = [] # 최대힙
    
    delete_indices = set([]) # 지워진 indices
    
    for index, op in enumerate(operations):
        oper, value = op.split()

        # 최소힙, 최대힙에 추가
        if oper == 'I':
            heapq.heappush(min_heap, (int(value), index))
            heapq.heappush(max_heap, (-int(value), index))
        
        # 최대값 제거
        if oper == "D" and value == "1":
            while max_heap:
                num, index = heapq.heappop(max_heap)
                
                if index not in delete_indices:
                    delete_indices.add(index)
                    break
                    
            
        # 최소값 제거
        if oper == "D" and value == "-1":
            while min_heap:
                num, index = heapq.heappop(min_heap)
                
                if index not in delete_indices:
                    delete_indices.add(index)
                    break
                    
    result = list(filter(lambda x: x[1] not in delete_indices, min_heap))
    result = list(map(lambda x: x[0], result))
    
    if result:
        return [max(result), min(result)]
    else:
        return [0, 0]