let n = Int(readLine()!)!
var result: [String] = [String](repeating: " ", count: n)
var visited: [Bool] = [Bool](repeating: false, count: n)

func permutation(_ depth: Int) {
    if depth == n {
        print(result.joined(separator: " "))
        return
    }

    for i in 0..<n {
        if visited[i] {
            continue
        }
        visited[i] = true
        result[depth] = "\(i+1)"
        permutation(depth+1)
        visited[i] = false
    }
}

permutation(0)