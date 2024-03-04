import Foundation

let nmr = readLine()!.split(separator: " ").map {Int($0)!}
let (n, m, r) = (nmr[0], nmr[1], nmr[2])

let arr = (0..<n).map { _ in readLine()!.split(separator: " ").map {Int($0)!} }
var arr2 = Array(repeating: Array(repeating: 0, count: m), count: n)

for s in 0..<min(n,m)/2 {
  var temp = [Int]()
  
  let maxRow = n-s-1
  let maxCol = m-s-1
  
  temp.append(contentsOf: Array(arr[s][s..<maxCol]))

  for i in s..<maxRow {
    temp.append(arr[i][maxCol])
  }
  
  temp.append(contentsOf: Array(arr[maxRow][s+1..<maxCol+1]).reversed())
  
  for i in stride(from: maxRow, to: s, by: -1) {
    temp.append(arr[i][s])
  }

  let r = r % temp.count
  temp = Array(temp[r...]) + Array(temp[0..<r])
  
  var cnt = 0
  
  for j in s...maxCol {
    arr2[s][j] = temp[cnt]
    cnt += 1
  }
  
  cnt -= 1
  
  for i in s...maxRow {
    arr2[i][maxCol] = temp[cnt]
    cnt += 1
  }
  
  cnt -= 1
  
  for j in stride(from: maxCol, through: s, by: -1) {
    arr2[maxRow][j] = temp[cnt]
    cnt += 1
  }
  
  cnt -= 1
  
  for i in stride(from: maxRow, to: s, by: -1) {
    arr2[i][s] = temp[cnt]
    cnt += 1
  }
}

for a in arr2 {
  print(a.map{String($0)}.joined(separator: " "))
}
