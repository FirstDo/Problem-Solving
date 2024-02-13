let n = Int(readLine()!)!
var candy: [[Character]] = []
for _ in 0..<n {
    let line = Array(readLine()!)
    candy.append(line)
}

//행렬 검사하는 부분
func checkCandy(_ x: Int, _ y: Int) -> Int{
    var curLen = 1
    var maxLen = 1

    for i in 0..<n-1 {
        if candy[i][y] == candy[i+1][y] {
            curLen += 1
        } else {
            curLen = 1
        }
        maxLen = max(maxLen,curLen)
    }

    curLen = 1
    for i in 0..<n-1 {
        if candy[x][i] == candy[x][i+1] {
            curLen += 1
        } else {
            curLen = 1
        }
        maxLen = max(maxLen,curLen)
    }
    return maxLen
}

var answer = 0

//바꿀 사탕두개를 고르는 부분, 아래, 오른쪽만 확인하면 됨
for i in 0..<n {
    for j in 0..<n {
        //print(i,j, "와 변경")
        let (x1,y1) = (i,j)
        //마지막 행이 아니면 아래검사
        if i != n-1 {
            let (x2,y2) = (i+1,j)
            let temp = candy[x1][y1]
            candy[x1][y1] = candy[x2][y2]
            candy[x2][y2] = temp
            
            answer = max(answer, checkCandy(x1,y1))
            answer = max(answer, checkCandy(x2,y2))

            candy[x2][y2] = candy[x1][y1]
            candy[x1][y1] = temp

        }

        //마지막 열이 아니면 오른쪽 검사
        if j != n-1 {
            let (x2,y2) = (i,j+1)
            let temp = candy[x1][y1]
            candy[x1][y1] = candy[x2][y2]
            candy[x2][y2] = temp
            
            answer = max(answer, checkCandy(x1,y1))
            answer = max(answer, checkCandy(x2,y2))

            candy[x2][y2] = candy[x1][y1]
            candy[x1][y1] = temp

        }

    }
}

print(answer)