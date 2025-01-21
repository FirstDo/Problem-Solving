var f = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m,k,x) = (f[0],f[1],f[2],f[3])

var graph = Array(repeating: [Int](), count: n+1)

for _ in 0..<m {
    f = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (a,b) = (f[0],f[1])
    graph[a].append(b)
}

var result = [Int]()

var visited = [Bool](repeating: false, count: n+1)

func dfs(_ x: Int) {
    var queue: [(node: Int,dist: Int)] = [(x,0)]
    var idx = 0

    while idx < queue.count {
        let cur = queue[idx]
        idx += 1

        if cur.dist == k {
            result.append(cur.node)
            continue
        }

        for next in graph[cur.node] {
            if !visited[next] {
                visited[next] = true
                queue.append((node: next, dist: cur.dist + 1))
            }
        }
    }
}

visited[x] = true
dfs(x)

if result.isEmpty {
    print(-1)
} else {
    result.sort()
    for r in result {
        print(r, terminator: " ")
    }
}