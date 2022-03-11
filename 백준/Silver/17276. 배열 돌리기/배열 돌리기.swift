//17276번 배열 돌리기

//45도 회전
func rotate(_ arr: inout [[Int]]) {
    let n = arr.count
    
    var copyArr = arr
    
    for i in 0..<n {
        copyArr[i][n/2] = arr[i][i]
    }

    for i in 0..<n {
        
        copyArr[i][n-1-i] = arr[i][n/2]
    }
    
    for i in 0..<n {
        copyArr[n/2][n-1-i] = arr[i][n-1-i]
    }
    
    for i in 0..<n {
        copyArr[i][i] = arr[n/2][i]
    }
    
    arr = copyArr
}

let t = Int(readLine()!)!

for _ in 0..<t {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (n,d) = (t[0],t[1])
    
    var arr = [[Int]]()
    
    for _ in 0..<n {
        let inputRow = readLine()!.split(separator: " ").map{Int(String($0))!}
        arr.append(inputRow)
    }
    
    let signedCnt = d/45
    let cnt = signedCnt >= 0 ? signedCnt : 8 + signedCnt
    
    (0..<cnt).forEach { _ in
        rotate(&arr)
    }
    
    for row in arr {
        print(row.map{String($0)}.joined(separator: " "))
    }
}
