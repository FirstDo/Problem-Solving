import Foundation

let i = readLine()!.split(separator: " ").map {Int($0)!}
let (h, w, x, y) = (i[0], i[1], i[2], i[3])

let arrB = (0..<h+x).map { _ in readLine()!.split(separator: " ").map {Int($0)!} }
var arrA = Array(repeating: Array(repeating: 0, count: w), count: h)

for i in 0..<h+x {
  for j in 0..<w+y {
    
    var inA1 = false
    var inA2 = false
    
    // a1 영역
    if (0..<h) ~= i && (0..<w) ~= j {
      inA1 = true
    }
    
    // a2 영역
    if (x..<x+h) ~= i && (y..<y+w) ~= j {
      inA2 = true
    }
    
    switch (inA1, inA2) {
    case (true, true):
      arrA[i][j] = arrB[i][j] - arrA[i-x][j-y]
    case (true, false):
      arrA[i][j] = arrB[i][j]
    case (false, true):
      break
    case (false, false):
      break
    }
  }
}

for arr in arrA {
  print(arr.map {String($0)}.joined(separator: " "))
}
