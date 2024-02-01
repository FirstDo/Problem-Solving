import Foundation

var binaryString = readLine()!

switch binaryString.count % 3 {
case 1:
  binaryString = "00" + binaryString
case 2:
  binaryString = "0" + binaryString
default:
  break
}

let arr = Array(binaryString).map { String($0) }

var result = ""

for i in stride(from: 0, to: arr.count, by: 3) {
  let n2 = Int(arr[i])! * 4
  let n1 = Int(arr[i+1])! * 2
  let n0 = Int(arr[i+2])!
  
  result += String(n2+n1+n0)
}

print(result)
