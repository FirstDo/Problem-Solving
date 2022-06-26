// 3584번 가장 가까운 공통 조상

import Foundation

var dict = [Int: Int]()

func findCommonAncestor(n1: Int, n2: Int) -> Int {
    var (n1, n2) = (n1, n2)
    var visit = Array(repeating: false, count: 10_001)
    
    visit[n1] = true
    
    while dict[n1] != nil {
        n1 = dict[n1]!
        visit[n1] = true
    }
    
    while dict[n2] != nil && !visit[n2] {
        n2 = dict[n2]!
    }

    return n2
}

for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    
    for _ in 0..<n-1 {
        let t = readLine()!.components(separatedBy: " ").map{Int($0)!}
        let (n1, n2) = (t[0], t[1])
        dict[n2] = n1
    }
    
    let t = readLine()!.components(separatedBy: " ").map{Int($0)!}
    let (n1, n2) = (t[0], t[1])

    print(findCommonAncestor(n1: n1, n2: n2))
    dict.removeAll()
}
