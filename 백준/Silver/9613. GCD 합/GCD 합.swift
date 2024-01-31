import Foundation

func getGCD(_ a: Int, _ b: Int) -> Int {
  if b == 0 { return a }
  return getGCD(b, a % b)
}

let t = Int(readLine()!)!

for _ in 0..<t {
  let inputs = readLine()!.components(separatedBy: " ").map {Int($0)!}
  var sums = 0
  
  let nums = Array(inputs[1...])
  let len = nums.count
  
  if len == 1 {
    sums += nums[0]
  }
  
  for i in 0..<len-1 {
    for j in i+1..<len {
      let gcd = getGCD(nums[i], nums[j])
      sums += gcd
    }
  }
  
  print(sums)
}