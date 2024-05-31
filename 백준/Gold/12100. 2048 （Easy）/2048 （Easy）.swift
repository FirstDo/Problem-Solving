let n = Int(readLine()!)!
var board: [[Int]] = []

for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

var allCase: [[Int]] = []
var visited = [Bool](repeating: false, count: 5)
var arr = [1,2,3,4]
var temp = [Int]()

//모든 경우의 중복순열을 구한다.
func permutation(_ depth: Int, _ limit: Int) {
    if depth >= limit {
        allCase.append(temp)
        return
    }

    for i in 0..<arr.count {
        temp.append(arr[i])
        permutation(depth+1, limit)
        temp.removeLast()
    }
}

temp.removeAll()
permutation(0,5)




var maxNum = 0

func move(_ dir: Int, _ arr: inout [[Int]]) {
    var check = [[Bool]](repeating: [Bool](repeating: false, count: n), count : n)
    switch dir {
        case 1: //up
            //print("up!")
            for i in 0..<n {
                for j in 0..<n {
                    if arr[i][j] == 0 { continue }
                    var row = i
                    var col = j
                    //print("row: \(row), col: \(col)", "현재좌표이다")
                    while true {
                        //합쳐질 좌표
                        let nextR = row - 1
                        let nextC = col
                        //print("nextRow: \(nextR), nextCol: \(nextC)", "합쳐질 위에있는 좌표이다")

                        if nextR < 0 || nextR >= n || nextC < 0 || nextC >= n {
                            //print("outofrange")
                            break
                        }
                        if arr[nextR][nextC] == 0 { //합쳐질 자리가 0 이면, 그 값 그대로 옮겨온다
                            //print("빈자리인경우")
                            arr[nextR][nextC] = arr[row][col]
                            arr[row][col] = 0
                        } else {    //두 숫자가 같고, 아직 합친자리가 아니라면
                            //print("합쳐질수 있는경우")
                            if arr[nextR][nextC] == arr[row][col] && check[nextR][nextC] == false {
                                //print("합치자~")
                                arr[nextR][nextC] = arr[row][col] * 2
                                arr[row][col] = 0
                                check[nextR][nextC] = true
                            }
                            break
                        }
                         row = nextR
                        col = nextC
                    }
                   
                }
            }
        case 2: //down
            //print("down!")
            for i in stride(from: n-1, through: 0, by: -1) {
                for j in 0..<n {
                    if arr[i][j] == 0 { continue }
                    var row = i
                    var col = j

                    while true {
                        //합쳐질 좌표
                        let nextR = row + 1
                        let nextC = col 

                        if nextR < 0 || nextR >= n || nextC < 0 || nextC >= n {break}
                        if arr[nextR][nextC] == 0 { //합쳐질 자리가 0 이면, 그 값 그대로 옮겨온다
                            arr[nextR][nextC] = arr[row][col]
                            arr[row][col] = 0
                        } else {    //두 숫자가 같고, 아직 합친자리가 아니라면
                            if arr[nextR][nextC] == arr[row][col] && check[nextR][nextC] == false {
                                arr[nextR][nextC] = arr[row][col] * 2
                                arr[row][col] = 0
                                check[nextR][nextC] = true
                            }
                            break
                        }
                        row = nextR
                        col = nextC
                    }
                    
                }
            }
        case 3: //left
            //print("left")
            for i in 0..<n {
                for j in 0..<n {
                    if arr[i][j] == 0 { continue }
                    var row = i
                    var col = j

                    while true {
                        //합쳐질 좌표
                        let nextR = row
                        let nextC = col - 1

                        if nextR < 0 || nextR >= n || nextC < 0 || nextC >= n {break}
                        if arr[nextR][nextC] == 0 { //합쳐질 자리가 0 이면, 그 값 그대로 옮겨온다
                            arr[nextR][nextC] = arr[row][col]
                            arr[row][col] = 0
                        } else {    //두 숫자가 같고, 아직 합친자리가 아니라면
                            if arr[nextR][nextC] == arr[row][col] && check[nextR][nextC] == false {
                                arr[nextR][nextC] = arr[row][col] * 2
                                arr[row][col] = 0
                                check[nextR][nextC] = true
                            }
                            break
                        }
                        row = nextR
                        col = nextC
                    }
                    
                }
            }
        case 4: //right
            //print("right")
            for i in 0..<n {
                for j in stride(from: n-1, through: 0, by: -1) {
                    if arr[i][j] == 0 { continue }
                    var row = i
                    var col = j

                    while true {
                        //합쳐질 좌표
                        let nextR = row 
                        let nextC = col + 1

                        if nextR < 0 || nextR >= n || nextC < 0 || nextC >= n {break}
                        if arr[nextR][nextC] == 0 { //합쳐질 자리가 0 이면, 그 값 그대로 옮겨온다
                            arr[nextR][nextC] = arr[row][col]
                            arr[row][col] = 0
                        } else {    //두 숫자가 같고, 아직 합친자리가 아니라면
                            if arr[nextR][nextC] == arr[row][col] && check[nextR][nextC] == false {
                                arr[nextR][nextC] = arr[row][col] * 2
                                arr[row][col] = 0
                                check[nextR][nextC] = true
                            }
                            break
                        }
                        row = nextR
                        col = nextC
                    }                
                }
            }
        default:
            break
    }
}

var maxResult = 0
for each in allCase {
    //print("case: \(each)")
    //보드의 복사배열을 넘겨서 move 연산을 수행
    var tempArr = board
    for dir in each {
        move(dir,&tempArr)
    }

    for t in tempArr {
        maxResult = max(maxResult,t.max()!)
    }
}
print(maxResult)

