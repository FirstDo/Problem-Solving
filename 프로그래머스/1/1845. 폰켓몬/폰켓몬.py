def solution(nums):
    n = len(nums) / 2
    sort_of_monster = len(set(nums));
    return min(n, sort_of_monster)