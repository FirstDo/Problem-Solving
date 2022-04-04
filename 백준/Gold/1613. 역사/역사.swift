//1613번

func floyidWarshall() {
    for k in 1...n {
        for i in 1...n {
            for j in 1...n where !arr[i][j] {
                if arr[i][k], arr[k][j] {
                    arr[i][j] = true
                }
            }
        }
    }
}

let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nk[0], k = nk[1]

var arr = Array(repeating: Array(repeating: false, count: n+1), count: n+1)

for _ in 0..<k {
    let ab = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = ab[0], b = ab[1]
    arr[a][b] = true
}

floyidWarshall()

let s = Int(readLine()!)!

for _ in 0..<s {
    let ab = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = ab[0], b = ab[1]
    
    if arr[a][b] {
        print(-1)
    } else if arr[b][a] {
        print(1)
    } else {
        print(0)
    }
}
