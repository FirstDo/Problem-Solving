import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
  return commands.map {
    let (i, j, k) = ($0[0] - 1, $0[1] - 1, $0[2] - 1)
    return Array(array[i...j].sorted())[k]
  }
}
