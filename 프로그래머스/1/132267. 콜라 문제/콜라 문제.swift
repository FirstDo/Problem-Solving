import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
  var bottle = n
  var result = 0
  
  // 더이상 빈병을 바꿀수 없을때까지 반복
  while bottle >= a {
    
    // 빈병으로 콜라를 만든다 (빈병 a개를 가져다주면, 마트는 b개를 줌)
    let coke = bottle / a * b
    result += coke
    
    // 남은 빈병
    bottle %= a
    
    // 다시 콜라로 빈병을 만든다
    bottle += coke
  }
  
  return result
}