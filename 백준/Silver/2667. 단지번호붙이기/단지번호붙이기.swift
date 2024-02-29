let N = Int(readLine()!)!
var graph = [[Int]]()
var visit = Array(repeating: Array(repeating: false, count: N), count: N)
for _ in 0..<N {
    graph.append(readLine()!.map{Int(String($0))!})
}

var numOfHouse: [Int] = []

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]
var cnt = 0
var cntArray: [Int] = []
func dfs(_ i: Int, _ j: Int) {
    if i<0 || i>=N || j<0 || j>=N || graph[i][j] == 0 || visit[i][j] {return}
    cnt += 1
    visit[i][j] = true
    for k in 0..<4 {
        let nx = i + dx[k]
        let ny = j + dy[k]
        dfs(nx,ny)
    }
    return
}

for i in 0..<N {
    for j in 0..<N {
        if graph[i][j] == 1 && visit[i][j] == false {
            cnt = 0
            dfs(i,j)
            cntArray.append(cnt)
        }
    }
}
print(cntArray.count)
for i in cntArray.sorted(by: <) {
    print(i)
}
