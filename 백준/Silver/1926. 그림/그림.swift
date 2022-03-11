//1926번 그림

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]

var arr = [[Int]]()

for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

var maxWidth = 0
var pictureCount = 0

for i in 0..<n {
    for j in 0..<m {
        if arr[i][j] == 1 {
            let width = bfs(i,j)
            pictureCount += 1
            maxWidth = max(maxWidth, width)
        }
    }
}

private func bfs(_ sx: Int, _ sy: Int) -> Int {
    var width = 1
    arr[sx][sy] = 0
    
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    
    var idx = 0
    var queue = [(sx,sy)]
    
    while queue.count > idx {
        let (cx,cy) = queue[idx]
        idx += 1
        
        for i in 0..<4 {
            let nx = cx + dx[i]
            let ny = cy + dy[i]
            
            if (0..<n) ~= nx && (0..<m) ~= ny && arr[nx][ny] == 1{
                arr[nx][ny] = 0
                queue.append((nx,ny))
                width += 1
            }
        }
    }

    return width
}

print(pictureCount)
print(maxWidth)
