// 12996번 Acka

import Foundation

// 1. 조합을 이용해서 모든 경우를 구하자

func getCombination() -> [[Int]] {
    
    var group = [[Int]]()
    
    func combi(_ index: Int, _ visit: inout [Bool]) {
        // 종료조건
        if index > n { return }
        
        // combi 추가
        let res = visit.enumerated().filter{$0.element}.map {$0.offset}
        group.append(res)
        
        for i in index...n where !visit[i] {
            visit[i] = true
            combi(i+1, &visit)
            visit[i] = false
        }
    }
    
    var visit = Array(repeating: false, count: n+1)
    combi(0, &visit)
    
    return group.filter { $0.count != 0 && $0.count != n }
}

// 2. 두 종류의 선거구가 인접한지 확인하자!

func bfs(_ group: [Int], _ visit: inout [Bool] ) -> Int {
    
    let start = group.first!
    
    var queue = [start]
    var index = 0
    
    visit[start] = true
    
    while queue.count > index {
        let cur = queue[index]
        index += 1
        
        for next in graph[cur] where !visit[next] && group.contains(next) {
            visit[next] = true
            queue.append(next)
        }
    }
    
    return group.reduce(0) { partialResult, node in
        partialResult + people[node]
    }
}

let n = Int(readLine()!)!
let people = [0] + readLine()!.components(separatedBy: " ").map{Int($0)!}
var graph = Array(repeating: [Int](), count: n+1)

for i in 1...n {
    let t = readLine()!.components(separatedBy: " ").map{Int($0)!}
    if t.first == 0 { continue }
    graph[i] = Array(t[1...])
}

var diff = Int.max

for combi in getCombination() {
    
    var visit = Array(repeating: false, count: n+1)
    
    // 선거구 1 bfs
    let group1 = bfs(combi, &visit)
    // 선거구 2 bfs
    let combi2 = (1...n).filter { !combi.contains($0) }
    let group2 = bfs(combi2, &visit)
    
    // 조건을 만족했다면(모두 방문했다면), 인구수 차이 업데이트
    if visit.filter({$0}).count == n {
        diff = min(diff, abs(group1 - group2))
    }
}

print(diff == Int.max ? -1 : diff)
