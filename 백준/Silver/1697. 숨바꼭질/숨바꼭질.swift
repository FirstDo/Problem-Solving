let inputs = readLine()!.split(separator: " ")
var N = Int(inputs[0])!
let K = Int(inputs[1])!

var graph = Array(repeating: 100000, count: 150001)

var queue: [Int] = [N]
graph[N] = 0

func condition(_ x: Int) -> Bool {
    if x>=0 && x<=150000 {
        return true
    }
    return false
}

func bfs(_ start: Int) -> Int{
    var startIdx = 0
    while startIdx < queue.count {
        let pos = queue[startIdx]
        startIdx += 1
        
        if condition(pos+1) && graph[pos+1] > graph[pos] + 1{
            graph[pos+1] = graph[pos] + 1
            queue.append(pos+1)
        }
        
        if condition(pos-1) && graph[pos-1] > graph[pos] + 1  {
            graph[pos-1] = graph[pos] + 1
            queue.append(pos-1)
        }
        
        if condition(pos*2) && graph[pos*2] > graph[pos] + 1{
            graph[pos*2] = graph[pos] + 1
            queue.append(pos*2)
        }
        
        if graph[K] < 100000 {
            break
        }
    }
    return graph[K]
}

print(bfs(N))
