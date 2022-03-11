//13397번 구간 나누기 2

//M개의 구간을 나눈다
//각 구간의 최대값 - 최솟값을 구한다.
//그중에서 최댓값을 최소가 되게 하는것이 

import Foundation


let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (t[0],t[1])
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}



func make(_ x: Int) -> Int{
	var (start, end) = (arr[0],arr[0])
	var cnt = 1
	for i in 1..<n {
		start = min(start, arr[i])
		end = max(end, arr[i])
		if end - start > x {
			cnt += 1
			(start, end) = (arr[i],arr[i])
		}
	}
	return cnt
}

//mid = 각 구간의 최대값 - 최소값 한 list의 최대값을 의미한다.

//binarySearch 
var (low,high) = (0, arr.max()!)
var result = 0
while low <= high {
	let mid = (low+high)/2
	if make(mid) <= m {
		high = mid - 1
		result = mid
	} else {
		low = mid + 1
	}
}

print(result)