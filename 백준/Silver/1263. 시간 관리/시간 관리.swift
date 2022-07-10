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

works.sort { lhs, rhs in
    lhs.deadLine > rhs.deadLine
}

var deadLine = works.first!.deadLine

for work in works {
    deadLine = min(deadLine, work.deadLine)
    deadLine -= work.time
}

if deadLine < 0 {
    print(-1)
} else {
    print(deadLine)
}
