import Foundation

let n = Int(readLine()!)!
var answer = 0

var checkCol = Array(repeating: false, count: 15)
var checkSide1 = Array(repeating: false, count: 40)
var checkSide2 = Array(repeating: false, count: 40)

func check(_ row: Int, _ col: Int) -> Bool {

  if checkCol[col] { return false }
  if checkSide1[row+col] { return false }
  if checkSide2[row - col + n] { return false }
  
  return true
}

func calc(row: Int) {
  if row == n {
    answer += 1
    return
  }
  
  for col in 0..<n {
    if check(row, col) {
      checkCol[col] = true
      checkSide1[row + col] = true
      checkSide2[row - col + n] = true
      
      calc(row: row+1)
      
      checkCol[col] = false
      checkSide1[row + col] = false
      checkSide2[row - col + n] = false
    }
  }
}

calc(row: 0)

print(answer)
