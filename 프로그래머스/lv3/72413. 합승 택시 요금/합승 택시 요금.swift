import Foundation

func makeGraph(_ n: Int, _ fares: [[Int]]) -> [[Int]] {
    let INF = Int.max / 10
    var temp = Array(repeating: Array(repeating: INF, count: n+1), count: n+1)
    (0...n).forEach { temp[$0][$0] = 0}
    
    for fare in fares {
        let (c, d, f) = (fare[0], fare[1], fare[2])
        temp[c][d] = f
        temp[d][c] = f
    }
    
    return temp
}

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var graph = makeGraph(n, fares)
    
    var results = [Int]()
    
    // 플로이드 와샬
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                if graph[i][j] > graph[i][k] + graph[k][j] {
                    graph[i][j] = graph[i][k] + graph[k][j]
                }
            }
        }
    }
    
    // k까지는 합승하고 그 후부터는 따로따로 가는 경우
    
    for k in 1...n {
        let fee = graph[s][k] + graph[k][a] + graph[k][b]
        results.append(fee)
    }
    
    return results.sorted(by: <).first!
}