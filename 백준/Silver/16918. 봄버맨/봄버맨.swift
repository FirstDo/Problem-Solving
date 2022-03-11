//16918번 봄버맨
import Foundation

//16918번 붐버맨
let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (R,C,n) = (t[0],t[1],t[2])

var graph = [[String]]()

//초기 1차 폭탄 설치 위치
var boomList = [(Int,Int)]()

for i in 0..<R {
    let t = Array(readLine()!).map{String($0)}
    for j in 0..<C {
        if t[j] == "O" {
            boomList.append((i,j))
        }
    }
    graph.append(t)
}

//arr to string
func getAnswer(arr: [[String]]) {
    print(arr.flatMap{$0+["\n"]}.joined())
}


//n == 1 : 초기상태
var graph1 = graph
//n%2 == 0 폭탄이 모두 설치된 상태
var graph2 = Array(repeating: Array(repeating: "O", count: C), count: R)
//n%4 == 3  첫번째 폭탄이 터진 상태
//n%4 == 1  두번째 폭탄 설치 -> 첫번째 폭탄 터진후 -> 첫번째 폭탄 설치후 -> 두번째 폭탄이 터진상태

var boomList2 = [(Int,Int)]()
//1초일땐 낫띵
//2초일땐 빈자리에 폭탄설치
for i in 0..<R {
    for j in 0..<C {
        if graph1[i][j] == "." {
            boomList2.append((i,j))
            graph1[i][j] = "O"
        }
    }
}

//3초일땐 boomList 1차폭탄 폭발
for (x,y) in boomList {
    for (a,b) in [(x,y),(x+1,y),(x-1,y),(x,y+1),(x,y-1)] where (0..<R).contains(a) && (0..<C).contains(b) {
        graph1[a][b] = "."
    }
}
let graph3 = graph1

//터진 2차폭탄 제거하기
var temp = [(Int,Int)]()
for (x,y) in boomList2 {
    if graph1[x][y] == "O" {
        temp.append((x,y))
    }
}
boomList2 = temp

//4초일땐 빈자리를 1차폭탄 설치
graph1 = graph2

//5초일땐 boomList 2차폭탄 폭발
for (x,y) in boomList2 {
    for (a,b) in [(x,y),(x+1,y),(x-1,y),(x,y+1),(x,y-1)] where (0..<R).contains(a) && (0..<C).contains(b) {
        graph1[a][b] = "."
    }
}

if n == 1 {
    getAnswer(arr: graph)
} else if n % 2 == 0 {
    getAnswer(arr: graph2)
} else if n % 4 == 1 {
    getAnswer(arr: graph1)
} else if n % 4 == 3 {
    getAnswer(arr: graph3)
}
