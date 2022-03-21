//3980번 선발명단
var ans = 0
var arr: [[Int]] = []
var visit: [Bool] = []

for _ in 0..<Int(readLine()!)! {
    visit = Array(repeating: false, count: 12)
    arr = Array(repeating: [Int](), count: 12)
    ans = 0
    
    (1...11).forEach {
        arr[$0] = [1] + readLine()!.split(separator: " ").map{Int(String($0))!}
    }
    
    dfs(player: 1, sum: 0)
    print(ans)
}

func dfs(player: Int, sum: Int) {
    if player >= 12 {
        ans = max(ans, sum)
        return
    }
    
    for position in 1...11 where !visit[position] {
        if arr[player][position] != 0 {
            visit[position] = true
            dfs(player: player+1, sum: sum+arr[player][position])
            visit[position] = false
        }
    }
}