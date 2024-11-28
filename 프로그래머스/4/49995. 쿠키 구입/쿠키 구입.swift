func solution(_ cookie:[Int]) -> Int {
  var ans = 0
  let n = cookie.count
  
  for i in 0..<n-1 {
    var left = i
    var right = i+1
    
    var leftSum = cookie[i]
    var rightSum = cookie[i+1]
    
    while true {
      // sum이 같다면 값을 갱신
      if leftSum == rightSum {
        ans = max(ans, leftSum)
      }
      
      if left > 0, leftSum <= rightSum {
        left -= 1
        leftSum += cookie[left]
      } else if right < n-1, leftSum >= rightSum {
        right += 1
        rightSum += cookie[right]
      } else {
        break
      }
      
    }
  }
  
  return ans
}