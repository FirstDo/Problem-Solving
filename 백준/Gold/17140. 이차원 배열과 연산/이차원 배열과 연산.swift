//17140번 이차원 배열과 연산

import Foundation

//입력받기
let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (r,c,k) = (t[0] - 1,t[1] - 1,t[2])


var (row,col) = (3,3)
var arr = [[Int]]()


for _ in 0..<3 {
    arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

//r 연산 & 행렬 업데이트
func rOperation() {
    //r 연산
    var maxRow = 0
    for i in 0..<row {
        
        var cnt = Array(repeating: 0, count: 101)
        
        for j in 0..<col {
            let tIdx = arr[i][j]
            if tIdx == 0 {
                continue
            }
            cnt[tIdx] += 1
        }
        var temp = [(Int,Int)]()
        
        for (idx,value) in cnt.enumerated() where value != 0{
            temp.append((idx,value))
        }
        
        temp.sort{
            if $0.1 == $1.1 {
                return $0.0 < $1.0
            }
            return $0.1 < $1.1
        }
        
        var tempRow = [Int]()
        temp.forEach { e1,e2 in
            tempRow.append(contentsOf: [e1,e2])
        }
        
        arr[i] = tempRow
        
        maxRow = max(maxRow, arr[i].count)
        
    }
    
    //row 재조정, col 업데이트
    
    let limit = maxRow > 100 ? 100: maxRow
    
    for i in 0..<row {
        let len = arr[i].count
        let cnt = limit - len
        if cnt > 0 {
            arr[i].append(contentsOf: Array(repeating: 0, count: cnt))
        } else if cnt < 0 {
            arr[i] = Array(arr[i][..<100])
        }
    }
    col = limit
}

//c연산
func cOperation() {
    var maxCol = 0
    
    var arr_col = Array(repeating: [Int](), count: col)
    
    //1. 열우선 행렬로 변환
    for i in 0..<row {
        for j in 0..<col {
            arr_col[j].append(arr[i][j])
        }
    }

    
    
    //C연산 수행
    for i in 0..<col {
        var cnt = Array(repeating: 0, count: 101)
        
        for j in 0..<row {
            let tIdx = arr_col[i][j]
            if tIdx == 0 {
                continue
            }
            cnt[tIdx] += 1
        }
        
        var temp = [(Int,Int)]()
        
        for (idx,value) in cnt.enumerated() where value != 0 {
            temp.append((idx,value))
        }
        
        temp.sort{
            if $0.1 == $1.1 {
                return $0.0 < $1.0
            }
            return $0.1 < $1.1
        }
        
        var tempRow = [Int]()
        
        temp.forEach { e1,e2 in
            tempRow.append(contentsOf: [e1,e2])
        }
        
        arr_col[i] = tempRow
        
        maxCol = max(maxCol, arr_col[i].count)
    }
    
    let limit = maxCol > 100 ? 100 : maxCol
    
    for i in 0..<col {
        let len = arr_col[i].count
        let cnt = limit - len
        
        if cnt > 0 {
            arr_col[i].append(contentsOf: Array(repeating: 0, count: cnt))
        } else if cnt < 0 {
            arr_col[i] = Array(arr_col[i][..<100])
        }
    }
    row = limit
    
    var arr_row = Array(repeating: [Int](), count: row)
    
    
    // 행우선 행렬로 변환
    for i in 0 ..< row {
        for j in 0 ..< col {
            arr_row[i].append(arr_col[j][i])
        }
    }

    arr = arr_row
}

var time = 0

while true {
    //정상 종료조건 확인
    if (0..<row).contains(r) && (0..<col).contains(c) && arr[r][c] == k{
        print(time)
        break
    }
    
    //100초 종료조건
    if time == 100 {
        print(-1)
        break
    }
    
    if row >= col {
        //R 연산
        rOperation()
    } else {
        //C 연산
        cOperation()
    }
    
    time += 1
}
