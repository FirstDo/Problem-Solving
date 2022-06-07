// 2141번 우체국

import Foundation

let n = Int(readLine()!)!
var arr: [(pos: Int, count: Int)] = []

for _ in 0..<n {
    let xa = readLine()!.components(separatedBy: " ").map{Int($0)!}
    arr.append((xa[0], xa[1]))
}

arr.sort { $0.pos <= $1.pos }

let half = Int(round(Double(arr.reduce(0) { $0 + $1.count }) / 2))

var count = 0

for (pos, cnt) in arr {
    count += cnt
    
    if count >= half {
        print(pos)
        break
    }
}
