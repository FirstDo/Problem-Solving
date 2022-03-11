//14431번 소수마을
import Foundation

//heap만들기
class Heap<T> where T: Comparable {
    var nodes: [T] = []
    var sort: (T,T) -> Bool
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    init(sort: @escaping (T,T) -> Bool) {
        self.sort = sort
    }
    
    func insert(_ element: T) {
        nodes.append(element)
        
        var idx = nodes.count - 1
        
        while idx > 0, sort(nodes[idx], nodes[(idx-1)/2]) {
            nodes.swapAt(idx, (idx-1)/2)
            idx = (idx-1)/2
        }
    }
    
    func delete() -> T {
        if nodes.count == 1 {
            return nodes.removeLast()
        }
        
        let target = nodes.first!
        nodes.swapAt(0, nodes.count-1)
        _ = nodes.popLast()
        
        var idx = 0
        let len = nodes.count
        
        while idx < len {
            let leftChild = idx * 2 + 1
            let rightChild = leftChild + 1
            
            let child = [leftChild, rightChild]
                .filter{$0 < len && sort(nodes[$0], nodes[idx])}
                .sorted{ sort(nodes[$0], nodes[$1])}
            
            if child.isEmpty { break }
            
            nodes.swapAt(idx, child[0])
            idx = child[0]
        }
        
        return target
    }
}

struct EdgeData: Comparable {
    let node: Int
    let cost: Int
    
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
        return lhs.cost < rhs.cost
    }
}

//그래프 만들기
func isConnected(point1: (x: Int, y: Int), point2: (x: Int, y: Int)) -> (Bool,Int) {
    let dist = distance(from: point1, to: point2)
    return isPrime(num: dist)
}

func distance(from: (x: Int,y: Int), to: (x: Int,y: Int)) -> Int {
    let dx = Double(abs(from.x - to.x))
    let dy = Double(abs(from.y - to.y))
    let dist = Int(sqrt(dx*dx + dy*dy))
    return dist
}

func isPrime(num: Int) -> (Bool, Int) {
    if num < 4 {
        return num == 1 ? (false, num) : (true,num)
    }
    
    let limit = Int(sqrt(Double(num)))
    
    for i in 2...limit where num % i == 0 {
        return (false,num)
    }
    
    return (true, num)
}

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (sx,sy) = (t[0],t[1])
let (ex,ey) = (t[2],t[3])

let n = Int(readLine()!)!

var graph = Array(repeating: [(node: Int,cost: Int)](), count: n+2)

var positions = [(x: Int,y: Int)]()
positions.append((x: sx, y: sy))
positions.append((x: ex, y: ey))

for _ in 0..<n {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (x,y) = (t[0], t[1])
    positions.append((x,y))
}

let len = positions.count

for i in 0..<len-1 {
    for j in i+1..<len {
        let (bool, dist) =  isConnected(point1: positions[i], point2: positions[j])
        
        if bool {
            graph[i].append((j, dist))
            graph[j].append((i, dist))
        }
    }
}

let ans = dijstra()

print(ans == 0 || ans == Int.max ? -1 : ans)


//다익스트라 수행
func dijstra() -> Int {
    //최소힙 생성
    let pq = Heap<EdgeData>(sort: <)
    var distance = Array(repeating: Int.max, count: n+2)
    distance[0] = 0
    pq.insert(EdgeData(node: 0, cost: 0))
    
    while !pq.isEmpty {
        //heap에서 꺼내옴
        let cur = pq.delete()
        
        //이미 처리된 값이라면 continue
        if distance[cur.node] < cur.cost {
            continue
        }
        
        for next in graph[cur.node] {
            let nextDistance = next.cost + cur.cost
            //갱신할 필요가 있다면 갱신해줍니다
            if nextDistance < distance[next.node] {
                distance[next.node] = nextDistance
                pq.insert(EdgeData(node: next.node, cost: nextDistance))
            }
        }
    }
    
    return distance[1]
}

