import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
  let numbers = numbers.map {Int($0)}
  
  var ans = [Int]()
  
  for number in numbers {
    // 가장 끝자리가 0 인 경우
    if number & 1 == 0 {
      ans.append(number + 1)
      continue
    }
    
    // 처음으로 0이 나오는 자리수 구하기
    var index = 2
    while number & index != 0 {
      index *= 2
    }
    
    // 중간 자리가 0 인 경우
    if index < number {
      let newNum = (number | index) ^ (index / 2)
      ans.append(newNum)
    }
    // 모두 1인경우
    else {
      let newNum = (index + number) ^ (index/2)
      ans.append(newNum)
    }
  }

  return ans.map {Int64($0)}
}