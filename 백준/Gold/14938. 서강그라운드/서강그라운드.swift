//14938번 서강그라운드

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m,r) = (t[0],t[1],t[2])

let items = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}

let INF = 10000000

var arr = Array(repeating: Array(repeating: INF, count: n+1), count: n+1)

for _ in 0..<r {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (a,b,l) = (t[0],t[1],t[2])
    arr[a][b] = l
    arr[b][a] = l
}

(0...n).forEach{arr[$0][$0] = 0}

//플로이드 와샬
for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            if i == j {continue}
            arr[i][j] = min(arr[i][j], arr[i][k] + arr[k][j])
        }
    }
}

var ans = 0

for i in 1...n {
    let target = arr[i].enumerated()
    
    let res = target.filter{$0.element <= m}.map{$0.offset}
    
    ans = max(ans, res.reduce(0, { result, idx in
        return result + items[idx]
    }))
}
print(ans)
