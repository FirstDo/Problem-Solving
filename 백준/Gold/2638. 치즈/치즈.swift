//2638번 치즈
let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (t[0],t[1])

var isOuter = [[Bool]]()
var cheezeList = [(Int,Int)]()
var graph = [[Int]]()

//바깥부분에 속해있는곳을 찾기
func findOuterSpace() {
    isOuter = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    isOuter[0][0] = true
    
    var queue = [(0,0)]
    var idx = 0
    
    while queue.count > idx {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0..<4 {
            let nx = x+dx[i]
            let ny = y+dy[i]
            if (0..<n).contains(nx) && (0..<m).contains(ny) && graph[nx][ny] == 0 && !isOuter[nx][ny] {
                isOuter[nx][ny] = true
                queue.append((nx,ny))
            }
        }
    }
}
//치즈 녹이기
func meltingCheeze() {
    let tempList = cheezeList
    cheezeList.removeAll()
    
    for (x,y) in tempList {
        var numberOfOut = 0
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if isOuter[nx][ny] {
                numberOfOut += 1
            }
        }
        
        if numberOfOut < 2 {
            cheezeList.append((x,y))
        } else {
            graph[x][y] = 0
        }
    }
}

for i in 0..<n {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    for j in 0..<m where t[j] == 1 {
        cheezeList.append((i,j))
    }
    graph.append(t)
}

var hour = 0

while true {
    hour += 1
    findOuterSpace()
    meltingCheeze()
    if cheezeList.isEmpty {break}
}
print(hour)
