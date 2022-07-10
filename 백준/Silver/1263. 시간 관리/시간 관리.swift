// 1263번 시간 관리

import Foundation

struct Work {
    let time: Int
    let deadLine: Int
}

var works = [Work]()

for _ in 0..<Int(readLine()!)! {
    let T = readLine()!.components(separatedBy: " ").map{Int(String($0))!}
    works.append(Work(time: T[0], deadLine: T[1]))
}

// 데드라인이 급한일부터 처리
works.sort { lhs, rhs in
    lhs.deadLine < rhs.deadLine
}

var answer = -1

// 0부터 1_000_000까지 완전탐색
TimeLoop: for startTime in 0...1_000_000 {
    var current = startTime
    
    for work in works {
        current += work.time
        
        // 데드라인을 넘긴다면 끝!
        if current > work.deadLine {
            break TimeLoop
        }
    }
    
    answer = startTime
}

print(answer)
