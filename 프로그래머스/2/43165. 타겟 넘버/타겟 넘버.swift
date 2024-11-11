import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
  
  func dfs(_ index: Int, sum: Int) {
    if arr.count == index {
      ans += sum == target ? 1 : 0
      return
    }
    
    dfs(index + 1, sum: sum + arr[index])
    dfs(index + 1, sum: sum - arr[index])
  }
  
  let arr = [0] + numbers
  var ans = 0
  
  dfs(1, sum: 0)
  
  return ans
}
