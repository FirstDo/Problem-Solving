import Foundation

let octal = readLine()!
var result = ""

for (index, ch) in octal.enumerated() {
  let num = Int(String(ch))!
  var binary = String(num, radix: 2)
  
  // 가장 앞자리면 자리수 맞추지 않음
  if index == 0 {
    result += binary
    continue
  }
  
  // 자리수 맞춰주기
  switch binary.count % 3 {
  case 1:
    binary = "00" + binary
  case 2:
    binary = "0" + binary
  default:
    break
  }

  result += binary
}

print(result)
