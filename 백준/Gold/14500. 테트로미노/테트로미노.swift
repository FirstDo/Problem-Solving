// 테트로미노: 완전탐색

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (t[0],t[1])

var graph = [[Int]]()

var ans = 0


for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
//범위검사. 근데.. 꼭 테트리스를 다 할 필요는 없는것 같다
func validRange(_ pos: [(Int,Int)]) -> Bool {
    for (x,y) in pos {
        if !(0..<n).contains(x) || !(0..<m).contains(y) {
            return false
        }
    }
    return true
}

func getSum(_ p: [Int]) -> Int {
    //print("p: ", p)
    return graph[p[0]][p[1]] + graph[p[2]][p[3]] + graph[p[4]][p[5]] + graph[p[6]][p[7]]
}


for i in 0..<n {
    for j in 0..<m {
        //일자블록 case 1:
        if validRange([(i,j), (i,j+3)]) {
            let sum = getSum([i,j,i,j+1,i,j+2,i,j+3])
            ans = max(ans,sum)
            //print("debug 일자블록 case 1")
        }
        //일자블록 case 2:
        if validRange([(i,j), (i+3,j)]) {
            let sum = getSum([i,j,i+1,j,i+2,j,i+3,j])
            ans = max(ans,sum)
            //print("debug 일자블록 case 2")
        }

        //네모블록

        if validRange([(i,j),(i+1,j+1)]) {
            let sum = getSum([i,j,i+1,j,i,j+1,i+1,j+1])
            ans = max(ans,sum)
            //print("debug 네모 case 1")
        }

        //L블록 : 1

        if validRange([(i,j), (i+2,j+1)]) {
            let sum = getSum([i,j,i+1,j,i+2,j,i+2,j+1])
            ans = max(ans,sum)
            //print("debug L case 1")
        }

        //L블록 : 2

        if validRange([(i,j), (i+2,j-1)]) {
            let sum = getSum([i,j,i+1,j,i+2,j,i+2,j-1])
            ans = max(ans,sum)
            //print("debug L case 2")
        }

        //L블록 : 3

        if validRange([(i,j), (i+1,j), (i+1,j-2)]) {
            let sum = getSum([i,j,i+1,j,i+1,j-1,i+1,j-2])
            ans = max(ans,sum)
            //print("debug L case 3")
        }

        //L블록 : 4

        if validRange([(i,j), (i+1,j), (i+1,j+2)]) {
            //print("debug L case 4")
            let sum = getSum([i,j,i+1,j,i+1,j+1,i+1,j+2])
            ans = max(ans,sum)
        }

        //L블록 : 5

        if validRange([(i,j), (i,j+1), (i+2,j+1)]) {
            //print("debug L case 5")
            let sum = getSum([i,j,i,j+1,i+1,j+1,i+2,j+1])
            ans = max(ans,sum)
        }

        //L블록 : 6

        if validRange([(i,j), (i,j-1), (i+2,j-1)]) {
            //print("debug L case 6")
            let sum = getSum([i,j,i,j-1,i+1,j-1,i+2,j-1])
            ans = max(ans,sum)
        }

        //L블록 : 7

        if validRange([(i,j), (i+1,j+2), (i+1,j)]) {
            //print("debug L case 7")
            let sum = getSum([i,j,i+1,j,i,j+1,i,j+2])
            ans = max(ans,sum)
        }

        //L블록 : 8

        if validRange([(i,j), (i+1,j+2)]) {
            let sum = getSum([i,j,i,j+1,i,j+2,i+1,j+2])
            ans = max(ans,sum)
            //print("debug L case 8")
        }
        
        //z블록 : 1

        if validRange([(i,j), (i+2,j+1)]) {
            let sum = getSum([i,j,i+1,j,i+1,j+1,i+2,j+1])
            ans = max(ans,sum)
            //print("debug z case 1")
        }    

        //z블록 : 2
        
        if validRange([(i,j), (i+2,j-1)]) {
            let sum = getSum([i,j,i+1,j,i+1,j-1,i+2,j-1])
            ans = max(ans,sum)
            //print("debug z case 2")
        }    

        //z블록 : 3
        
        if validRange([(i,j), (i+1,j-2)]) {
            let sum = getSum([i,j,i,j-1,i+1,j-1,i+1,j-2])
            ans = max(ans,sum)
            //print("debug z case 3")
        }    

        //z블록 : 4
        
        if validRange([(i,j), (i+1,j+2)]) {
            let sum = getSum([i,j,i,j+1,i+1,j+1,i+1,j+2])
            ans = max(ans,sum)
            //print("debug z case 4")
        }    

        //ㅗ블록 : 1
        
        if validRange([(i,j), (i,j+2), (i+1,j+1)]) {
            let sum = getSum([i,j,i,j+1,i,j+2,i+1,j+1])
            ans = max(ans,sum)
            //print("debug ㅗ case 1")
        }    

        //ㅗ블록 : 2
        
        if validRange([(i,j), (i+2,j), (i+1,j+1)]) {
            let sum = getSum([i,j,i+1,j,i+1,j+1,i+2,j])
            ans = max(ans,sum)
            //print("debug ㅗ case 2")
        }  

        //ㅗ블록 : 3
        
        if validRange([(i,j), (i-1,j+1), (i,j+2)]) {
            let sum = getSum([i,j,i,j+1,i,j+2,i-1,j+1])
            ans = max(ans,sum)
            //print("debug ㅗ case 3")
        }  

        //ㅗ블록 : 4
        
        if validRange([(i,j), (i+2,j), (i+1,j-1)]) {
            let sum = getSum([i,j,i+1,j,i+2,j,i+1,j-1])
            ans = max(ans,sum)
            //print("debug ㅗ case 4")
        }  

    }
}

// 일자불록 * 2
// 네모블록 * 1
// L블록 * 8
// ㅜ블록 
// z블록

print(ans)