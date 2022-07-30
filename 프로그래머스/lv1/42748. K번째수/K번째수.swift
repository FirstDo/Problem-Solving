// K번째수

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands
        .map { ($0[0], $0[1], $0[2])}
        .map { (i, j, k) in
            array[(i-1)...(j-1)].sorted()[k-1]
        }
}