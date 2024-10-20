def solution(participant, completion):
    arr1 = sorted(participant)
    arr2 = sorted(completion) + ["EMPTY"]
    length = len(arr1)
    
    for i in range(length):
        if arr1[i] != arr2[i]:
            return arr1[i]
    