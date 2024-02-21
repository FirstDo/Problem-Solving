//16947번 서울 지하철 2호선

let n = Int(readLine()!)!

var graph = Array(repeating: [Int](), count: n+1)
var visit = Array(repeating: false, count: n+1)
var cycle = Array(repeating: false, count: n+1)

for _ in 0..<n {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (a,b) = (t[0],t[1])
    graph[a].append(b)
    graph[b].append(a)
}

//step 1 : 순환선을 찾는다
var log = [1]
var flag = false

func dfs(_ x: Int, _ before: Int) {
    visit[x] = true
    //다음에 방문할 곳 확인
    for nx in graph[x] {
        if nx != before && log.contains(nx) {
            let idx = log.firstIndex(of: nx)!
            log[idx...].forEach{cycle[$0] = true}
            flag = true
        }
        
        if !visit[nx] && !flag {
            log.append(nx)
            dfs(nx,x)
            log.removeLast()
        }
        
    }
}

dfs(1,0)

var dist = Array(repeating: -1, count: n+1)
var queue = [Int]()
for i in 1...n where cycle[i] {
    dist[i] = 0
    queue.append(i)
}

func bfs(_ queue: [Int]) {
    var queue = queue
    var idx = 0
    
    while queue.count > idx {
        let cur = queue[idx]
        idx += 1
        
        for nx in graph[cur] {
            if dist[nx] == -1 {
                queue.append(nx)
                dist[nx] = dist[cur] + 1
            }
        }
    }
}

bfs(queue)
print(dist[1...].map{String($0)}.joined(separator: " "))