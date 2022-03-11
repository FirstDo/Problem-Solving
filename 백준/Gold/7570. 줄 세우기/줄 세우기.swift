//7570번 줄 세우기
let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = Array(repeating: 0, count: n+1)
arr.forEach{dp[$0] = dp[$0-1]+1}
print(n-dp.max()!)