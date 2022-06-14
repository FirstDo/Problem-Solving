// 23743번 방탈출

import Foundation

func findParent(x: Int) -> Int {
    if x != parent[x] {
        parent[x] = findParent(x: parent[x])
    }
    
    return parent[x]
}

func unionParent(_ a: Int, _ b: Int) {
    let a = findParent(x: a)
    let b = findParent(x: b)
    
    if a > b {
        parent[a] = b
    } else {
        parent[b] = a
    }
}

let t = readLine()!.components(separatedBy: " ").map {Int($0)!}
let (n,m) = (t[0], t[1])

var parent = (0...n).map { return $0 }

var edges = [(a: Int, b: Int, c: Int)]()

for _ in 0..<m {
    let t = readLine()!.components(separatedBy: " ").map {Int($0)!}
    edges.append((t[0], t[1], t[2]))
}

for (index, value) in readLine()!.components(separatedBy: " ").map {Int($0)!}.enumerated() {
    edges.append((0, index + 1, value))
}

edges.sort { lhs, rhs in
    return lhs.c < rhs.c
}

// 크루스칼 알고리즘

var answer = 0

for (a,b,c) in edges {
    if findParent(x: a) != findParent(x: b) {
        answer += c
        unionParent(a, b)
    }
}

print(answer)
