
let line = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,B) = (line[0],line[1])
let mod = 1000
var matrix: [[Int]] = []

for _ in 0..<N {
    matrix.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

func mulMatrix(_ b: Int) -> [[Int]]{
    //오류처리
    if b == 1 {
        return matrix
    } else if b % 2 == 1 {
        var tempArr = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
        var newArr = mulMatrix(b-1)

        for i in 0..<N {
            for j in 0..<N {
                for k in 0..<N {
                    tempArr[i][j] += newArr[i][k] * matrix[k][j]
                }
                tempArr[i][j] %= mod
            }
        }
        return tempArr
    } else {
        var tempArr = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
        var newArr = mulMatrix(b/2)

        for i in 0..<N {
            for j in 0..<N {
                for k in 0..<N {
                    tempArr[i][j] += newArr[i][k] * newArr[k][j]
                }
                tempArr[i][j] %= mod
            }
        }
        return tempArr
    }
}


let result = mulMatrix(B)

for i in 0..<N {
    for j in 0..<N {
        print(result[i][j]%mod, terminator: " ")
    }
    print()
}