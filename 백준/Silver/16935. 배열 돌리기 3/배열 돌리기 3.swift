// 16935번 배열 돌리기 3

import Foundation

func printArr() {
    for a in arr {
        print(a.map{String($0)}.joined(separator: " "))
    }
}

func op1() {
    arr = arr.reversed()
}

func op2() {
    arr = arr.map {
        return $0.reversed()
    }
}

func op3() {
    (n , m) = (m, n)
    var temp = Array(repeating: Array(repeating: 0, count: m), count: n)
    
    for i in 0..<n {
        for j in 0..<m {
            temp[i][j] = arr[m - j - 1][i]
        }
    }
    
    arr = temp
}

func op4() {
    (n , m) = (m, n)
    var temp = Array(repeating: Array(repeating: 0, count: m), count: n)
    
    for i in 0..<n {
        for j in 0..<m {
            temp[i][j] = arr[j][n-1-i]
        }
    }
    
    arr = temp
}

func op5() {
    var p1 = Array(repeating: Array(repeating: 0, count: m/2), count: n/2)
    var p2 = Array(repeating: Array(repeating: 0, count: m/2), count: n/2)
    var p3 = Array(repeating: Array(repeating: 0, count: m/2), count: n/2)
    var p4 = Array(repeating: Array(repeating: 0, count: m/2), count: n/2)
    
    for i in 0..<n/2 {
        for j in 0..<m/2 {
            p1[i][j] = arr[i][j]
            p2[i][j] = arr[i][j + m/2]
            p4[i][j] = arr[i + n/2][j]
            p3[i][j] = arr[i + n/2][j + m/2]
        }
    }
    
    (p1,p2,p3,p4) = (p4, p1, p2, p3)
    
    for i in 0..<n/2 {
        for j in 0..<m/2 {
            arr[i][j] = p1[i][j]
            arr[i][j + m/2] = p2[i][j]
            arr[i + n/2][j] = p4[i][j]
            arr[i + n/2][j + m/2] = p3[i][j]
        }
    }
}

func op6() {
    var p1 = Array(repeating: Array(repeating: 0, count: m/2), count: n/2)
    var p2 = Array(repeating: Array(repeating: 0, count: m/2), count: n/2)
    var p3 = Array(repeating: Array(repeating: 0, count: m/2), count: n/2)
    var p4 = Array(repeating: Array(repeating: 0, count: m/2), count: n/2)
    
    for i in 0..<n/2 {
        for j in 0..<m/2 {
            p1[i][j] = arr[i][j]
            p2[i][j] = arr[i][j + m/2]
            p4[i][j] = arr[i + n/2][j]
            p3[i][j] = arr[i + n/2][j + m/2]
        }
    }
    
    
    (p1,p2,p3,p4) = (p2, p3, p4, p1)
    
    for i in 0..<n/2 {
        for j in 0..<m/2 {
            arr[i][j] = p1[i][j]
            arr[i][j + m/2] = p2[i][j]
            arr[i + n/2][j] = p4[i][j]
            arr[i + n/2][j + m/2] = p3[i][j]
        }
    }
}

let t = readLine()!.components(separatedBy: " ").map{Int($0)!}
var (n,m) = (t[0], t[1])

var arr = (0..<n).map { _ in
    readLine()!.components(separatedBy: " ").map{Int($0)!}
}

for r in readLine()!.components(separatedBy: " ").map({Int($0)!}) {
    switch r {
    case 1:
        op1()
    case 2:
        op2()
    case 3:
        op3()
    case 4:
        op4()
    case 5:
        op5()
    case 6:
        op6()
    default:
        break
    }
}

printArr()
