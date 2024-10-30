import Foundation

private func makeAnswerList(pattern: [Int]) -> [Int] {
  let maxLen = 10_000
  return Array(repeating: pattern, count: maxLen / pattern.count + 1).flatMap { $0 }
}

func solution(_ answers:[Int]) -> [Int] {
  let len = answers.count
  
  let arr1 = makeAnswerList(pattern: [1,2,3,4,5])
  let arr2 = makeAnswerList(pattern: [2,1,2,3,2,4,2,5])
  let arr3 = makeAnswerList(pattern: [3,3,1,1,2,2,4,4,5,5])
  
  var answer = [0,0,0]
  
  for i in 0..<len {
    if answers[i] == arr1[i] {
      answer[0] += 1
    }
    
    if answers[i] == arr2[i] {
      answer[1] += 1
    }
    
    if answers[i] == arr3[i] {
      answer[2] += 1
    }
  }
  
  let result = answer.enumerated().sorted {
    $0.element > $1.element
  }
  
  // 세명의 동점
  if result[0].element == result[1].element,
     result[1].element == result[2].element
  {
    return result.map { $0.offset + 1}
  }
  
  // 두명의 동점
  if result[0].element == result[1].element {
    return Array(result.map { $0.offset + 1}[0...1])
  }
  
  // 동점자 없음
  return [result[0].offset + 1]
}