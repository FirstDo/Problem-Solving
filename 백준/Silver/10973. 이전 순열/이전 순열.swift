import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map {Int($0)!}

var targetIndex = -1

for i in stride(from: n-1, to: 0, by: -1) {
  if arr[i] < arr[i-1] {
    targetIndex = i-1
    break
  }
}

if targetIndex == -1 {
  print(-1)
  exit(0)
}

for i in stride(from: n-1, to: 0, by: -1) {
  if arr[targetIndex] > arr[i] {
    arr.swapAt(targetIndex, i)
    arr = Array(arr[...targetIndex]) + Array(arr[(targetIndex+1)...]).sorted(by: >)
    break
  }
}

print(arr.map {String($0)}.joined(separator: " "))
