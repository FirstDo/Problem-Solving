import Foundation

let nm = readLine()!.split(separator: " ").map {Int($0)!}
let (n, m) = (nm[0], nm[1])

let shape = (0..<n).map { _ in readLine()!.split(separator: " ").map {Int($0)!} }

var cnt = 0

for i in 0..<n {
  for j in 0..<m {
    if j == 0 {
      cnt += shape[i][j]
    }
    
    if j+1 < m && shape[i][j+1] > shape[i][j] {
      cnt += shape[i][j+1] - shape[i][j]
    }
  }
  
  for j in stride(from: m-1, to: -1, by: -1) {
    if j == m-1 {
      cnt += shape[i][j]
    }
    
    if j-1 >= 0 && shape[i][j-1] > shape[i][j] {
      cnt += shape[i][j-1] - shape[i][j]
    }
  }
}

for j in 0..<m {
  for i in 0..<n {
    if i == 0 {
      cnt += shape[i][j]
    }
    
    if i+1 < n && shape[i+1][j] > shape[i][j] {
      cnt += shape[i+1][j] - shape[i][j]
    }
  }
  
  for i in stride(from: n-1, to: -1, by: -1) {
    if i == n-1 {
      cnt += shape[i][j]
    }
    
    if i-1 >= 0 && shape[i-1][j] > shape[i][j] {
      cnt += shape[i-1][j] - shape[i][j]
    }
  }
}

cnt += n * m * 2

print(cnt)
