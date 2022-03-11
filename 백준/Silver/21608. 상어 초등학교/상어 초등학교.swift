//상어초등학교

let n = Int(readLine()!)!

var graph = Array(repeating: Array(repeating: 0, count: n), count: n)
var like = Array(repeating: [Int](), count: n*n+1)

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

for _ in 0..<n*n {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}

    let student = t[0]
    
    like[student] = Array(t[1...])

    //1. 비어있는 칸 중에서 좋아하는 학생이 인접한 칸에 가장많은칸!
    
    var res = [-1,-1,-1,-1]

    for i in 0..<n {
        for j in 0..<n {
            
            //비어있는 칸일경우
            if graph[i][j] == 0 {

                var emptyCnt = 0
                var likeCnt = 0

                //1. 비어있는 칸, 좋아하는 칸의 개수를 센다.
                for k in 0..<4 {
                    let (nx,ny) = (i+dx[k], j+dy[k])
                    if (0..<n).contains(nx) && (0..<n).contains(ny) {
                        if graph[nx][ny] == 0 {
                            emptyCnt += 1
                        } else if like[student].contains(graph[nx][ny]) {
                            likeCnt += 1
                        }
                    }
                }

                if res == [-1,-1,-1,-1] {
                    res = [i,j,emptyCnt,likeCnt]
                }

                if likeCnt > res[3] {
                    res = [i,j,emptyCnt, likeCnt]
                } else if likeCnt == res[3] && emptyCnt > res[2] {
                    res = [i,j,emptyCnt, likeCnt]
                } else if likeCnt == res[3] && emptyCnt == res[2] {
                    if res[0] > i {
                        res = [i,j,emptyCnt,likeCnt]
                    } else if res[0] == i && res[1] > j {
                        res = [i,j,emptyCnt, likeCnt]
                    }
                }
            }
        }
    }

    graph[res[0]][res[1]] = student
}

//만족도구하기



var sum = 0

for i in 0..<n {
    for j in 0..<n {
        let s = graph[i][j]
        var love = 0
        for k in 0..<4 {
            let (nx,ny) = (i+dx[k], j+dy[k])
            if (0..<n).contains(nx) && (0..<n).contains(ny) {
                if like[s].contains(graph[nx][ny]) {
                    love += 1
                }
            }
        }

        switch love {
        case 1:
            sum += 1
        case 2:
            sum += 10
        case 3:
            sum += 100
        case 4:
            sum += 1000
        default:
            break
        }
    }
}

print(sum)