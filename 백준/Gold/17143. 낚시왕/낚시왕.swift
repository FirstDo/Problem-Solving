//17143번 낚시왕

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (R,C,M) = (t[0],t[1],t[2])

//상어위치를 저장할 배열
var graph = Array(repeating: Array(repeating: 0, count: C), count: R)

var sharkDic: [Int: (x: Int, y: Int, speed: Int, dir: Int, size: Int)] = [:]

for _ in 0..<M {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (r,c,s,d,z) = (t[0] - 1,t[1] - 1,t[2],t[3],t[4])
    
    sharkDic[z] = (x: r, y: c, speed: s, dir: d, size: z)
    
    graph[r][c] = z
}


func debugShark() {
    //print("상어!")
    let t = sharkDic.sorted{
        $0.key < $1.key
    }
    for (key,value) in t {
        print(key, ": ", value)
    }

}
func debugGraph() {
    print("graph")
    for g in graph {
        print(g)
    }
}

func debug() {
    debugGraph()
    debugGraph()
}


func catchShark(col: Int) -> Int{
    
    for row in 0..<R {
        //상어를 찾았으면 그래프에서 제거하고, 상어dic에서도 제거 그리고 낚시꾼에게 크기 반환
        if graph[row][col] != 0 {
            defer {
                graph[row][col] = 0
                
            }
            //print("상어 : \(graph[row][col]) 을 잡았습니다!")
            sharkDic[graph[row][col]] = nil
            return graph[row][col]
        }
    }
    return 0
}

func moveShark() {
    //dir 상 하 우 좌
    let dx = [0,-1,1,0,0]
    let dy = [0,0,0,1,-1]
    let div = [0,R-1,R-1,C-1,C-1]
    
    let matchDir = [0,2,1,4,3]
    
    var firstMove = 0
    
    for (key,value) in sharkDic {
        //print("상어 \(key) : \(value) 에 관해서 연산합니다!")
        var (x,y,speed,dir,size) = value
        //현재 그래프에서 상어 위치 초기화
        graph[x][y] = 0
        //새로운 상어 위치 구하기
    
        var move = speed
        //firstMove 구하기: 한방향 끝까지 간다!
        if dir == 1 {
            firstMove = x
        } else if dir == 2 {
            firstMove = R-1-x
        } else if dir == 3 {
            firstMove = C-1-y
        } else {
            firstMove = y
        }
        //print("firstMove: \(firstMove)")
        
        //첫번째 이동으로 다 해결된다면!
        if move - firstMove <= 0 {
            //print("첫번째 이동으로 해결")
            (x,y) = (x + dx[dir] * move, y + dy[dir] * move)
        }
        //첫번째 이동으로 해결되지 않는다면..!
        else {
            move -= firstMove
            //print("move: \(move) 남음")
            
            let cycle = move / div[dir]
            let remain = move % div[dir]
            
            //print("cycle: \(cycle) remain: \(remain)")
            
            //사이클이 홀수면 반대편에 있고
            if cycle % 2 != 0 {
                //print("반대편에서시작")
                if dir == 1 {
                    (x,y,dir) = (R-1,y,2)
                } else if dir == 2 {
                    (x,y,dir) = (0,y,1)
                } else if dir == 3 {
                    (x,y,dir) = (x,0,4)
                } else {
                    (x,y,dir) = (x,C-1,3)
                }
               // print("x,y,dir ",x,y,dir)
                
                if remain != 0 {
                    dir = matchDir[dir]
                    (x,y) = (x + dx[dir] * remain, y + dy[dir] * remain)
                    //print("x,y: ",x,y)
                }
            }
            //짝수면 시작한 위치에 있다
            else {
                //print("시작한 위치에서 시작")
                if dir == 1 {
                    (x,y,dir) = (0,y,1)
                } else if dir == 2 {
                    (x,y,dir) = (R-1,y,2)
                } else if dir == 3 {
                    (x,y,dir) = (x,C-1,3)
                } else {
                    (x,y,dir) = (x,0,4)
                }
                //print("x,y,dir ",x,y,dir)
                
                if remain != 0 {
                    dir = matchDir[dir]
                    //print("dir: \(dir)")
                    (x,y) = (x + dx[dir] * remain, y + dy[dir] * remain)
                    //print("x,y",x,y)
                }
            }
        }
        //print("연산 결과는 ", x,y,dir)
        sharkDic[key] = (x,y,speed,dir,size)
            
//        debugGraph()
//        debugShark()
//        print()
//        print()
//        print()
    }
    
    var deleteList = [Int]()
    
    //make deleteList
    for (_,value) in sharkDic {
        let (x,y,_,_,size) = value
        if graph[x][y] == 0 {
            graph[x][y] = size
        } else {
            if graph[x][y] > size {
                deleteList.append(size)
            } else {
                deleteList.append(graph[x][y])
                graph[x][y] = size
            }
        }
    }
    
    for d in deleteList {
        sharkDic[d] = nil
    }
    //debugGraph()
    //debugShark()
    //print()
    //print()
    //print()
    
}



var sharkSum = 0


for i in 0..<C {
    //1. 낚시왕이 오른쪽으로 한칸 이동
    //2. 해당 열에서 가장 땅과 가까운 상어를 잡는다!
    //print("\n\n\n\n상어를 잡자!")
    sharkSum += catchShark(col: i)
    
    //3. 상어가 이동한다
    //print("상어의 이동")
    moveShark()
}

print(sharkSum)
