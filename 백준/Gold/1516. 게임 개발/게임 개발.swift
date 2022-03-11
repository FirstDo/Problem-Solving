let n = Int(readLine()!)!

var indegree = [Int](repeating: 0, count: n+1)
var buildTime = [Int](repeating: 0, count: n+1)
var dp = [Int](repeating: 0, count: n+1)
var graph = [[Int]](repeating: [], count: n+1)
var q: [Int] = []

for i in 1 ..< n+1 {
    let lines = readLine()!.split(separator: " ").map{Int(String($0))!}

    buildTime[i] = lines[0]
    for l in lines[1...] {
        if l == -1 {
            break
        }

        indegree[i] += 1
        graph[l].append(i)
    } 
    if indegree[i] == 0 {
        q.append(i)
    }
}


var idx = 0
while idx < q.count {
    let node = q[idx]
    idx += 1

    for nextNode in graph[node] {
        dp[nextNode] = max(dp[nextNode],dp[node] + buildTime[node])

        indegree[nextNode] -= 1
        if indegree[nextNode] == 0 {
            q.append(nextNode)
        }
    }
}

for i in 1..<n+1 {
    print(dp[i]+buildTime[i])
}