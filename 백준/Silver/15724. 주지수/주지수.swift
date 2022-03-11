/*
 15724번
 누가봐도 2차원 누적합문제
 */

//2차원 누적합 구하기
func getSum() -> [[Int]] {
    var arrSum = arr
    for i in 0..<n {
        for j in 1..<m {
            arrSum[i][j] += arrSum[i][j-1]
        }
    }
    
    for j in 0..<m {
        for i in 1..<n {
            arrSum[i][j] += arrSum[i-1][j]
        }
    }
    return arrSum
}

func getAreaSum(x1: Int, y1: Int, x2: Int, y2: Int) -> Int {
    var ansArea = arrSum[x2][y2]
    //가로영역구하기
    let rx = x1-1
    let ry = y2
    
    if rx >= 0 {
        ansArea -= arrSum[rx][ry]
    }
    //세로영역구하기
    let cx = x2
    let cy = y1-1
    
    if cy >= 0 {
        ansArea -= arrSum[cx][cy]
    }
    //겹치는 부분 빼주기
    if rx >= 0, cy >= 0 {
        ansArea += arrSum[rx][cy]
    }
    
    return ansArea
}



let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (nm[0], nm[1])

var arr = [[Int]]()

for _ in 0..<n {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    arr.append(t)
}

let arrSum = getSum()
let k = Int(readLine()!)!
for _ in 0..<k {
    let r = readLine()!.split(separator: " ").map{Int(String($0))!-1}
    let (x1,y1,x2,y2) = (r[0],r[1],r[2],r[3])
    print(getAreaSum(x1: x1, y1: y1, x2: x2, y2: y2))
}
