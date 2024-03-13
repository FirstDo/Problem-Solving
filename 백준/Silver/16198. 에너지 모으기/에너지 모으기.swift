import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}

var res = Int.min

func dfs(_ arr: [Int], _ sum: Int, _ len: Int) {
    if len == 2 {
        res = max(res, sum)
        return
    }
    
    for i in 1..<len-1 {
        dfs(Array(arr[..<i]+arr[(i+1)...]), sum + arr[i-1] * arr[i+1], len - 1)
    }
}

dfs(arr, 0, arr.count)
print(res)
