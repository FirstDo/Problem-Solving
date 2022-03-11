var f = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,k) = (f[0],f[1])

var graph = Array(repeating: [Int](), count: n)
var virus = [(Int,Int,Int,Int)]()


for i in 0..<n {
    f = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[i] = f
    for (j, value) in f.enumerated() {
        if value != 0 {
           virus.append((value,0,i,j))
        }
    }   
}

f = readLine()!.split(separator: " ").map{Int(String($0))!}
let (s,x,y) = (f[0],f[1],f[2])

virus.sort{
    return $0.0 < $1.0
}



func dfs() {
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]

    func canMove(_ x: Int, _ y: Int) -> Bool{
        return x>=0 && x<n && y>=0 && y<n && graph[x][y] == 0
    }


    var queue: [(value: Int, time: Int ,x: Int, y: Int)] = virus
    var idx = 0

    while idx < queue.count {
        let cur = queue[idx]
        idx += 1
        if cur.time == s {
            break
        }

        for i in 0..<4 {
            let nx = cur.x + dx[i]
            let ny = cur.y + dy[i]

            if canMove(nx,ny) {
                graph[nx][ny] = cur.value
                queue.append((value: cur.value, time: cur.time+1, x: nx, y: ny))
            }
        }
    }
    print(graph[x-1][y-1])
}

dfs()