//17142번 연구소 3

import Foundation

//입력받기
let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (t[0],t[1])

var graph = [[Int]]()

struct Virus {
    var x: Int
    var y: Int
    
}

var emptyPlace = 0

var virus = [Virus]()

for i in 0..<n {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    for j in 0..<n {
        if t[j] == 2 {
            virus.append(Virus(x: i, y: j))
        }
        
        if t[j] == 0 {
            emptyPlace += 1
        }
    }
    graph.append(t)
}

//print("ep: \(emptyPlace)")


func selectVirus() -> [[Virus]]{
    let cnt = virus.count
    var visited = Array(repeating: false, count: cnt)
    var result = [[Virus]]()
    
    func combi(_ depth: Int, _ idx: Int) {
        //컴비 다 했으면 result 배열에 선택한 바이러스들 저장
        if depth == m {
            var temp = [Virus]()
            for i in 0..<cnt where visited[i] {
                temp.append(virus[i])
            }
            result.append(temp)

            return
        }
        
        for i in idx..<cnt {
            if !visited[i] {
                visited[i] = true
                combi(depth+1, i+1)
                visited[i] = false
            }
        }
    }
    
    combi(0, 0)
    return result
}

func bfs(_ list: [Virus]) -> Int{
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    var cnt = 0
    var queue = [(Virus, Int)]()
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    
    for l in list {
        visited[l.x][l.y] = true
        queue.append((l,0))
    }
    
    var idx = 0
    
    if cnt == emptyPlace {
        return 0
    }
    
    while queue.count > idx {
        let (cur,time) = queue[idx]
        //print("cur: \(cur) time: \(time)")
        idx += 1
        
        for i in 0..<4 {
            let (nx,ny) = (cur.x + dx[i], cur.y + dy[i])
            
            //범위 안이고, 벽이 아니고, 방문 안했으면 퍼진다!
            if (0..<n).contains(nx) && (0..<n).contains(ny) && graph[nx][ny] != 1 && !visited[nx][ny] {
                visited[nx][ny] = true
                if graph[nx][ny] == 0 {
                    cnt += 1
                    if cnt == emptyPlace {
                        return time+1
                    }
                }
                
                queue.append((Virus(x: nx, y: ny),time+1))
            }
        }
        //print("cnt: \(cnt), ep: \(emptyPlace)")
        //print("visited!")
//        for v in visited {
//            print(v)
//        }
        

    }
    
    return -1
}

var minTime = Int.max

for temp in selectVirus() {
    //print("bfs")
    let rTime = bfs(temp)
    //print("time: \(rTime)\n")
    if rTime != -1 {
        minTime = min(rTime, minTime)
    }
}

if minTime == Int.max {
    print(-1)
} else {
    print(minTime)
}




