//11265번 끝나지 않는 파티

func floydWarshall() {
    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
            }
        }
    }
}

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0], m = nm[1]

var graph = [[Int]]()

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph.append(line)
}

floydWarshall()

for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (a,b,c) = (abc[0]-1, abc[1]-1, abc[2])
    
    if graph[a][b] <= c {
        print("Enjoy other party")
    } else {
        print("Stay here")
    }
}
