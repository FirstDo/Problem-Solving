import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map {Int($0)!}

var op = readLine()!.split(separator: " ").map {Int($0)!} // + , -, *, /

var maxNum = Int.min
var minNum = Int.max

func dfs(idx: Int, sum: Int) {
  
  if idx >= arr.count {
    maxNum = max(maxNum, sum)
    minNum = min(minNum, sum)
    return
  }
  
  if op[0] >= 1 {
    op[0] -= 1
    dfs(idx: idx+1, sum: sum + arr[idx])
    op[0] += 1
  }
  
  if op[1] >= 1 {
    op[1] -= 1
    dfs(idx: idx+1, sum: sum - arr[idx])
    op[1] += 1
  }
  
  if op[2] >= 1 {
    op[2] -= 1
    dfs(idx: idx+1, sum: sum * arr[idx])
    op[2] += 1
  }
  
  if op[3] >= 1 && arr[idx] != 0 {
    op[3] -= 1
    dfs(idx: idx+1, sum: sum / arr[idx])
    op[3] += 1
  }
}

dfs(idx: 1, sum: arr[0])

print(maxNum)
print(minNum)
