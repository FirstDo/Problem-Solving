let n = Int(readLine()!)!
var arr: [Int] = []
var visited = [Bool](repeating: false, count: n)
var result: [[Int]] = []
var temp: [Int] = []

arr = readLine()!.split(separator: " ").map{Int(String($0))!}

func permutation(_ depth: Int) {
    if depth == n {
        result.append(temp)
        return
    }

    for i in 0..<n {
        if visited[i] { continue }
        visited[i] = true
        temp.append(i)
        permutation(depth+1)
        visited[i] = false
        temp.removeLast()
        
    }
}

func maxResult(_ r: [Int]) -> Int {
    var sum = 0
    for i in 0..<n-1 {
        sum += abs(arr[r[i]] - arr[r[i+1]])
    }
    return sum
}

permutation(0)

var res = Int.min
for r in result {
    res = max(maxResult(r),res)
}
print(res)
