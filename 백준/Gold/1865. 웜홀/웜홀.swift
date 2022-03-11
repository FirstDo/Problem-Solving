//1865번 웜홀

let tc = Int(readLine()!)!

for _ in 0..<tc {
    let nmw = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n, m, w) = (nmw[0], nmw[1], nmw[2])

    var graph = Array(repeating: [(Int,Int)](), count: n+1)

    //도로는 양방향
    for _ in 0..<m {
        let set = readLine()!.split(separator: " ").map{Int(String($0))!}
        let (s, e, t) = (set[0], set[1], set[2])

        graph[s].append((e,t))
        graph[e].append((s,t))
    }

    //웜홀든 단방향
    for _ in 0..<w {
        let set = readLine()!.split(separator: " ").map{Int(String($0))!}
        let (s, e, t) = (set[0], set[1], set[2])

        graph[s].append((e,-t))
    }

    print(bellmanFord(n: n, graph: graph) ? "YES" : "NO")
}

func bellmanFord(n: Int, graph: [[(Int,Int)]]) -> Bool{
    var dist = Array(repeating: 10001, count: n+1)
    dist[1] = 0
    
    for i in 1...n {
        for s in 1...n {
            for (next, time) in graph[s] {
                if dist[next] > dist[s] + time {
                    dist[next] = dist[s] + time
                    if i == n {
                        return true
                    }
                }
            }
        }
    }

    return false
}