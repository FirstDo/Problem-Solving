import Foundation
let n = Int(readLine()!)!
let op = Array(readLine()!.split(separator: " "))

var result: [Int] = []
var temp: [Int] = []
var visited = [Bool](repeating: false, count: 10)


func permutation(_ before: Int, _ depth: Int) {
    if depth == n+1 {
        var myStr = ""
        _ = temp.map { myStr += "\($0)"}
        result.append(Int(myStr)!)
        return
    }

    for i in 0..<10 {
        if visited[i] { continue }
        if (op[depth-1] == "<" && before < i) || (op[depth-1] == ">" && before > i){
            visited[i] = true
            temp.append(i)
            permutation(i,depth+1)
            visited[i] = false
            temp.removeLast()
        } else {
            continue
        }
    }
}


for i in 0..<10 {
    temp.append(i)
    visited[i] = true
    permutation(i,1)
    temp.removeLast()
    visited[i] = false
}


let maxA = result.max()!
let maxLen = String(maxA).count
if maxLen != n+1 {
    print("0\(maxA)")
} else {
    print(maxA)
}

let minB = result.min()!
let minLen = String(minB).count
if minLen != n+1 {
    print("0\(minB)")
} else {
    print(minB)
}