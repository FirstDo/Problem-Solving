import Foundation

func solution() {
  let n = Int(readLine()!)!
  let numbers = (0..<n).map { _ in Int(readLine()!)! }.sorted()
  var dicts = [Int: Int]()
  
  let average = Int(round(Double(numbers.reduce(0, +)) / Double(n)))
  let median = numbers[n/2]
  let diff = numbers.last! - numbers.first!
  
  for number in numbers {
    if dicts[number] == nil {
      dicts[number] = 0
    }
    dicts[number]! += 1
  }
  // 최빈값 기준으로 정렬, 최빈값이 여러개라면 오름차순 정렬
  let keys = dicts.sorted {
    if $0.value == $1.value {
      return $0.key < $1.key
    } else {
      return $0.value > $1.value
    }
  }.map { $0.key }
  
  print(average)
  print(median)
  
  if keys.count >= 2 && dicts[keys[0]] == dicts[keys[1]] {
    print(keys[1])
  } else {
    print(keys[0])
  }

  print(diff)
}

solution()
