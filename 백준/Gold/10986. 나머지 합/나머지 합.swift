import Foundation
//10986번번 나머지 합

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (t[0],t[1])
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}

var mod = Array(repeating: 0, count: m)
var sum = 0

mod[0] = 1

for i in 0..<n {
	sum += arr[i]
	sum %= m
	mod[sum] += 1
}

var ans = 0

for i in 0..<m {
	ans += mod[i] * (mod[i]-1) / 2
}
print(ans)