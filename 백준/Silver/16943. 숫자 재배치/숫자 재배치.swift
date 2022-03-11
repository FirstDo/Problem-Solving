//16943번 숫자 재배치
import Foundation

var maxNumber = -1
var visit = Array(repeating: false, count: 11)
var temp = [Character]()

let AB = readLine()!.components(separatedBy: " ")
let a = Array(AB[0])
let b = Int(AB[1])!

dfs(0, String(a).count)
print(maxNumber)

func dfs(_ depth: Int, _ len: Int) {
    if depth == len {
        let tempNumber = Int(String(temp))!
        if tempNumber < b {
            maxNumber = max(maxNumber, tempNumber)
        }
    }
    
    for i in 0..<len {
        if visit[i] {continue}
        if depth == 0 && Int(String(a[i])) == 0 {
            continue
        }
        
        visit[i] = true
        temp.append(a[i])
        dfs(depth+1, len)
        visit[i] = false
        _ = temp.removeLast()
    }
}
