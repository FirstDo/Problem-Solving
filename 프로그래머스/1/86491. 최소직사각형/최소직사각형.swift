import Foundation

func solution(_ sizes:[[Int]]) -> Int {
  let width = sizes.flatMap { $0 }.max()!
  let height = sizes.map { $0.min()! }.max()!
  return width * height
}