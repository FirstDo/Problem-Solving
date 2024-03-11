import Foundation

let num = Array(readLine()!.sorted(by: >)).map { Int(String($0))!}

let sum = num.reduce(0, +)

if num.last == 0 && sum % 3 == 0 {
  print(num.map {String($0)}.joined(separator: ""))
} else {
  print(-1)
}
