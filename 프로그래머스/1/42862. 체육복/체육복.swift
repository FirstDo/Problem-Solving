import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    
  var answer = 0
  var lostArray = Array(repeating: false, count: n + 1)
  var reserveArray = Array(repeating: false, count: n + 1)
  
  lost.forEach { lostArray[$0] = true }
  reserve.forEach { reserveArray[$0] = true }
  
  // 여벌 체육복을 가져온 학생이 도난당했을 경우 처리
  for i in 1...n {
    if reserveArray[i], lostArray[i] {
      lostArray[i] = false
      reserveArray[i] = false
    }
  }
    
  for i in 1...n {
    // 체육복이 있을경우
    if lostArray[i] == false {
      // 체육수업 참가학생 + 1
      answer += 1
      continue
    }
    
    // 체육복이 없을경우
    if lostArray[i] {
     // 이전번호가 여분있으면 빌려주기
      if (1...n) ~= i-1, reserveArray[i-1] {
        reserveArray[i-1] = false
        answer += 1
        continue
      }
      
      // 다음번호가 여분있으면 빌려주기
      if (1...n) ~= i+1, reserveArray[i+1] {
        reserveArray[i+1] = false
        answer += 1
        continue
      }
      
      // 여분이 없을때
    }
  }
  
  return answer
}