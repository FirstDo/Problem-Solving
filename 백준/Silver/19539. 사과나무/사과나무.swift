// 19539번 사과나무

import Foundation

func canMake() -> Bool {
    // 총 합을 더한게 3의 배수여야함
    let tallSum = treeTalls.reduce(0, +)
    guard tallSum % 3 == 0 else { return false }
    
    // 2 - 1 물뿌리개를 x번 뿌릴수 있어야함
    let levelTwo = treeTalls.map{ $0 / 2 }.reduce(0, +)

    return levelTwo >= tallSum / 3
}

let n = Int(readLine()!)!
let treeTalls = readLine()!.components(separatedBy: " ").map{Int($0)!}

if canMake() {
    print("YES")
} else {
    print("NO")
}
