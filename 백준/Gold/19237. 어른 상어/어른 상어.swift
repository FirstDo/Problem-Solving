//19237번 어른 상어

import Foundation

class Shark {
    //static Property (상하좌우)
    
    
    //priority move
    private let search: [[Int]]
    
    init(_ up: [Int], _ down: [Int], _ left: [Int], _ right: [Int]) {
        self.search = [[],up,down,left,right]
    }

    convenience init() {
        self.init([],[],[],[])
    }
    
    func move(_ shark: inout (Int,Int,Int,Int)) {
        let dx = [-10,-1,1,0,0]
        let dy = [-10,0,0,-1,1]
        //1순위 아무냄새가 없는칸 탐색
        
        let (no,x,y,dir) = shark
        
        for i in search[dir] {
            let (nx,ny) = (x + dx[i], y + dy[i])
            //범위안이고, 냄새가 없으면 이동하고 상어 업데이트 후 종료
            if (0..<n).contains(nx) && (0..<n).contains(ny) && graph[nx][ny].0 == 0 {
                shark = (no,nx,ny,i)
                return
            }
        }
        
        //2순위 자신의 냄새가 있는칸 탐색
        for i in search[dir] {
            let (nx,ny) = (x + dx[i], y + dy[i])
            //범위안이고, 자기냄새 있으면 이동하고 업데이트 후 종료
            if (0..<n).contains(nx) && (0..<n).contains(ny) && graph[nx][ny].0 == no {
                shark = (no,nx,ny,i)
                return
            }
        }
    }
    
    
    //debug
    func log() {
        for s in search[1...] {
            print(s)
        }
        print()
    }
    
    
}

var dirInfo = [Shark]()
dirInfo.append(Shark())


//MARK: - input
let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m,k) = (t[0],t[1],t[2])

//sharkNum, x,y,dir
var sharksTemp = Array(repeating: (-1,-1,-1,-1), count: m+1)
//(상어냄새번호, 지속시간)
var graph = Array(repeating: Array(repeating: (0,0), count: n), count: n)

for i in 0..<n {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    for j in 0..<n {
        if t[j] != 0 {
            sharksTemp[t[j]] = (t[j],i,j,-1)
        }
    }
}
//상어 초기방향 저장
let sharkDirInfo = readLine()!.split(separator: " ").map{Int(String($0))!}
for i in 1...sharkDirInfo.count {
    sharksTemp[i].3 = sharkDirInfo[i-1]
}

for _ in 0..<m {
    //상하좌우 우선순위 입력받기
    let up : [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
    let down : [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
    let left : [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
    let right : [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
    dirInfo.append(Shark(up, down, left, right))
}




var sharkList = Array(sharksTemp[1...])
sharksTemp.removeAll()

//- MARK: 디버그 함수

//그래프 디버그
func debugGraph() {
    print("debugGraph")
    for g in graph {
        print(g)
    }
}
//상어 위치 디버그
func debugShark() {
    print("\nshark x,y,dir")
    print(sharkList)
    print("\n")
}

func debug() {
    debugGraph()
    debugShark()
//    print("log")
//    for s in dirInfo[1...] {
//        s.log()
//    }
}

//- MARK: ps함수

//냄새를 1씩 줄이는 함수
func reduceSmell() {
    //print("reduceSmell")
    for i in 0..<n {
        for j in 0..<n {
            if graph[i][j].1 > 0 {
                graph[i][j].1 -= 1
                
                if graph[i][j].1 == 0 {
                    graph[i][j].0 = 0
                }
            }
        }
    }
}

//상어가 냄새를 뿌리는 함수
func spreadSmell() {
    //print("spreadSmell")
    for (no,x,y,_) in sharkList {
        graph[x][y] = (no,k)
    }
}

//상어가 이동하는 함수
func moveShark() {
    //print("moveShark")
    for i in 0..<sharkList.count {
        var shark = sharkList[i]
        //print("이동전: \(sharkList[i])")
        dirInfo[shark.0].move(&sharkList[i])
        //print("이동후: \(sharkList[i])")
    }
}

//겹치는 상어들을 찾고 지우는 함수
func removeShark() {
    var check = Array(repeating: Array(repeating: 0, count: n), count: n)
    var deleteList = [Int]()
    
    for i in 0..<sharkList.count {
        let (no,x,y,_) = sharkList[i]
        //자리 없으면 자리 차지함!
        if check[x][y] == 0 {
            check[x][y] = no
        } else {
            //이미 자리가 있고, 나보다 강력하면 내가 쫒겨남
            if check[x][y] < no {
                deleteList.append(no)
            }
            //내가 더 강력하면 쫒아내자!
            else {
                deleteList.append(check[x][y])
                check[x][y] = no
            }
        }
    }
    
    sharkList = sharkList.filter({ no,_,_,_ in
        !deleteList.contains(no)
    })
}

var time = 0


spreadSmell()

while time < 1000 {
    time += 1
    //1. 상어가 동시에 상하좌우 인접한 칸 중 하나로 이동한다.
        // 상어별 우선순위에 따라 이동하는데...
        // -1순위 아무 냄새가 없는칸
        // -2순위 자신의 냄새가 있는 칸
    moveShark()
    
    //2. 겹쳐있는 상어들제거
    removeShark()
    
    if sharkList.count == 1 {
        print(time)
        break
    }
    
    if time == 1000 {
        print(-1)
        break
    }
    
    //3. 냄새 줄이기
    reduceSmell()
    
    //4. 냄새 뿌리기
    spreadSmell()
    
    //debug()
}




    
    




