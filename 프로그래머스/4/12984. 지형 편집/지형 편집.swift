import Foundation

func solution(_ land:[[Int]], _ p:Int, _ q:Int) -> Int64 {
  let lands = land.flatMap { $0 }.sorted()
  let n = lands.count

  var cost = lands.map { $0 - lands[0] }.reduce(0, +) * q
  var minCost = cost
  
  for i in 1..<n where lands[i-1] != lands[i] {
    let diff = lands[i] - lands[i-1]
    cost += diff * i * p - diff * (n-i) * q
    minCost = min(minCost, cost)
  }
  
  return Int64(minCost)
}