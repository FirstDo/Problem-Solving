func solve() -> Int {
    _ = Int(readLine()!)!
    
    let crains = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: >)
    _ = Int(readLine()!)!
    var boxes = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: >)
    
    guard boxes.first! <= crains.first! else {
        return -1
    }
    
    var time = 0
    
    while true {
        if boxes.isEmpty {
            break
        }
        
        for crain in crains {
            for (index, boxWeight) in boxes.enumerated() {
                if crain >= boxWeight {
                    boxes.remove(at: index)
                    break
                }
            }
        }
        
        time += 1
    }
    
    return time
}

print(solve())
