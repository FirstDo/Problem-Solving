//17136번 색종이 붙이기

var graph = [[Int]]()
var paper = [0,0,0,0,0]

for _ in 0..<10 {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph.append(t)
}

func searchPaper(x: Int,y: Int,cnt: Int) {
    if y >= 10 {
        ans = min(ans, cnt)
        return
    }
    
    if x >= 10 {
        searchPaper(x: 0, y: y+1, cnt: cnt)
        return
    }
    
    if graph[x][y] == 1 {
        for k in 0..<5 {
            if paper[k] == 5 {continue}
            if x + k >= 10 || y + k >= 10 {continue}
            
            var flag = false
            
            for i in x..<x+k+1 {
                for j in y..<y+k+1 {
                    if graph[i][j] == 0 {
                        flag = true
                        break
                    }
                }
                
                if flag {break}
            }
            
            if flag == false {
                for i in x..<x+k+1 {
                    for j in y..<y+k+1 {
                        graph[i][j] = 0
                    }
                }
                
                paper[k] += 1
                searchPaper(x: x+k+1, y: y, cnt: cnt+1)
                paper[k] -= 1
                
                for i in x..<x+k+1 {
                    for j in y..<y+k+1 {
                        graph[i][j] = 1
                    }
                }
            }
        }
    } else {
        searchPaper(x: x+1, y: y, cnt: cnt)
    }
}


var ans = Int.max
searchPaper(x: 0, y: 0, cnt: 0)

if ans == Int.max {
    print(-1)
} else {
    print(ans)
}

