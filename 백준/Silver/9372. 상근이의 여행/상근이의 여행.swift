//9372번: 상근이의 여행

let t = Int(readLine()!)!

func findParent(x: Int, parent: inout [Int]) -> Int {
    if parent[x] == x {
        return x
    }
    return findParent(x: parent[x], parent: &parent)
}

func unionParent(x: Int, y: Int, parent: inout [Int]) {
    let x = findParent(x: x, parent: &parent)
    let y = findParent(x: y, parent: &parent)
    
    if x <= y {
        parent[y] = x
    } else {
        parent[x] = y
    }
}

for _ in 0..<t {
    let nm = readLine()!.split(separator: " ").map{Int($0)!}
    let (n,m) = (nm[0], nm[1])
    
    var parent = Array(repeating: 0, count: n+1)
    var nodeCount = 0
    
    for i in 1...n { parent[i] = i }

    for _ in 0..<m {
        let ab = readLine()!.split(separator: " ").map{Int($0)!}
        let (a,b) = (ab[0], ab[1])
        
        if findParent(x: a, parent: &parent) != findParent(x: b, parent: &parent) {
            unionParent(x: a, y: b, parent: &parent)
            nodeCount += 1
        }
    }
    
    print(nodeCount)
}

