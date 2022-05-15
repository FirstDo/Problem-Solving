// 16500번 문자열 판별

var possible = 0

func dfs(_ idx: Int) {
    if idx == len {
        possible = 1
        return
    }
    
    if visit[idx] { return }
    
    visit[idx] = true
    
    for i in 0..<n {
        if len - idx < words[i].count { continue }
        if words[i] == s[idx..<idx+words[i].count].joined(separator: "") {
            dfs(idx + words[i].count)
        }
    }
}

let s = Array(readLine()!).map{String($0)}
let len = s.count
let n = Int(readLine()!)!

var words = [String]()
for _ in 0..<n {
    words.append(readLine()!)
}

var visit = Array(repeating: false, count: len+1)

dfs(0)

print(possible)

