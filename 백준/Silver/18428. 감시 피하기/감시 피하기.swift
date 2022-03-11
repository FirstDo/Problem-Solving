let n = Int(readLine()!)!
var graph: [[Character]] = []
var tPlace: [(Int,Int)] = []
var vPlace: [(Int,Int)] = []
var studentNum = 0

func inputData() {
    for i in 0..<n {
        let line = readLine()!.split(separator: " ").map{Character(String($0))}
        graph.append(line)
        for j in 0..<n {
            switch graph[i][j] {
            case "X":
                vPlace.append((i,j))
            case "T":
                tPlace.append((i,j))
            default:
                studentNum += 1
            }
        }
    }
}


func dfs(_ graph: [[Character]], _ n: Int) -> Bool {
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]

    var graph = graph
    func valid(_ x: Int, _ y: Int) -> Bool {
        if (x>=0 && x<n && y>=0 && y<n) && graph[x][y] != "W" {
            return true
        } else {
            return false
        }
    }


    var stack = tPlace
    while !stack.isEmpty {
        let now = stack.popLast()!
        for i in 0..<4 {
            var next = (now.0+dx[i],now.1+dy[i])
            while true {
                let nx = next.0, ny = next.1
                if valid(nx,ny) {
                    graph[nx][ny] = "T"
                    next = (next.0 + dx[i],next.1 + dy[i])
                } else {
                    break
                }
            }
        }
    }
    var sNum = 0
    for i in 0..<n {
        for j in 0..<n {
            if graph[i][j] == "S" {
                sNum += 1
            }
        }
    }
    if sNum == studentNum {
        return true
    } else {return false}
}
var check = false

func makeWall(_ graph: [[Character]]) {
    outerLoop: for i in 0..<vPlace.count-2 {
        for j in i+1..<vPlace.count-1 {
            for k in j+1..<vPlace.count {
                let w1 = vPlace[i], w2 = vPlace[j], w3 = vPlace[k]
                var newGraph = graph
                newGraph[w1.0][w1.1] = "W"
                newGraph[w2.0][w2.1] = "W"
                newGraph[w3.0][w3.1] = "W"
                if dfs(newGraph,n) {
                    check = true
                    break outerLoop
                }
            }
        }
    }

    if check == true {
        print("YES")
    } else {
        print("NO")
    }
}



inputData()
makeWall(graph)