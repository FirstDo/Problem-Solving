//17144번 미세먼지 안녕!


import Foundation

var graph = [[Int]]()

struct Dust {
    var x: Int
    var y: Int
}

var dust = [Dust]()
var airCleaner = [(Int,Int)]()

var totalDust = 0
var deleteDust = 0

func debugDust() {
    print("\ndebugDust")
    for d in dust {
        print(d.x, d.y, terminator: " ")
    }
    
   
}

func debugGraph() {
    print("\ndebugGraph")
    for g in graph {
        print(g)
    }
    print("total: ",totalDust)
    print("delete: ", deleteDust)
}



let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (R,C,T) = (t[0],t[1],t[2])
for i in 0..<R {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph.append(t)
    for j in 0..<C {
        if t[j] > 0 {
            dust.append(Dust(x: i, y: j))
            totalDust += t[j]
        }

        if t[j] == -1 {
            airCleaner.append((i,j))
        }
    }
}
func spreadDust() {
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    var temp = Array(repeating: Array(repeating: 0, count: C), count: R)
    
    for d in dust {
        let (x,y) = (d.x, d.y)
        
        let sum = graph[x][y]
        let give = sum / 5
        var cnt = 0
        
        for i in 0..<4 {
            let (nx,ny) = (x + dx[i], y + dy[i])
            //그래프 내부이고 공기청청기가 설치 되지 않았다면
            if (0..<R).contains(nx) && (0..<C).contains(ny) && graph[nx][ny] != -1 {
                cnt += 1
                temp[nx][ny] += give
            }
        }
        graph[x][y] -= give * cnt
    }
    
    for i in 0..<R {
        for j in 0..<C {
            graph[i][j] += temp[i][j]
        }
    }
    
    dust.removeAll()
}

func runAirCleaner() {
    let tx =  airCleaner[0].0
    //상단 순회
    
    // right
    let temp1 = graph[tx][C-1]
    for j in stride(from: C - 1, to: 1, by: -1) {
        graph[tx][j] = graph[tx][j-1]
    }
    graph[tx][1] = 0
    
    // up
    let temp2 = graph[0][C-1]
    for i in 0..<tx {
        graph[i][C-1] = graph[i+1][C-1]
        if i == tx - 1 {
            graph[i][C-1] = temp1
        }
    }
    
    // left
    let temp3 = graph[0][0]
    for j in 0..<C-1 {
        graph[0][j] = graph[0][j+1]
        if j == C-2 {
            graph[0][j] = temp2
        }
    }
    
    // down
    //공기 청정기로 들어가서 삭제!
    deleteDust += graph[tx-1][0]
    
    for i in stride(from: tx - 1, to: 0, by: -1) {
        graph[i][0] = graph[i-1][0]
        if i == 1 {
            graph[i][0] = temp3
        }
    }
    
    let (dx,dy) = (airCleaner[1].0, airCleaner[1].1)
    //하단 순회
    //right
    let tmp1 = graph[tx+1][C-1]
    for j in stride(from: C-1, to: 1, by: -1) {
        graph[tx+1][j] = graph[tx+1][j-1]
    }
    graph[tx+1][1] = 0
    
    //down
    let tmp2 = graph[R-1][C-1]
    for i in stride(from: R-1, to: tx+1, by: -1) {
        graph[i][C-1] = graph[i-1][C-1]
        if i == tx + 2 {
            graph[i][C-1] = tmp1
        }
    }
    
    //left
    let tmp3 = graph[R-1][0]
    for j in 0 ..< C-1 {
        graph[R-1][j] = graph[R-1][j+1]
        if j == C-2 {
            graph[R-1][j] = tmp2
        }
    }
    
    //up
    deleteDust += graph[tx+2][0]
    
    for i in tx+2 ..< R-1 {
        graph[i][0] = graph[i+1][0]
        if i == R-2 {
            graph[i][0] = tmp3
        }
    }
}

func updateDust() {
    for i in 0..<R {
        for j in 0..<C {
            if graph[i][j] > 0 {
                dust.append(Dust(x: i, y: j))
            }
        }
    }
}


for t in 0..<T {
    //미세먼지의 확산 : 미세먼지 큐에 있는 미세먼지들을 확산시키자!
    spreadDust()
    //공기청정기 가동
    runAirCleaner()
    //먼지 위치 업데이트
    updateDust()
}


print(totalDust - deleteDust)
