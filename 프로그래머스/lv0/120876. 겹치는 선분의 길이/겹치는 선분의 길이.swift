func solution(_ lines:[[Int]]) -> Int {
    let r1 = (lines[0][0]..<lines[0][1]).map { $0 + 100 }
    let r2 = (lines[1][0]..<lines[1][1]).map { $0 + 100 }
    let r3 = (lines[2][0]..<lines[2][1]).map { $0 + 100 }
    
    var array = Array(repeating: 0, count: 300)
    
    [r1, r2, r3].forEach { range in
        range.forEach { value in
            array[value] += 1
        }
    }
    
    return array.filter { $0 >= 2 }.count
}