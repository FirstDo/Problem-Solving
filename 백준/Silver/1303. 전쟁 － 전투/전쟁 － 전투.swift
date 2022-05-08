let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (w,h) = (t[0], t[1])

var graph = [[Character]]()
var visit = Array(repeating: Array(repeating: false, count: w), count: h)

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

for _ in 0..<h {
    graph.append(Array(readLine()!))
}

var answer: [Character: Int] = ["W": 0, "B": 0]
var cnt = 0

for i in 0..<h {
    for j in 0..<w {
        if !visit[i][j] {
            cnt = 0
            dfs(i,j,graph[i][j])
            answer[graph[i][j]]! += cnt * cnt
        }
    }
}

func dfs(_ x: Int, _ y: Int, _ c: Character) {
    visit[x][y] = true
    cnt += 1
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if (0..<h) ~= nx && (0..<w) ~= ny && !visit[nx][ny] && graph[nx][ny] == c {
            dfs(nx, ny, c)
        }
    }
}

print(answer["W"]!, answer["B"]!)
