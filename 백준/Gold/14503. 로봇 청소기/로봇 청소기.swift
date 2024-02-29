//로봇청소기

//로봇


struct Robot {
    var x: Int
    var y: Int
    var dir: Int

    mutating func nextDir() -> Int {
        self.dir -= 1
        if self.dir < 0 {
            self.dir = 3
        }
        return self.dir
    }
}

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (t[0],t[1])

let p = readLine()!.split(separator: " ").map{Int(String($0))!}

var graph = [[Int]]()

for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

var pos = Robot(x: p[0], y: p[1], dir: p[2])
var res = 0

let dx = [-1,0,1,0]
let dy = [0,1,0,-1]

var cur = pos

loop1: while true {
    //1번 현재 위치 청소
    if graph[cur.x][cur.y] == 0 {
        graph[cur.x][cur.y] = 2
        res += 1
    }
    

    //2번
    for _ in 0..<4 {
        let dir = cur.nextDir()
        let (nx,ny) = (cur.x + dx[dir], cur.y + dy[dir])
        //청소하지 않은 공간 나오면 이동
        if graph[nx][ny] == 0 {
            cur = Robot(x: nx,y: ny,dir: dir)
            continue loop1
        }
    }

    let (bx,by) = (cur.x - dx[cur.dir], cur.y - dy[cur.dir])

    if graph[bx][by] == 1 {
        break
    } else {
        cur = Robot(x: bx, y: by, dir: cur.dir)
    }
}

print(res)