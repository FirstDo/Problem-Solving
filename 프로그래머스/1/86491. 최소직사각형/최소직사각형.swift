import Foundation

func solution(_ sizes:[[Int]]) -> Int {
  let maxWidth = sizes.flatMap { $0 }.max()!
  let maxHeight = sizes.map { $0.min()! }.max()!
  
  return maxWidth * maxHeight
}
