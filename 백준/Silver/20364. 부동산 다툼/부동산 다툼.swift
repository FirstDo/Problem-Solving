// 20364번 부동산 다툼

func search(_ start: Int) -> Int {
    var current = start
    var firstBlock = 0
    
    while current != 1 {
        // 이미 막혀있다면 firstBlock 갱신
        if owned.contains(current) {
            firstBlock = current
        }
        
        current /= 2
    }
    
    // 성공적으로 도착했다면, 오리목적지 block
    if firstBlock == 0 {
        owned.insert(start)
    }
    
    return firstBlock
}

// MARK: - 입력

let nq = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, q) = (nq[0], nq[1])

var owned = Set<Int>()
var wanted = [Int]()

for _ in 0..<q {
    wanted.append(Int(readLine()!)!)
}

wanted.forEach { start in
    print(search(start))
}
