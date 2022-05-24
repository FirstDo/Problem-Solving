// 2281번 데스노트

import Foundation

func search(name: Int, len: Int) -> Int {
    // 이름을 끝까지 탐색했을 경우: 종료조건
    if name >= n { return 0 }
    
    // 이미 구한 값이면 그대로 return
    if dp[name][len] != -1 {
        return dp[name][len]
    }
    
    // 다음줄에 쓰는 경우
    dp[name][len] = (m - len + 1) * (m - len + 1) + search(name: name+1, len: names[name] + 1)
    
    // 같은줄에 쓰는 경우
    if len + names[name] <= m {
        dp[name][len] = min(dp[name][len], search(name: name+1, len: len + names[name] + 1))
    }
    
    return dp[name][len]
}

// Input

let t = readLine()!.components(separatedBy: " ").map{Int($0)!}
let (n, m) = (t[0], t[1])
var names = Array(repeating: 0, count: 1010)
var dp = Array(repeating: Array(repeating: -1, count: 1010), count: 1010)

for i in 0..<n {
    names[i] = Int(readLine()!)!
}

print(search(name: 0, len: 0))
